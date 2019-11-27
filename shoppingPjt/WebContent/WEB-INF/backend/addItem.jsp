<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<style>
.input-group-text {
	cursor: pointer;
}
</style>
<script>
	var smallCategory;
	var addColorCount = 0;
	var addSizeCount = 0;
	$(document).ready(function() {
		$("#colorAdd").click(function() {
			addColorOrSize('opColorArea');
		});

		$("#sizeAdd").click(function() {
			addColorOrSize('opSizeArea');
		});

		$("#inputDetailImage").change(function() {
			readURL(this, 'detailImage');
		});

		$("#inputMainImage").change(function() {
			readURL(this, 'mainImage');
		});

		$("#submitBtn").click(function() {
			if ($("#category").val() === '')
				alert("대분류를 선택해주세요.");
			else if ($("#smallCategory").val() === '')
				alert("소분류를 선택해주세요.");
			else if ($("#itemName").val().trim() === '')
				alert("상품명을 입력해주세요.");
			else if ($("#inputDetailImage").val() === '')
				alert("상세 이미지를 선택해주세요.");
			else if (isNaN($("#itemPrice").val()))
				alert("상품 가격을 입력해주세요.");
			else if (isNaN($("#itemSaleprice").val()))
				alert("할인가/판매가를 입력해주세요.");
			else if(addColorCount == 0)
				alert("색상은 최소 하나 이상 입력해주세요.");
			else if(addSizeCount == 0)
				alert("사이즈는 최소 하나 이상 입력해주세요.");
			else if ($("#inputMainImage").val() === '')
				alert("메인 이미지를 선택해주세요.");
			else if ($("#itemManufacturer").val().trim() === '')
				alert("제조사를 입력해주세요.");
			else if ($("#itemOrigin").val().trim() === '')
				alert("원산지를 입력해주세요.");
			else if ($("#itemContent").val().trim() === '')
				alert("상품 설명을 입력해주세요.");
			else
				$("#addItemForm").attr("action","./adminAddItemExecute.do").submit();			
		});
	});

	function categoryUpdate(select) {
		if (isNaN(select.value))
			return;

		var smallCategorySelect = '<select class="form-control" id="smallCategory" name="smallCategory">';
		smallCategorySelect += '<option selected="" value="">소분류</option>';

		for (var i = 0; i < smallCategory.length; i++) {
			if (smallCategory[i].categoryHighIdx === select.value)
				smallCategorySelect += '<option value='+smallCategory[i].categoryChkIdx+'>'
						+ smallCategory[i].categoryName + '</option>';
		}
		smallCategorySelect += '</select>';
		$("#smallCategoryArea").html(smallCategorySelect);
	}

	function addColorOrSize(addArea) {
		var varient = (addArea === 'opColorArea') ? addColorCount
				: addSizeCount;
		if (varient < 5) {
			if (addArea === 'opColorArea')
				addColorCount++;
			else
				addSizeCount++;
			var addHtml = '<div class="input-group mb-3 input-group-sm"><div class="input-group-prepend"><button class="input-group-text" onClick=removeColor(this,"'
					+ addArea
					+ '");>제 거</button></div><input type="text" name="'+addArea+'" class="form-control"></div>';
			$("#" + addArea).append(addHtml);
		} else
			alert("더이상 추가할 수 없습니다.");
	}

	// 항목 삭제(사이즈 및 컬러)
	function removeColor(button, addArea) {
		var parent = $(button).parent().parent();
		$(parent).empty();
		$(parent).remove();
		if (addArea === 'opColorArea')
			addColorCount--;
		else
			addSizeCount--;
	}

	// 이미지 미리보기
	function readURL(input, area) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById(area).src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
	function categoryLoad() {
		$
				.ajax({
					url : "./SelectCategoryServlet",
					dataType : "json",
					success : function(data) {
						smallCategory = data.smallCategory;
						var categoryArea = '<select class="form-control" id="category" name="category" onchange="categoryUpdate(this)">';
						categoryArea += '<option selected="" value="">대분류</option>';
						for (var i = 0; i < data.category.length; i++) {
							categoryArea += '<option value='+data.category[i].categoryChkIdx+'>'
									+ data.category[i].categoryName
									+ '</option>';
						}
						categoryArea += "</select>";
						$("#categoryArea").html(categoryArea);
					}
				});
	}

	window.onload = function() {
		categoryLoad();
	}
</script>
<body id="page-top">

	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<h5>상품 등록</h5>
				<hr />
				<p>
				<h6>쇼핑몰에 상품을 진열하는데 필요한 기본정보를 입력합니다.</h6>
				* 모든 항목을 입력해주시기 바랍니다.
				</p>
				<form id="addItemForm" enctype="multipart/form-data" method="post">
					<div class="row">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>상품 카테고리</td>
									<td>
										<div class="row">
											<div class="col-sm-4" id="categoryArea"
												style="margin-left: 15px;"></div>
											<div class="col-sm-4" id="smallCategoryArea">
												<select class="form-control" id="smallCategory"
													name="smallCategory">
													<option value="">소분류</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>상품명</td>
									<td><div class="col-sm-8">
											<input type="text" id="itemName" name="itemName"
												class="form-control" id="usr">
										</div></td>
								</tr>
								<tr>
									<td>상품 판매 상태</td>
									<td>
										<div class="form-check-inline">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="itemStatus" checked=""
												value="1">판매 중
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="itemStatus" value="0">판매
												중지
											</label>
										</div>
									</td>
								</tr>
								<tr style="height: 500px;">
									<td>상품 상세이미지</td>
									<td>
										<div class="row">
											<div class="input-group mb-3 col-sm-8"
												style="margin-left: 15px;">
												<input type="file" id="inputDetailImage"
													class="form-control" name="inputDetailImage">
											</div>
										</div>
										<div class="row">
											<div class="col-sm-3" style="margin-left: 15px;">
												<img id="detailImage"
													src="${pageContext.request.contextPath}/uploadImage/img.png"
													style="width: 250px; height: 250px;">
											</div>
											<div class="col-sm-6">
												- 쇼핑몰의 상품 내의 상세페이지를 등록합니다.<br /> - 권장 이미지 : 1500x * 1000x /
												5M 이하 / jpg(jpeg)
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>원 가</td>
									<td><div class="col-sm-8">
											<input type="text" id="itemPrice" name="itemPrice"
												class="form-control" id="usr">
										</div></td>
								</tr>
								<tr>
									<td>할인가/판매가</td>
									<td><div class="col-sm-8">
											<input type="text" id="itemSaleprice" name="itemSaleprice" class="form-control"
												id="usr">
										</div></td>
								</tr>
								<tr>
									<td>옵션 및 재고</td>
									<td>
										<div class="row">
											<div class="col-sm-2" style="margin-left: 15px;">
												<button id="colorAdd" type="button"
													class="btn btn-secondary">색상 추가</button>
											</div>
											<div class="col-sm-3">
												<div id="opColorArea"></div>
											</div>
											<div class="col-sm-2" style="margin-left: 15px;">
												<button id="sizeAdd" type="button" class="btn btn-secondary">사이즈
													추가</button>
											</div>
											<div class="col-sm-3">
												<div id="opSizeArea"></div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td style="height: 500px;">메인 이미지</td>
									<td><div class="row">
											<div class="input-group mb-3 col-sm-8"
												style="margin-left: 15px;">
												<input type="file" id="inputMainImage" class="form-control"
													name="inputMainImage">
											</div>
										</div>
										<div class="row">
											<div class="col-sm-3" style="margin-left: 15px;">
												<img id="mainImage"
													src="${pageContext.request.contextPath}/uploadImage/img.png"
													style="width: 250px; height: 250px;">
											</div>
											<div class="col-sm-6">
												- 쇼핑몰에 기본으로 보여지는 상품이미지를 등록합니다.<br /> - 대표이미지 등록 시 자동 리사이징
												되어 들어갑니다.<br /> - 권장 이미지 : 500x * 500x / 5M 이하 / jpg(jpeg)
											</div>
										</div></td>
								</tr>
								<tr>
									<td>제조사</td>
									<td><div class="col-sm-8">
											<input type="text" class="form-control"
												name="itemManufacturer" id="itemManufacturer">
										</div></td>
								</tr>
								<tr>
									<td>원산지</td>
									<td><div class="col-sm-8">
											<input type="text" class="form-control" name="itemOrigin"
												id="itemOrigin">
										</div></td>
								</tr>
								<tr>
									<td>판매자 상품 설명</td>
									<td><div class="col-sm-8">
											<textarea class="form-control" rows="5" name="itemContent"
												id="itemContent"></textarea>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div class="row" style="margin-bottom: 200px;">
					<div class="col-sm-7"></div>
					<div class="col-sm-4">
						<button id="submitBtn" class="btn btn-success">상품 등록</button>
					</div>				
				</div>
			</div>
			<hr />
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<%@include file="./include/footer.jsp"%>
		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
</body>

</html>
