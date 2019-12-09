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

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<h4>쇼핑몰 관리</h4>
					</li>
				</ol>

				<div class="row">
					<div class="col-lg-12">
						<div class="card-header">
							<i class="fas fa-chart-area"></i> 지난 주 주문 현황
						</div>
						<div class="card-body">
							<canvas id="myAreaChart" width="100%" height="30"></canvas>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-12">
						<div class="card-header">
							<i class="fas fa-chart-area"></i> 지난 주 주문 현황
						</div>
						<div class="card-body">
							<canvas id="myPieChart" width="100%" height="30"></canvas>
						</div>
					</div>
				</div>

				<!-- 주문 현황 차트 -->
				<div class="row">
					<div class="card mb-3 col-sm-12 col-lg-8">
						<div class="card-header">
							<i class="fas fa-chart-area"></i> 지난 주 주문 현황
						</div>
						<div class="card-body">
							<canvas id="myBarChart" width="100%" height="30"></canvas>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
					<div class="col-sm-12 col-lg-4">
						<h5>상 태</h5>
						<table class="table table-striped" style="height: 200px;">
							<thead>
								<tr>
									<th>상태 변경</th>
									<th style="width: 100px;">건 수</th>
									<th>금 액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>주문 후 입금</td>
									<td>3</td>
									<td class="totalPrice">3</td>
								</tr>
								<tr>
									<td>입금 후 준비</td>
									<td>d</td>
									<td class="totalPrice">4</td>
								</tr>
								<tr>
									<td>준비 및 배송</td>
									<td>d</td>
									<td class="totalPrice">4</td>
								</tr>
								<tr>
									<td>배송 및 완료</td>
									<td>m</td>
									<td class="totalPrice">4</td>
								</tr>
							</tbody>
						</table>
						<div>
							<h5>재고 현황</h5>
							<table class="table table-striped" style="height: 50px;">
								<thead>
									<tr>
										<th>재고 부족 상품</th>
										<th>재고 부족 옵션</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>주문 후 입금</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-primary o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-comments"></i>
								</div>
								<div class="mr-5">주 문(0)</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="#">
								<span class="float-left">주문 내역 보기</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-warning o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-list"></i>
								</div>
								<div class="mr-5">반 품(0)</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="#">
								<span class="float-left">반품 내역 보기</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-success o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-shopping-cart"></i>
								</div>
								<div class="mr-5">취 소(0)</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="#">
								<span class="float-left">취소 내역 보기</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-danger o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-life-ring"></i>
								</div>
								<div class="mr-5">교 환(0)</div>
							</div>
							<a class="card-footer text-white clearfix small z-1" href="#">
								<span class="float-left">교환 내역 보기</span> <span
								class="float-right"> <i class="fas fa-angle-right"></i>
							</span>
							</a>
						</div>
					</div>
				</div>
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-6">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>공지사항</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>John</td>
											</tr>
											<tr>
												<td>Mary</td>
											</tr>
											<tr>
												<td>July</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="col-sm-6">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>아이디</th>
												<th>고객 문의 사항</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>John</td>
												<td>John</td>
											</tr>
											<tr>
												<td>John</td>
												<td>John</td>
											</tr>
											<tr>
												<td>July</td>
												<td>John</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>

				</div>
				<!-- /.container-fluid -->
				<%@include file="./include/footer.jsp"%>
			</div>
			<!-- /.content-wrapper -->

		</div>
	</div>
	<!-- /#wrapper -->
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script src="backend/js/demo/chart-bar-demo.js"></script>
	<script src="backend/js/demo/chart-pie-demo.js"></script>
	<script src="backend/js/demo/chart-area-demo.js"></script>
</body>

</html>
