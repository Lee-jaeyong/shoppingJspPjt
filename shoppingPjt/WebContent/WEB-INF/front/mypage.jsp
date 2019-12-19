<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<body>
	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">마이페이지</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#home">주문 내역</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#menu1">내가 쓴 리뷰</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#menu2">나의 Q/A</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div id="home" class="container tab-pane active">
						<br>
						<h3>주문 내역</h3>
						<table class="table">
							<thead>
								<tr>
									<th>주문 번호</th>
									<th>상품명</th>
									<th>수 량</th>
									<th>결제 금액</th>
									<th>주문일</th>
									<th>상 태</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="orderListSection">
							</tbody>
						</table>
					</div>
					<div id="menu1" class="container tab-pane fade">
						<br>
					</div>
					<div id="menu2" class="container tab-pane fade">
						<br>
					</div>
				</div>
			</div>
		</div>
		<%@include file="./include/footer.jsp"%>
	</div>
	<%@include file="./include/scriptArea.html"%>
	<!-- The Modal -->
	  <div class="modal fade" id="cencelOrder">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">주문 취소</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
				<div class="form-group">
				  <label for="comment">취소 사유 :</label>
				  <textarea class="form-control" rows="5" id="comment"></textarea>
				</div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" id="btnOrderCencelExecute" class="btn btn-danger">주 문 취 소</button>
	          <button type="button" class="btn btn-danger" data-dismiss="modal">닫 기</button>
	        </div>
	        <input type="hidden" id="orderIdx" value="" />
	      </div>
	    </div>
	  </div>
	<script>
		$(document).ready(function(){
			$("#btnOrderCencelExecute").click(function(){
				if($("#comment").val().trim() === '')
					alert("취소 사유를 입력해주세요.");
				else
					if(confirm("정말 주문을 취소하시겠습니까?"))
					{
						$.ajax({
							url : "./DeleteOrderByUser.aj",
							data : {
								orderIdx:$("#orderIdx").val(),
								comment : $("#comment").val()
							},
							success : function(data){
								alert(data);
								$("#cencelOrder").modal("hide");
								loadMyOrderList();
							}
						});
					}
			});
		});
	
		function loadMyOrderList() {
			$.ajax({
				url : "./SelectMyOrderList.aj",
				dataType : "json",
				success : function(data) {
					var orderList = data.result;
					var orderDates = data.orderDates;
					var orderListSection = '';
					for(var j=0;j<orderDates.length;j++)
					{
						orderListSection += '<tr>';
						orderListSection += '<td colspan=5><label class="btn btn-primary">'+orderDates[j].orderDate+' 날짜 주문 내역입니다.</label></td>';
						orderListSection += '<tr>';
						for(var i=0;i<orderList.length;i++)
						{
							if(orderList[i].orderDate.substring(0,10) === orderDates[j].orderDate)
							{
								orderListSection += '<tr>';
								orderListSection += '<td>'+orderList[i].orderCode+'</td>';
								orderListSection += '<td><label class="btn btn-warning">'+orderList[i].itemName+'</label></td>';
								orderListSection += '<td><label class="btn btn-success">'+orderList[i].totalOrderCount+'건</label></td>';
								orderListSection += '<td><label class="btn btn-primary">'+numberWithCommas(orderList[i].orderTotalSalePrice)+'원</label></td>';
								orderListSection += '<td><strong>'+orderList[i].orderDate+'</strong></td>';
								var status = '<label class="btn btn-secondary">입금 완료</label>';
								var orderRequest = '<button type="button" onclick="cencelOrder(\''+orderList[i].orderCode+'\')" class="btn btn-danger" data-toggle="modal" data-target="#cencelOrder">취 소</button>';
								if(orderList[i].orderStatus == 2)
								{
									status = '<label class="btn btn-warning">배송 완료</label>';
									orderRequest = '<button type="button" class="btn btn-dark">반 품</button>';
								}
								else if(orderList[i].orderStatus == 1)
								{
									status = '<label class="btn btn-success">배송중</label>';
									orderRequest = '';
								}
								orderListSection += '<td>'+status+'</td>';
								orderListSection += '<td>'+orderRequest+'</td>';
								orderListSection += '</tr>';
							}
						}
					}
					$("#orderListSection").html(orderListSection);
				}
			});
		}
		
		function cencelOrder(orderCode)
		{
			$("#orderIdx").val(orderCode);
			$("#comment").text("");
		}
		
		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		window.onload = function(){
			loadMyOrderList();
		};
	</script>
</body>
</html>