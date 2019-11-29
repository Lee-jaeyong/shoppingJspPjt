<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<script type="text/javascript">
	const ctx = window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));

	function btnDeleteCencel(button){
		$.ajax({
			url : "./UpdateDeleteItemCencel",
			data : {
				itemIdx : $(button).parents("tr").children().first().text()
			},
			success : function(data){
				if(data === 'true')
				{
					alert("삭제 취소 완료");
					getDeleteItemList(0);					
				}
				else
					alert("삭제 취소 실패");
			}
		});
	}
	
	function getDeleteItemList(pageNum) {
		$.ajax({
			url : "./SelectDeleteItemList",
			dataType : "json",
			success : function(data) {
				var itemList = data.result;
				var itemSection = "";
				for(var i =0;i<itemList.length;i++)
				{
					itemSection += "<tr>";
					itemSection += "<td>"+itemList[i].itemIdx+"</td>";
					itemSection += "<td>"+itemList[i].itemCode+"</td>";
					itemSection += "<td><img src='"+(ctx +"/uploadImage/"+ itemList[i].itemMainImg)+" 'style='width: 100px; height: 100px;'></td>";
					itemSection += "<td>"+itemList[i].itemName+"</td>";
					itemSection += "<td>"+itemList[i].itemPrice+"</td>";
					itemSection += "<td>"+itemList[i].itemSalePrice+"</td>";
					itemSection += "<td>"+itemList[i].removeDate+"</td>";
					itemSection += "<td>"+itemList[i].removeExecuteDate+"</td>";
					itemSection += '<td><button onclick="btnDeleteCencel(this);" class="btn btn-info">삭제 취소</button></td>';
					itemSection += "</tr>";
				}
				$("#itemSection").html(itemSection);
			}
		});
	}

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	window.onload = function() {
		getDeleteItemList(0);
	}
</script>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<div class="jumbotron">
					<h1>상품 삭제</h1>
					<br />
					<p>
						- 삭제한 상품은 모두 <strong>[삭제일 기준 일주일]</strong> 동안 이곳에 보관되며, <strong>일주일
							후 삭제 처리</strong>됩니다.
					</p>
					<p>
						- 삭제된 상품은 <strong>[복구]가 불가능</strong>합니다.
					</p>
					<p>
						- 삭제 취소 시 해당상품은 <strong>[판매 중지]</strong> 상태로 변경됩니다.
					</p>
				</div>
				<hr />
				<hr>
				<strong>삭제 내역</strong>
				<hr>
			</div>
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width: 100px;">번 호</th>
							<th style="width: 100px;">상품 코드</th>
							<th style="width: 50px;">이미지</th>
							<th style="width: 100px;">상품명</th>
							<th style="width: 50px;">판매가</th>
							<th style="width: 50px;">할인가</th>
							<th style="width: 50px;">삭제일</th>
							<th style="width: 50px;">삭제 처리일</th>
							<th style="width: 50px;"></th>
						</tr>
					</thead>
					<tbody id="itemSection">
					</tbody>
				</table>
			</div>
			<div class="row mt-2">
				<div class="col-lg-5"></div>
				<div class="col-lg-3 mb-5">
					<div class="btn-group" id="pageArea"></div>
				</div>
			</div>
			<%@include file="./include/footer.jsp"%>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@include file="./include/scrollTop.html"%>

	<%@include file="./include/scriptArea.html"%>
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">옵션 및 재고</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" id="itemOption"></div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="itemStockUpdate" type="button" class="btn btn-danger"
						data-dismiss="modal">재고 수정</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">확
						인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫
						기</button>
				</div>

			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="updateModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">메인 이미지 변경</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6">
							<span class="text-danger">* 변경 전 이미지</span> <img src=""
								id="beforeMainImg" style="width: 200px; height: 200px;" />
						</div>
						<div class="col-lg-6">
							<form id="changeImgForm" method="post"
								enctype="multipart/form-data">
								<div class="input-group mb-3">
									<input id="inputChangeMainImg" name="inputChangeMainImg"
										type="file" class="form-control">
								</div>
								<input type="hidden" id="inputChangeMainImgIdx"
									name="inputChangeMainImgIdx" value="" /> <input type="hidden"
									id="originMainImg" name="originMainImg" value="" />
							</form>
							* 변경 후 이미지 <img
								src="${pageContext.request.contextPath}/uploadImage/img.png"
								id="changeMainImg" style="width: 200px; height: 150px;">
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="btnChangeMainImg" type="button" class="btn btn-danger"
						data-dismiss="modal">변 경</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫
						기</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="nowPageNum" value="0" />
	<input type="hidden" id="searchItemType" value="" />
	<input type="hidden" id="searchItemTitle" value="" />
	<input type="hidden" id="searchItemSmallCategory" value="" />
	<input type="hidden" id="searchItemBefore" value="" />
	<input type="hidden" id="searchItemAfter" value="" />
	<input type="hidden" id="searchItemStatus" value="-1" />
	<form id="showItemInfo">
		<input type="hidden" id="showItemInfoIdx" name="showItemInfoIdx"
			value="" />
	</form>
</body>
</html>
