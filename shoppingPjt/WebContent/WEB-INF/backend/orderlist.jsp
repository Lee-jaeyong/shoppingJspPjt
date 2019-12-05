<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<h5>주문 검색</h5>
				<hr>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="tdHead" width="400px;">검색 분류</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-2">
										<select class="form-control" id="sel1" name="sellist1">
											<option selected="">주문자</option>
											<option>주문 코드</option>
											<option>아이디</option>
											<option>상품명</option>
											<option>상품 코드</option>
											<option>수령자</option>
											<option>입금자</option>
										</select>
									</div>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="usr">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tdHead">주문일</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-3">
										<input type="text" class="form-control" id="datepicker1">
									</div>
									~
									<div class="col-sm-3">
										<input type="text" class="form-control" id="datepicker2">
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
						<button type="button" class="btn btn-secondary">검 색</button>
						<button type="button" class="btn btn-secondary">초기화</button>
						<button type="button" class="btn btn-secondary">전체 보기</button>
					</div>
				</div>
				<h5 style="margin-top: 100px;">주문 목록 리스트 (금일 주문 : 0건)</h5>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<select class="form-control" id="sel1" name="sellist1">
							<option selected="">정 렬</option>
							<option>등록일 순</option>
							<option>등록일 역순</option>
							<option>판매 가격순</option>
							<option>판매 많은 순</option>
						</select>
					</div>
					<div class="col-sm-3">
						<select class="form-control" id="sel1" name="sellist1">
							<option selected="">10개씩 보기</option>
							<option>20개씩 보기</option>
							<option>30개씩 보기</option>
						</select>
					</div>
					<div class="col-sm-2">
						<div class="row">
							<select class="form-control" id="sel1" name="sellist1">
								<option selected="">상품 이미지 미출력</option>
								<option>상품 이미지 출력</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<br>
			<!-- 주문 현황 차트 -->
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width: 50px;">번호</th>
							<th style="width: 100px;">일련번호</th>
							<th style="width: 50px;">주문상태</th>
							<th style="width: 100px;">클레임상태</th>
							<th style="width: 50px;">입금 상태</th>
							<th style="width: 50px;">상품명</th>
							<th style="width: 50px;">옵 션</th>
							<th style="width: 50px;">수 량</th>
							<th style="width: 50px;">주문자</th>
							<th style="width: 50px;">수령자</th>
							<th style="width: 50px;">판매가</th>
							<th style="width: 50px;">배송비</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkBox" name="" /></td>
							<td>John</td>
							<td>Doe</td>
							<td>john@</td>
							<td>John</td>
							<td>Doe</td>
							<td>Doe</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td><button type="button" class="btn btn-light">보 기</button></td>
						</tr>
						<tr>
							<td><input type="checkBox" name="" /></td>
							<td>John</td>
							<td>Doe</td>
							<td>john@</td>
							<td>John</td>
							<td>John</td>
							<td>Doe</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td><button type="button" class="btn btn-light">보 기</button></td>
						</tr>
						<tr>
							<td><input type="checkBox" name="" /></td>
							<td>John</td>
							<td>Doe</td>
							<td>john@</td>
							<td>John</td>
							<td>John</td>
							<td>John</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td><button type="button" class="btn btn-light">보 기</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-sm-5"></div>
				<div class="col-sm-3">
					<div class="btn-group">
						<button type="button" class="btn btn-info"><</button>
						<button type="button" class="btn btn-info" disabled="">1</button>
						<button type="button" class="btn btn-info">2</button>
						<button type="button" class="btn btn-info">3</button>
						<button type="button" class="btn btn-info">4</button>
						<button type="button" class="btn btn-info">5</button>
						<button type="button" class="btn btn-info">></button>
					</div>
				</div>
			</div>
			<br>
			<%@include file="./include/footer.jsp"%>
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script>
		function getOrderList(page){
			$.ajax({
				url : "./SelectOrderList.ajax",
				data : {
					pageNum : page
				},
				dataType:"json",
				success:function(data){
					alert(data);
				}
			});
		}
	</script>
</body>
</html>
