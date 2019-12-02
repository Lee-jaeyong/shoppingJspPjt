<%@page import="shopping.database.dto.ItemDTO"%>
<%@page import="shopping.database.dao.ItemDAO"%>
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
	$(document)
			.ready(
					function() {
						$("#btnDeleteItem").click(function(){
							if(confirm("상품 삭제 시 (7일) 동안 삭제 내역에 보관 되며, 이후 되돌릴 수 없습니다. 정말로 삭제하시겠습니까?")){
								$.ajax({
									url : "./DeleteItem.ajax",
									data : {
										data : $("input[name=itemIdx]").val()
									},
									success : function(data){
										if(data === 'true')
										{
											alert("삭제 완료");
											location.href="./adminItemList.admin";										
										}
										else
											alert("삭제 실패");
									}
								});
							}
						});
						
						$("#colorAdd").click(function() {
							addColorOrSize('opColorArea');
						});

						$("#sizeAdd").click(function() {
							addColorOrSize('opSizeArea');
						});

						$("#inputDetailImage").change(function() {
							readURL(this, 'detailImage');
							$("#changeStatus").val("true");
						});

						$("#inputMainImage").change(function() {
							readURL(this, 'mainImage');
						});

						$("#btnAddItem").click(function() {
											var colorChk = new Array();
											var chk = false;
											$("input[name=opColorArea]").each(function() {
												
												if ($(this).val() === '') {
													chk = true;
													return;
												}
												colorChk.push($(this).val());
											})
											var sizeChk = new Array();
											$("input[name=opSizeArea]").each(function() {
																if ($(this)
																		.val() === '') {
																	chk = true;
																	return;
																}
																sizeChk.push($(this).val());
															})
											if (chk) {
												alert("비어있는 색상 또는 사이즈가 존재합니다.");
												return;
											}
											else
											{
												for(var i =0;i<colorChk.length;i++)
												{
													var colorDupChk = colorChk[i];
													for(var j = 0;j<colorChk.length;j++)
													{
														if(i != j && colorDupChk == colorChk[j])
														{
															alert("중복된 색상이 존재합니다.");
															return;
														}
													}
												}
												for(var i =0;i<sizeChk.length;i++)
												{
													var sizeDupChk = sizeChk[i];
													for(var j = 0;j<sizeChk.length;j++)
													{
														if(i != j && sizeDupChk == sizeChk[j])
														{
															alert("중복된 사이즈가 존재합니다.");
															return;
														}
													}
												}												
											}
											
											if ($("#category").val() === '')
												alert("대분류를 선택해주세요.");
											else if ($("#smallCategory").val() === '')
												alert("소분류를 선택해주세요.");
											else if ($("#itemName").val()
													.trim() === '')
												alert("상품명을 입력해주세요.");
											else if ($("#inputDetailImage")
													.val() === '')
												alert("상세 이미지를 선택해주세요.");
											else if (isNaN($("#itemPrice")
													.val()))
												alert("상품 가격을 입력해주세요.");
											else if (isNaN($("#itemSaleprice")
													.val()))
												alert("할인가/판매가를 입력해주세요.");
											else if (addColorCount == 0)
												alert("색상은 최소 하나 이상 입력해주세요.");
											else if (addSizeCount == 0)
												alert("사이즈는 최소 하나 이상 입력해주세요.");
											else if ($("#inputMainImage").val() === '')
												alert("메인 이미지를 선택해주세요.");
											else if ($("#itemManufacturer")
													.val().trim() === '')
												alert("제조사를 입력해주세요.");
											else if ($("#itemOrigin").val()
													.trim() === '')
												alert("원산지를 입력해주세요.");
											else if ($("#itemContent").val()
													.trim() === '')
												alert("상품 설명을 입력해주세요.");
											else if (parseInt($("#itemPrice")
													.val()) < parseInt($(
													"#itemSaleprice").val()))
												alert("할인가가 판매가보다 높습니다.");
											else if ($("#itemPrice").val() === '0'
													|| $("#itemSaleprice")
															.val() === '0')
												alert("상품 판매가 혹은 할인가를 다시 입력해주세요.");
											else
												$("#itemForm")
														.attr("action",
																"./adminAddItemExecute.admin")
														.attr("enctype",
																"multipart/form-data")
														.attr("method", "post")
														.submit();
										});

						$("#btnUpdateItem")
								.click(
										function() {
											if ($("#itemName").val().trim() === '')
												alert("수정할 상품명을 입력해주세요.");
											else if (isNaN($("#itemPrice")
													.val()))
												alert("수정할 상품 가격을 입력해주세요.");
											else if (isNaN($("#itemSaleprice")
													.val()))
												alert("수정할 할인가/판매가를 입력해주세요.");
											else if ($("#itemManufacturer")
													.val().trim() === '')
												alert("수정할 제조사를 입력해주세요.");
											else if ($("#itemOrigin").val()
													.trim() === '')
												alert("수정할 원산지를 입력해주세요.");
											else if ($("#itemContent").val()
													.trim() === '')
												alert("수정할 상품 설명을 입력해주세요.");
											else if (parseInt($("#itemPrice")
													.val()) < parseInt($(
													"#itemSaleprice").val()))
												alert("수정된 할인가가 판매가보다 높습니다.");
											else if ($("#itemPrice").val() === '0'
													|| $("#itemSaleprice")
															.val() === '0')
												alert("수정할 상품 판매가 혹은 할인가를 다시 입력해주세요.");
											else
												$("#itemForm")
														.attr("action",
																"./adminUpdateItemExecute.admin")
														.attr("enctype",
																"multipart/form-data")
														.attr("method", "post")
														.submit();
										});
					});

	function categoryUpdate(select) {
		if (isNaN(select.value))
			return;

		var smallCategorySelect = '<select class="form-control" id="smallCategory" name="smallCategory">';
		smallCategorySelect += '<option selected="" value="">소분류</option>';

		for (var i = 0; i < smallCategory.length; i++) {
			if (smallCategory[i].categoryHighIdx === select.value)
				smallCategorySelect += '<option value=' + smallCategory[i].categoryChkIdx + '>'
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
					+ '");>제 거</button></div><input type="text" name="' + addArea + '" class="form-control"></div>';
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
					url : "./SelectCategory.ajax",
					dataType : "json",
					success : function(data) {
						smallCategory = data.smallCategory;
						var categoryArea = '<select class="form-control" id="category" name="category" onchange="categoryUpdate(this)">';
						categoryArea += '<option selected="" value="">대분류</option>';
						for (var i = 0; i < data.category.length; i++) {
							categoryArea += '<option value=' + data.category[i].categoryChkIdx + '>'
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
	<%
		ItemDTO item = null;
		String itemName = "";
		Long itemPrice = 0L;
		Long itemSalePrice = 0L;
		String itemManufacturer = "";
		String itemOrigin = "";
		String itemContent = "";
	%>
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>

		<div id="content-wrapper">

			<div class="container-fluid">
				<%
					if (request.getAttribute("item") == null) {
				%>
				<div class="jumbotron">
					<h1>상품 등록 시 유의 사항</h1>
					<br />
					<p>- 모든 항목은 필수로 기재해야한다.</p>
					<p>- 색상과 사이즈는 반드시 하나 이상 입력해야한다.</p>
					<p>
						- 상품 등록 후 <strong>[상품 재고]</strong>는 상품 목록 페이지에서 입력해야한다.
					</p>
				</div>
				<hr />
				<!-- Breadcrumbs-->
				<strong>상품 등록</strong>
				<%
					} else {
						item = (ItemDTO) request.getAttribute("item");
						itemName = item.getItemName();
						itemPrice = item.getItemPrice();
						itemSalePrice = item.getItemSalePrice();
						itemManufacturer = item.getItemManufacuter();
						itemOrigin = item.getItemOrigin();
						itemContent = item.getItemContent();
				%>
				<strong>상품 수정</strong>
				<%
					}
				%>
				<hr />
				<p>
				<h6>쇼핑몰에 상품을 진열하는데 필요한 기본정보를 입력합니다.</h6>
				<span class="text-danger">* 모든 항목을 입력해주시기 바랍니다.</span>
				</p>
				<form id="itemForm">
					<div class="row">
						<table class="table table-bordered">
							<tbody>
								<%
									if (item == null) {
								%>
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
								<%
									}
								%>
								<tr>
									<td>상품명</td>
									<td><div class="col-sm-8">
											<input type="text" id="itemName" name="itemName"
												class="form-control" value="<%=itemName%>">
										</div></td>
								</tr>
								<%
									if (request.getAttribute("item") == null) {
								%>
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
								<%
									}
								%>
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
											<div class="col-lg-4" style="margin-left: 15px;">
												<%
													if (item == null) {
												%>
												<img id="detailImage"
													src="${pageContext.request.contextPath}/uploadImage/img.png"
													style="width: 600px; height: 800px;">
												<%
													} else {
												%>
												<img id="detailImage"
													src="${pageContext.request.contextPath}/uploadImage/<%=item.getItemDetailImg() %>"
													style="width: 600px; height: 800px;">
												<%
													}
												%>
											</div>
											<div class="col-sm-6 ml-5 mt-5 text-danger">
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
												class="form-control" value="<%=itemPrice%>">
										</div></td>
								</tr>
								<tr>
									<td>할인가/판매가</td>
									<td><div class="col-sm-8">
											<input type="text" id="itemSaleprice" name="itemSaleprice"
												class="form-control" value="<%=itemSalePrice%>">
										</div></td>
								</tr>
								<%
									if (item == null) {
								%>
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
								<%
									}
								%>
								<tr>
									<td style="height: 500px;">메인 이미지</td>
									<td><div class="row">
											<div class="input-group mb-3 col-sm-8"
												style="margin-left: 15px;">
												<%
													if (item == null) {
												%>
												<input type="file" id="inputMainImage" class="form-control"
													name="inputMainImage">
												<%
													}
												%>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-3" style="margin-left: 15px;">
												<%
													if (item == null) {
												%>
												<img id="mainImage"
													src="${pageContext.request.contextPath}/uploadImage/img.png"
													style="width: 400px; height: 400px;">
												<%
													} else {
												%>
												<img id="mainImage"
													src="${pageContext.request.contextPath}/uploadImage/<%=item.getItemMainImg() %>"
													style="width: 400px; height: 400px;">
												<%
													}
												%>
											</div>
											<div class="col-sm-6 mt-5 text-danger">
												- 쇼핑몰에 기본으로 보여지는 상품이미지를 등록합니다.<br /> - 대표이미지 등록 시 자동 리사이징
												되어 들어갑니다.<br /> - 권장 이미지 : 500x * 500x / 5M 이하 / jpg(jpeg)
											</div>
										</div></td>
								</tr>
								<tr>
									<td>제조사</td>
									<td><div class="col-sm-8">
											<input type="text" class="form-control"
												name="itemManufacturer" id="itemManufacturer"
												value="<%=itemManufacturer%>">
										</div></td>
								</tr>
								<tr>
									<td>원산지</td>
									<td><div class="col-sm-8">
											<input type="text" class="form-control" name="itemOrigin"
												id="itemOrigin" value="<%=itemOrigin%>">
										</div></td>
								</tr>
								<tr>
									<td>판매자 상품 설명</td>
									<td><div class="col-sm-8">
											<textarea class="form-control" rows="5" name="itemContent"
												id="itemContent"><%=itemContent%></textarea>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<%
						if (item != null) {
					%>
					<input type="hidden" name="itemIdx" value="<%=item.getItemIdx()%>" />
					<input type="hidden" id="changeStatus" name="changeStatus"
						value="false" /> <input type="hidden" name="originItemDetailImg"
						value="<%=item.getItemDetailImg()%>" />
					<%
						}
					%>
				</form>
				<div class="row" style="margin-bottom: 200px;">
					<div class="col-sm-6"></div>
					<div class="col-sm-4">
						<%
							if (item == null) {
						%>
						<button id="btnAddItem" class="btn btn-success">상품 등록</button>
						<%
							} else {
						%>
						<button id="btnUpdateItem" class="btn btn-success">상품 수정</button>
						<button id="btnDeleteItem" class="btn btn-danger">상품 삭제</button>
						<%
							}
						%>
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
