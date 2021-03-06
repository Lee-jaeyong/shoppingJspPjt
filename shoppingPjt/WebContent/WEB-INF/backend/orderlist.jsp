<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<hr>
				<strong>주문 검색</strong>
				<hr>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="tdHead" width="400px;">검색 분류</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-2">
										<select class="form-control" id="selectSearchType">
											<option selected="" value="ordercustomer">주문자</option>
											<option value="orderCode">주문 코드</option>
											<option value="itemName">상품명</option>
											<option value="itemCode">상품 코드</option>
										</select>
									</div>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="inputSearch">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tdHead">주문일</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-3">
										<input type="text" class="form-control" readonly="readonly"
											id="datepicker1">
									</div>
									~
									<div class="col-sm-3">
										<input type="text" class="form-control" readonly="readonly"
											id="datepicker2">
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-2"></div>
					<div class="col-sm-3" style="margin-left: 50px;">
						<button id="searchBtn" type="button" class="btn btn-secondary">검
							색</button>
						<button id="cleanSearchBtn" type="button"
							class="btn btn-secondary">초기화</button>
						<button id="getListAllBtn" type="button" class="btn btn-secondary">전체
							보기</button>
					</div>
				</div>
				<br>
				<hr />
				<br>
				<hr />
				<h5 style="margin-top: 100px;">
					주문 목록 리스트 (금일 주문 : <span id="todayOrderCount"></span>건)
				</h5>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<select class="form-control" id="sortType">
							<option selected="" value="orderdate desc">정 렬</option>
							<option value="orderdate">주문일 순</option>
							<option value="orderdate desc">주문일 역순</option>
							<option value="orderTotalSalePrice">주문 가격순</option>
							<option value="oiIdx">주문 번호 순</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="showType">
							<option selected="" value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="showOrderStatus">
							<option value="0">입금 완료</option>
							<option value="1">배송 중</option>
							<option value="2">배송 완료</option>
						</select>
					</div>
					<div class="col-sm-2">
						<button id="btnOrderExcelUpload" type="button"
							class="btn btn-secondary ml-4 mr-5">엑 셀 다운로드</button>
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="excelUploadSelect">
							<option value="0">입금 완료</option>
							<option value="1">배송 중</option>
							<option value="2">배송 완료</option>
						</select>
					</div>
				</div>
			</div>
			<br>
			<!-- 주문 현황 차트 -->
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width: 50px;"></th>
							<th style="width: 70px;">고유 번호</th>
							<th style="width: 50px;">주문 코드</th>
							<th style="width: 70px;">주문 상태</th>
							<th style="width: 50px;">상품명</th>
							<th style="width: 50px;">주문 수</th>
							<th style="width: 50px;">수량</th>
							<th style="width: 50px;">주문자</th>
							<th style="width: 50px;">총 결제액</th>
							<th style="width: 50px;">주문일</th>
						</tr>
					</thead>
					<tbody id="orderSection">
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-sm-5"></div>
				<div class="col-sm-3">
					<div class="btn-group" id="blockBtnArea"></div>
				</div>
			</div>
			<br> <input type="hidden" id="searchExecute" value=""> <input
				type="hidden" id="startDate" value=""> <input type="hidden"
				id="endDate" value=""> <input type="hidden" id="search"
				value=""> <input type="hidden" id="searchType" value="">
			<input type="hidden" id="nowPage" value="0">
			<%@include file="./include/footer.jsp"%>
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content mr-5" style="width: 1000px;">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">주문 정보</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<label for="email">주문자 명</label> <input readonly="readonly"
									type="text" id="orderName" class="form-control">
							</div>
							<div class="form-group">
								<label for="pwd">주문자 휴대폰 번호</label> <input readonly="readonly"
									type="text" id="orderPhone" class="form-control">
							</div>
							<div class="form-group">
								<label for="pwd">주문자 주소</label> <input readonly="readonly"
									type="text" id="orderAddress" class="form-control">
							</div>
							<div class="form-group">
								<label for="comment">배송 요청 사항</label>
								<textarea readonly="readonly" class="form-control" rows="5"
									id="orderRequest"></textarea>
							</div>
						</div>
						<div class="col-lg-6" id="orderInfo"></div>
					</div>
				</div>
				<input type="hidden" id="orderInfoIdx" value="" />
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="deliverySuccess" class="btn btn-dark"
						data-dismiss="modal">배송 완료</button>
					<button type="button" id="deliveryExecute" class="btn btn-success"
						data-dismiss="modal">배송 요청</button>
					<button type="button" id="deliveryCencel" class="btn btn-warning"
						data-dismiss="modal">주문 취소</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫
						기</button>
				</div>

			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#btnOrderExcelUpload").click(function(){
				location.href="./adminOrderListExcelUpload.admin?status="+$("#excelUploadSelect").val();
			});
			
			$("#deliverySuccess").click(function() {
				if (confirm("배송 완료 처리하시겠습니까?"))
					$.ajax({
						url : "./UpdateOrderInfoSuccess.ajax",
						data : {
							orderIdx : $("#orderInfoIdx").val()
						},
						success : function(data) {
							alert(data);
							getOrderList(0);
						}
					});
			});

			$("#deliveryCencel").click(function() {
				if (confirm("정말 주문을 취소하시겠습니까?"))
					$.ajax({
						url : "./DeleteOrderInfo.ajax",
						data : {
							orderIdx : $("#orderInfoIdx").val()
						},
						success : function(data) {
							alert(data);
							getOrderList(0);
						}
					});
			});

			$("#deliveryExecute").click(function() {
				if (confirm("정말 배송상태를 변경하시겠습니까?"))
					$.ajax({
						url : "./UpdateOrderStatus.ajax",
						data : {
							orderIdx : $("#orderInfoIdx").val()
						},
						success : function(data) {
							if (data === 'true') {
								alert("주문 상태 변경 완료");
								getOrderList(0);
							} else
								alert("이미 배송 완료되었거나 준비된 주문입니다.");
						}
					});
			});

			$("#getListAllBtn").click(function() {
				$("#startDate").val("");
				$("#endDate").val("");
				$("#search").val("");
				$("#datepicker1").val("");
				$("#datepicker2").val("");
				$("#inputSearch").val("");
				getOrderList(0);
			});

			$("#cleanSearchBtn").click(function() {
				$("#startDate").val("");
				$("#endDate").val("");
				$("#search").val("");
				$("#datepicker1").val("");
				$("#datepicker2").val("");
				$("#inputSearch").val("");
			});

			$("#searchBtn").click(function() {
				$("#startDate").val($("#datepicker1").val());
				$("#endDate").val($("#datepicker2").val());
				$("#search").val($("#inputSearch").val());
				$("#searchType").val($("#selectSearchType").val());
				getOrderList(0);
			});

			$("#sortType, #showType, #showOrderStatus").change(function() {
				getOrderList(0);
			});

			$("#datepicker1, #datepicker2").datepicker({
				dateFormat : 'yy-mm-dd'
			});
		});
		function getOrderList(page) {
			$("#nowPage").val(page);
			$
					.ajax({
						url : "./SelectOrderList.ajax",
						data : {
							pageNum : page,
							sortType : $("#sortType").val(),
							showType : $("#showType").val(),
							searchType : $("#searchType").val(),
							search : $("#search").val(),
							startDate : $("#startDate").val(),
							endDate : $("#endDate").val(),
							showOrderStatus : $("#showOrderStatus").val()
						},
						dataType : "json",
						success : function(data) {
							var orderSection = '';
							var blockBtnArea = '';
							var orderList = data.result;
							var startBlock = parseInt(data.startBlock);
							var endBlock = parseInt(data.endBlock);
							var totalBlock = parseInt(data.totalBlock);
							for (var i = 0; i < orderList.length; i++) {
								orderSection += '<tr>';
								orderSection += '<td><input type="checkBox" name="" style="width:25px;height:25px;"/></td>';
								orderSection += '<td>' + orderList[i].oiIdx
										+ '</td>';
								orderSection += '<td>' + orderList[i].orderCode
										+ '</td>';
								var orderStatus = "";
								if (orderList[i].orderStatus == 0)
									orderStatus = '<label class="btn btn-danger">입금 완료</label>';
								else if (orderList[i].orderStatus == 1)
									orderStatus = '<label class="btn btn-primary">배송 중</label>';
								else if (orderList[i].orderStatus == 2)
									orderStatus = '<label class="btn btn-dark">배송 완료</label>';
								orderSection += '<td>' + orderStatus + '</td>';
								var relationOrder = "";
								if (orderList[i].relationOrder > 1)
									relationOrder = '<strong><label class="btn btn-primary"><strong>(외 : '
											+ orderList[i].relationOrder
											+ ' 건)</strong></label>';
								orderSection += '<td><label class="btn btn-warning mr-2"><strong>'
										+ orderList[i].itemName.substring(0, 5)
										+ '...</strong></label>'
										+ relationOrder + '</td>';
								orderSection += '<td><button type="button" data-toggle="modal" data-target="#myModal" onclick="getOrderInfo('
										+ orderList[i].oiIdx
										+ ');" class="btn btn-success">상세 보기</button></td>';
								orderSection += '<td>'
										+ orderList[i].orderCount + '건</td>';
								orderSection += '<td>'
										+ orderList[i].orderCustomer + '</td>';
								orderSection += '<td><label class="btn btn-info"><strong>'
										+ numberWithCommas(orderList[i].orderTotalSalePrice)
										+ '원</strong></label></td>';
								orderSection += '<td>' + orderList[i].orderdate
										+ '</td>';
								orderSection += '</tr>';
							}
							$("#orderSection").html(orderSection);
							if (startBlock == 0)
								blockBtnArea += '<button type="button" class="btn btn-info" disabled><</button>';
							else
								blockBtnArea += '<button type="button" class="btn btn-info"><</button>';
							for (var i = startBlock; i < endBlock; i++) {
								if ($("#nowPage").val() == i)
									blockBtnArea += '<button type="button" class="btn btn-info" disabled>'
											+ (i + 1) + '</button>';
								else
									blockBtnArea += '<button onclick="getOrderList('
											+ i
											+ ')" type="button" class="btn btn-info">'
											+ (i + 1) + '</button>';
							}
							if (endBlock == totalBlock)
								blockBtnArea += '<button type="button" class="btn btn-info" disabled>></button>';
							else
								blockBtnArea += '<button type="button" class="btn btn-info">></button>';
							$("#blockBtnArea").html(blockBtnArea);
							$("#todayOrderCount").text(data.todayOrderCount);
						}
					});
		}

		function getOrderInfo(orderIdx) {
			$("#orderInfoIdx").val(orderIdx);
			$
					.ajax({
						url : "./SelectOrderInfo.ajax",
						data : {
							orderIdx : orderIdx
						},
						dataType : "json",
						success : function(data) {
							var order = data.result;
							$("#orderName").val(order[0].orderCustomer);
							$("#orderPhone").val(order[0].orderCustomerPhone);
							$("#orderAddress").val(order[0].orderAddress);
							$("#orderRequest").val(
									order[0].orderCustomerRequest);
							var orderInfo = '';
							for (var i = 0; i < order.length; i++) {
								orderInfo += '<div class="input-group mb-3">';
								orderInfo += '<input type="text" class="form-control" readonly="readonly" value="'+order[i].itemName+'">';
								orderInfo += '<div class="input-group-append"><span class="input-group-text">상품명</span></div></div>';
								orderInfo += '<div class="input-group mb-3">';
								orderInfo += '<input type="text" class="form-control" readonly="readonly" value="'+order[i].opSize+'-'+order[i].opColor+'">';
								orderInfo += '<div class="input-group-append"><span class="input-group-text">옵 션</span></div>';
								orderInfo += '<input type="text" class="form-control" readonly="readonly" value="'+order[i].orderCount+'">';
								orderInfo += '<div class="input-group-append"><span class="input-group-text">수 량</span></div></div><hr/>';
							}
							$("#orderInfo").html(orderInfo);
						}
					});
		}

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		window.onload = getOrderList(0);
	</script>
</body>
</html>
