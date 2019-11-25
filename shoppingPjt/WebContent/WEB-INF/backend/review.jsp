<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html" %>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>

		<div id="content-wrapper">
			<div class="container-fluid">
				<h5>상품 후기 관리</h5>
				<hr>
				<div class="row">
					<div class="col-sm-1">
						<label for="sel1" style="margin-top: 5px; margin-left: 10px;">상품
							검색 :</label>
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="sel1" name="sellist1">
							<option>대분류</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="sel1" name="sellist1">
							<option>소분류</option>
						</select>
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-2">
						<select class="form-control" id="sel1" name="sellist1">
							<option>상품명</option>
						</select>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							<input type="text" class="form-control">
							<div class="input-group-append">
								<span class="input-group-text">@</span>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-10">
						<button type="button" class="btn btn-outline-secondary">삭
							제</button>
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="sel1" name="sellist1">
							<option>등록일 순</option>
						</select>
					</div>
				</div>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>선택</th>
								<th>상품명</th>
								<th>후 기</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" class="form-check-input"
									value=""></td>
								<td>Doe</td>
								<td>Doe</td>
								<td>Doe</td>
								<td>john@example.com</td>
							</tr>
							<tr>
								<td><input type="checkbox" class="form-check-input"
									value=""></td>
								<td>Moe</td>
								<td>Moe</td>
								<td>Moe</td>
								<td>john@example.com</td>
							</tr>
							<tr>
								<td><input type="checkbox" class="form-check-input"
									value=""></td>
								<td>Dooley</td>
								<td>july@example.com</td>
								<td>Dooley</td>
								<td>john@example.com</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-sm-5"></div>
					<div class="col-sm-3">
						<div class="btn-group">
							<button type="button" class="btn btn-info"><</button>
							<button type="button" class="btn btn-info">1</button>
							<button type="button" class="btn btn-info">></button>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 30px;">
					<div class="col-sm-12">
						<div class="jumbotron">
							<h3>도움말</h3>
							<p>- 상품 후기 보기 삭제가 가능합니다.</p>
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
