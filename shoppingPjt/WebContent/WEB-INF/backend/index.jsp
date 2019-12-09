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
				<hr />
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<h4>쇼핑몰 관리</h4>
					</li>
				</ol>

				<div class="row">
					<div class="col-lg-12">
						<div class="card-header">
							<div class="row">
								<div class="col-lg-2">
									<i class="fas fa-chart-area"></i> 실시간 주문 건 수
								</div>
								<div class="col-lg-3">
									<input type="text" class="form-control" value="날짜를 선택하세요"
										readonly="readonly" id="datepicker1">
								</div>
								<div class="col-lg-1">
									<button id="btnSelectTodayChart" type="button"
										class="btn btn-secondary">검 색</button>
								</div>
								<button id="btnTodayChart" type="button" class="btn btn-info">오늘
									매출 보기</button>
							</div>
						</div>
						<div class="card-body" id="areaChart">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card-header">
							<i class="fas fa-chart-area"></i> 연령대 매출 현황
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
						<h5>
							<label class="btn btn-secondary btn-block"><strong>상
									태</strong></label>
						</h5>
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
									<td id="orderStats0"></td>
									<td id="orderStatus0Total" class="totalPrice"></td>
								</tr>
								<tr>
									<td>준비 및 배송</td>
									<td id="orderStats1"></td>
									<td id="orderStatus1Total" class="totalPrice"></td>
								</tr>
								<tr>
									<td>배송 및 완료</td>
									<td id="orderStats2"></td>
									<td id="orderStatus2Total" class="totalPrice"></td>
								</tr>
							</tbody>
						</table>
						<div>
							<h5>
								<label class="btn btn-primary btn-block"><strong>재고
										현황(5개 이하)</strong></label>
							</h5>
							<table class="table table-striped" style="height: 50px;">
								<thead>
									<tr>
										<th>재고 부족 옵션</th>
										<th id=""></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="lackStock"></td>
										<td><button id="btnShowLackOptions" data-toggle="modal" data-target="#myModal"
												type="button" class="btn btn-secondary">보 기</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-4 col-sm-6 mb-3">
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
					<div class="col-xl-4 col-sm-6 mb-3">
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
					<div class="col-xl-4 col-sm-6 mb-3">
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
					</div>

				</div>
				<!-- /.container-fluid -->
				<%@include file="./include/footer.jsp"%>
			</div>
			<!-- /.content-wrapper -->

		</div>
	</div>

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">재고 부족 옵션</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="overflow: auto; height: 400px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번 호</th>
								<th>상품명</th>
								<th>옵 션 및 재고</th>
								<th>재 고</th>
							</tr>
						</thead>
						<tbody id="lackOptionList">
						</tbody>
					</table>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫 기</button>
				</div>

			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div class="modal fade" id="optionModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">수 정</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">상품명</span>
					    </div>
					    <input type="text" class="form-control" readonly="readonly" id="updateStockItemName">
				  	</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">옵 션</span>
					    </div>
					    <input type="text" class="form-control" readonly="readonly" id="updateStockItemOption">
				  	</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">수정 전 재고</span>
					    </div>
					    <input type="text" class="form-control" readonly="readonly" id="updateStockBefore">
				  	</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">수정 후 재고</span>
					    </div>
					    <input type="text" class="form-control" id="updateStockAfter">
				  	</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="btnUpdateStockExecute" type="button" class="btn btn-danger" data-dismiss="modal">수 정</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">취 소</button>
				</div>
			</div>
			<input type="hidden" value="" id="updateStockIdx"/>
		</div>
	</div>

	<!-- /#wrapper -->
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script src="backend/js/demo/chart-bar-demo.js"></script>
	<script src="backend/js/demo/chart-pie-demo.js"></script>
	<script src="backend/js/demo/chart-area-demo.js"></script>
	<script>
		$(document).ready(function() {
			$("#btnUpdateStockExecute").click(function(){
				if($("#updateStockIdx").val() === '' || $("#updateStockAfter").val() === '')
				{
					alert("재고를 입력해주세요.");
					return;
				}
				$.ajax({
					url : "./UpdateStockfromIndex.ajax",
					data : {
						opIdx : $("#updateStockIdx").val(),
						stock : $("#updateStockAfter").val()
					},
					success : function(data){
						alert(data);
						showlackOptionList();
					}
				});
			});
			
			$("#btnShowLackOptions").click(function(){
				showlackOptionList();
			});
			
			$("#datepicker1").datepicker({
				dateFormat : 'yy-mm-dd'
			});

			$("#btnTodayChart").click(function() {
				selectAreaChart('');
			});

			$("#btnSelectTodayChart").click(function() {
				if ($("#datepicker1").val() === '날짜를 선택하세요') {
					alert("날짜를 지정해주세요");
					return;
				}
				selectAreaChart($("#datepicker1").val());
			});
		});

		function showlackOptionList(){
			$.ajax({
				url : "./SelectLackOptionss.ajax",
				dataType : "json",
				success : function(data){
					var lackOptionSection = '';
					var lackOption = data.result;
					for(var i= 0;i<lackOption.length;i++)
					{
						lackOptionSection += "<tr>";
						lackOptionSection += "<td>"+lackOption[i].opIdx+"</td>";
						lackOptionSection += "<td>"+lackOption[i].itemName+"</td>";
						lackOptionSection += "<td>"+lackOption[i].opSize+" - "+lackOption[i].opColor+"</td>";
						lackOptionSection += "<td>"+lackOption[i].opStock+"</td>";
						lackOptionSection += '<td><button type="button" onclick="updateStock('+lackOption[i].opIdx+',\''+lackOption[i].itemName+'\',\''+lackOption[i].opSize+'\',\''+lackOption[i].opColor+'\',\''+lackOption[i].opStock+'\')" data-toggle="modal" data-target="#optionModal" class="btn btn-primary">수정</button></td>';
						lackOptionSection += "</tr>";
					}
					$("#lackOptionList").html(lackOptionSection);
				}
			});
		}
		
		function lackStockInfo() {
			$.ajax({
				url : "./LackStockInfo.ajax",
				success : function(data) {
					$("#lackStock").html(data + "개");
				}
			});
		}
		
		function updateStock(opIdx,itemName,opSize,opColor,stock){
			$("#updateStockIdx").val(opIdx);
			$("#updateStockItemName").val(itemName);
			$("#updateStockItemOption").val(opSize + " - " + opColor);
			$("#updateStockBefore").val(stock);
		}
		
		function loadStatus() {
			$.ajax({
				url : "SelectTotalOrderInfo.ajax",
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.result.length; i++) {
						$("#orderStatus" + i + "Total").html(
								numberWithCommas(data.result[i].total) + "원");
						$("#orderStats" + i).html(data.result[i].count + "건");
					}
				}
			});
		}

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		window.onload = function() {
			loadStatus();
			lackStockInfo();
			selectAreaChart('');
		}
	</script>
</body>

</html>
