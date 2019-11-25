<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<script type="text/javascript">
	$(function() {
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<h5>상품 검색</h5>
				<hr>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="tdHead">검색 분류</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-12 col-lg-2 mb-3">
										<select class="form-control" id="sel1" name="sellist1">
											<option selected="">상품명</option>
											<option>상품코드</option>
										</select>
									</div>
									<div class="col-sm-12 col-lg-4">
										<input type="text" class="form-control" id="usr">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tdHead">상품 분류</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-6 col-lg-3">
										<select class="form-control" id="sel1" name="sellist1">
											<option selected="">대분류</option>
										</select>
									</div>
									<div class="col-sm-6 col-lg-3">
										<select class="form-control" id="sel1" name="sellist1">
											<option selected="">소분류</option>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tdHead">상품 등록일</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-6 col-lg-3">
										<input type="text" class="form-control" id="datepicker1">
									</div>
									~
									<div class="col-sm-6 col-lg-3">
										<input type="text" class="form-control" id="datepicker2">
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-3 col-lg-1 mb-4"></div>
					<div class="col-sm-3 col-lg-2 mb-4"></div>
					<div class="col-sm-3 col-lg-3 mb-4">
						<button type="button" class="btn btn-secondary">검 색</button>
						<button type="button" class="btn btn-secondary">전체 보기</button>
						<button type="button" class="btn btn-secondary">엑 셀 다운로드</button>
					</div>
				</div>
				<h5 style="margin-top: 100px;">상품 목록 리스트</h5>
				<hr>
				<div class="row">
					<div class="col-sm-3 col-lg-3 mb-4">
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
					<div class="col-sm-4">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="optradio">판매 중
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="optradio">판매 중지
							</label>
						</div>
						<button type="button" class="btn btn-success">적 용</button>
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
							<th style="width: 50px;">번호</th>
							<th style="width: 100px;">상품 코드</th>
							<th style="width: 50px;">이미지</th>
							<th style="width: 100px;">상품명</th>
							<th style="width: 50px;">사이즈</th>
							<th style="width: 50px;">색 상</th>
							<th style="width: 50px;">판매 상태</th>
							<th style="width: 50px;">판매가</th>
							<th style="width: 50px;">할인가</th>
							<th style="width: 50px;"></th>
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
							<td>john@example.com</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td><button type="button" class="btn btn-light">보 기</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-3">
				<div class="btn-group">
					<button type="button" class="btn btn-info"><</button>
					<button type="button" class="btn btn-info">1</button>
					<button type="button" class="btn btn-info">></button>
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
