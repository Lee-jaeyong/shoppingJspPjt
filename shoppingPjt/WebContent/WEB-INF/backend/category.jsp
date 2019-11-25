<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<script type="text/javascript">
	$(function() {
		$("#btnCategoryAdd")
				.click(
						function() {
							var categoryArea = '<div id="categorySection"><input type="hidden" value="a"/><div class="mb-4">대 카테고리 추가<button class="mb-4" onclick=a(this)>소 카테고리 추가</button><div></div></div></div>';
							$("#categoryArea").append(categoryArea);
						});
	});

	function a(element) {
		var smallCategoryArea = '<div class="input-group mb-3"><input type="text" class="form-control" placeholder="Search"><div class="input-group-append"><button class="btn btn-success" type="submit">Go</button> </div></div>';
		$(element).next().append(smallCategoryArea);
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
				<h5>분류 관리</h5>
				<hr>
				<div class="row">
					<div class="col-lg-6">
						* 상품 분류 설정
						<div class="jumbotron">
							<button id="btnCategoryAdd" type="button"
								class="btn btn-info mb-3">대분류 추가</button>
							<button type="button" class="btn btn-info mb-3">삭 제</button>
							<div id="categoryArea" class="jumbotron bg-light"></div>
						</div>
					</div>
					<div class="col-lg-6"></div>
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
