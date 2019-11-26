<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<script type="text/javascript">
	$(function() {
		$("#addCategoryBtn").click(function() {
			$.ajax({
				url : "./AddCategoryServlet",
				data : {
					categoryName : $("#inputCategoryName").val()
				},
				success : function(data) {
					alert(data);
				}
			});
		});

		$("#smallCategoryAddBtn").click(
				function() {
					$("#addCategoryType").html("<h4>* 소 카테고리 추가</h4>");
					$("#spanAddCategory").html("소 카테고리 명");
					$("#categoryType").val(
							$(this).parents().prev().prev().val());
					$(this).parents().parents().next("ul").append(
							'<div class="input-group mb-3 input-group-sm col-lg-8"><div class="input-group-prepend"><span class="input-group-text">+</span></div><input type="text" class="form-control" disabled="disabled"></div>');
				});

		$("#btnCategoryAdd").click(function() {
			$("#addCategoryType").html("<h4>* 대 카테고리 추가</h4>");
			$("#spanAddCategory").html("대 카테고리 명");
			$("#categoryType").val("");
		});
	});
</script>
<style>
ul {
	list-style: none;
}
</style>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<h5>분류 관리</h5>
				<hr>
				<div class="row">
					<div class="col-lg-6">
						* 상품 분류 설정
						<div class="jumbotron">
							<button id="btnCategoryAdd" type="button"
								class="btn btn-info mb-3">대 카테고리 추가</button>
							<button id="btnCategoryAdd" type="button"
								class="btn btn-info mb-3">판매 상태 변경</button>
							<button type="button" class="btn btn-info mb-3">삭 제</button>
							<div id="categoryArea" class="jumbotron bg-light">
								<ul>
									<li class="mb-2">
										<div class="input-group mb-3 col-lg-8">
											<input type="hidden" value="1" /> <input type="text"
												class="form-control" value="상의" disabled="disabled">
											<div class="input-group-append">
												<button id="smallCategoryAddBtn" class="input-group-text">+</button>
											</div>
										</div>
										<ul>
										</ul>
									</li>
									<br />
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div id="addCategoryType">
							<h4>*대 카테고리 추가</h4>
						</div>
						<hr />
						<div class="jumbotron">
							<div class="jumbotron bg-light">
								<div class="row">
									<div class="input-group mb-3 col-lg-8">
										<div class="input-group-prepend">
											<span id="spanAddCategory" class="input-group-text">대
												카테고리 명</span>
										</div>
										<input type="hidden" id="categoryType" value="" /> <input
											id="inputCategoryName" type="text" class="form-control">
									</div>
									<div class="col-lg-3">
										<button id="addCategoryBtn" type="button"
											class="btn btn-success">저 장</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="./include/footer.jsp"%>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@include file="./include/scrollTop.html"%>

	<%@include file="./include/scriptArea.html"%>

</body>

</html>
