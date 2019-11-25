<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<style>
.input-group-text {
	cursor: pointer;
}
</style>
<script>
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
			readURL(this);
		});
	});
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
					+ '");>제 거</button></div><input type="text" class="form-control"></div>';
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
	function readURL(input) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("detailImage").src = e.target.result;
		};
		reader.readAsDataURL(this.files[0]);
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
				<div class="row">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>상품 코드</td>
								<td><div class="col-sm-8">
										<input type="text" class="form-control" id="usr">
									</div></td>
							</tr>
							<tr>
								<td>상품 카테고리</td>
								<td>
									<div class="row">
										<div class="col-sm-4" style="margin-left: 15px;">
											<select class="form-control" id="sel1" name="sellist1">
												<option selected="">대분류</option>
											</select>
										</div>
										<div class="col-sm-4">
											<select class="form-control" id="sel1" name="sellist1">
												<option selected="">소분류</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><div class="col-sm-8">
										<input type="text" class="form-control" id="usr">
									</div></td>
							</tr>
							<tr>
								<td>상품 판매 상태</td>
								<td>
									<div class="form-check-inline">
										<label class="form-check-label"> <input type="radio"
											class="form-check-input" name="optradio" checked="">판매
											중
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> <input type="radio"
											class="form-check-input" name="optradio">판매 중지
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
											<input type="file" id="inputDetailImage" class="form-control">
										</div>
									</div>
									<div class="row">
										<div class="col-sm-3" style="margin-left: 15px;">
											<img id="detailImage" src="icon.png"
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
										<input type="text" class="form-control" id="usr">
									</div></td>
							</tr>
							<tr>
								<td>할인가/판매가</td>
								<td><div class="col-sm-8">
										<input type="text" class="form-control" id="usr">
									</div></td>
							</tr>
							<tr>
								<td>옵션 및 재고</td>
								<td>
									<div class="row">
										<div class="col-sm-2" style="margin-left: 15px;">
											<button id="colorAdd" type="button" class="btn btn-secondary">색상
												추가</button>
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
											<input type="text" class="form-control" disabled="">
											<div class="input-group-append">
												<span class="input-group-text">이미지 등록</span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-3" style="margin-left: 15px;">
											<img src="icon.png" style="width: 250px; height: 250px;">
										</div>
										<div class="col-sm-6">
											- 쇼핑몰에 기본으로 보여지는 상품이미지를 등록합니다.<br /> - 대표이미지 등록 시 자동 리사이징 되어
											들어갑니다.<br /> - 권장 이미지 : 500x * 500x / 5M 이하 / jpg(jpeg)
										</div>
									</div></td>
							</tr>
							<tr>
								<td>제조사</td>
								<td><div class="col-sm-8">
										<input type="text" class="form-control" id="usr">
									</div></td>
							</tr>
							<tr>
								<td>원산지</td>
								<td><div class="col-sm-8">
										<input type="text" class="form-control" id="usr">
									</div></td>
							</tr>
							<tr>
								<td>판매자 상품 설명</td>
								<td><div class="col-sm-8">
										<textarea class="form-control" rows="5" id="comment"></textarea>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<hr />
			<div class="row" style="margin-bottom: 200px;">
				<div class="col-sm-7"></div>
				<div class="col-sm-4">
					<button type="button" class="btn btn-success">상품 등록</button>
				</div>
			</div>
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
