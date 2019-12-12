<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<div class="jumbotron">
					<h1>이벤트 관리</h1>
					<br />
					<p>
						- 이벤트는 최대 <strong>[3개]</strong> 까지 등록가능합니다.
					</p>
				</div>
				<hr />
				<div class="row">
					<div class="col-lg-2">
						<strong>현재 진행중인 이벤트</strong>
					</div>
				</div>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>이벤트 번호</th>
								<th>제 목</th>
								<th>이미지</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-2">
						<strong>이벤트 목록</strong>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-6">
						<button type="button" class="btn btn-success btn-block"
							onclick="location.href='./adminAddEvent.admin'">등 록</button>
					</div>
				</div>
				<hr>
			</div>
			<div class="row"></div>
			<div class="col-lg-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>이벤트 번호</th>
							<th>제 목</th>
							<th>이미지</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div id="pageArea" class="mb-5"></div>
			</div>
			<%@include file="./include/footer.jsp"%>
		</div>
	</div>
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script>
		
	</script>
</body>
</html>
