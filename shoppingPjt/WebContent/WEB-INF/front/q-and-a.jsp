<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp" %>
<body>

	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>


		<div class="site-section">
			<div class="container">

				<div class="row mb-1">
					<div class="col-md-12 order-2">
						<div class="row">
							<div class="col-md-3">
								<form action="" class="site-block-top-search">
									<span class="icon icon-search2"></span> <input type="text"
										class="form-control border-0" placeholder="Search">
								</form>
							</div>
							<div class="col-md-7"></div>
							<div class="col-md-2">
								<input type="button" class="btn btn-primary btn-sm" id="OkJoin"
									value="문의하기" />

							</div>

						</div>
						<br>
						<div class="row mb-4">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Firstname</th>
										<th>Lastname</th>
										<th>Email</th>
										<th>index</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>John</td>
										<td>Doe</td>
										<td>john@example.com</td>
										<td>Doe</td>
									</tr>
									<tr>
										<td>Mary</td>
										<td>Moe</td>
										<td>Doe</td>

										<td>mary@example.com</td>
									</tr>
									<tr>
										<td>July</td>
										<td>Dooley</td>
										<td>Doe</td>
										<td>july@example.com</td>
									</tr>

								</tbody>
							</table>
						</div>
						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul>
										<li><a href="#">&lt;</a></li>
										<li class="active"><span>1</span></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&gt;</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>




				</div>
			</div>



		</div>
	</div>

	<%@include file="./include/footer.jsp" %>
	</div>

	<%@include file="./include/scriptArea.html" %>

</body>
</html>