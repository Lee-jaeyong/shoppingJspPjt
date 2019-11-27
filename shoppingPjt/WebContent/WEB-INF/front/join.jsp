<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp" %>
<body>

	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
					<div class="row align-items-center">

						<div
							class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
							<form action="" class="site-block-top-search">
								<span class="icon icon-search2"></span> <input type="text"
									class="form-control border-0" placeholder="Search">
							</form>
						</div>

						<div
							class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
							<div class="site-logo">
								<a href="index.html" class="js-logo-clone">Shoppers</a>
							</div>
						</div>

						<div class="col-6 col-md-4 order-3 order-md-3 text-right">
							<div class="site-top-icons">
								<ul>

									<li><a href="#">회원가입</span></a></li>
									<li><a href="#" data-toggle="modal" data-target="#myModal">로그인</a>

										<!-- The Modal -->
										<div class="modal fade" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="modal-header">
														<h4 class="modal-title">로그인</h4>
														<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>

													<!-- Modal body -->
													<div class="modal-body">
														<br> <input type="text" class="form-control"
															id="loginId" name="loginId" placeholder="아이디"><br>
														<input type="text" class="form-control" id="loginPw"
															name="loginPw" placeholder="비밀번호"> <br>
													</div>

													<!-- Modal footer -->
													<div class="modal-footer">
														<button type="button" class="btn btn-primary">Login</button>
													</div>

												</div>
											</div>
										</div></li>

									<li style="display: none;"><a href="#">로그아웃</span></a></li>

									<li><a href="#">마이페이지</span></a></li>
									<li><a href="cart.html" class="site-cart"> <span
											class="icon icon-shopping_cart"></span> <span class="count">2</span>
									</a></li>
									<li class="d-inline-block d-md-none ml-md-0"><a href="#"
										class="site-menu-toggle js-menu-toggle"><span
											class="icon-menu"></span></a></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
			<nav class="site-navigation text-right text-md-center"
				role="navigation">
				<div class="container">
					<ul class="site-menu js-clone-nav d-none d-md-block">
						<li><a href="shop.html">Home</a></li>
						<li class="has-children active"><a href="about.html">BEST10</a>
							<ul class="dropdown">
								<li><a href="#">Menu One</a></li>
								<li><a href="#">Menu Two</a></li>
								<li><a href="#">Menu Three</a></li>
							</ul></li>
						<li class="has-children"><a href="index.html">Shop</a>
							<ul class="dropdown">
								<li><a href="#">Menu One</a></li>
								<li><a href="#">Menu Two</a></li>
								<li><a href="#">Menu Three</a></li>
								<li class="has-children"><a href="#">Sub Menu</a>
									<ul class="dropdown">
										<li><a href="#">Menu One</a></li>
										<li><a href="#">Menu Two</a></li>
										<li><a href="#">Menu Three</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">Review</a></li>
						<li><a href="#">Q&A</a></li>
					</ul>
				</div>
			</nav>

		</header>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="#">JOIN US</a>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">

				<div class="row">
					<div class="col-md-12 mb-12 mb-md-0">
						<h2 class="h3 mb-3 text-black">회원가입</h2>
						<div class="p-3 p-lg-5 border">

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_fname" class="text-black">이름 <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="name" name="c_fname">
									<div id="idMsg"></div>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_fname" class="text-black">아이디 <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="name" name="c_fname">
									<div id="nameMsg"></div>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_fname" class="text-black">비밀번호 <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="name" name="c_fname">
									<div id="pwMsg"></div>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_fname" class="text-black">비밀번호 확인 <span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="name" name="c_fname">
									<div id="pwChkMsg"></div>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-4">
									<label for="c_companyname" class="text-black">전화번호<span
										class="text-danger">*</span></label> <select id="phone1"
										class="form-control">
										<option value="1">010</option>
										<option value="2">070</option>
										<option value="3">011</option>
										<option value="4">016</option>
										<option value="5">017</option>
										<option value="6">018</option>
										<option value="7">019</option>
									</select>

								</div>
								<div class="col-md-4">
									<label for="c_fname" class="text-black">&nbsp;</label> <input
										type="text" class="form-control" id="phone2" name="phone2">
								</div>
								<div class="col-md-4">
									<label for="c_fname" class="text-black">&nbsp;</label> <input
										type="text" class="form-control" id="phone3" name="phone3">
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_companyname" class="text-black">이메일 <span
										class="text-danger">*</span>
									</label> <input type="email" class="form-control" id="email"
										name="email" placeholder="abcd1234@email.com">
									<div id="emailMsg"></div>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_companyname" class="text-black">생년월일 <span
										class="text-danger">*</span>
									</label>
									<div class="row">
										<div class="col-md-4">
											<input type="text" class="form-control" id="birth"
												name="birth" placeholder="주민번호 앞6자리">
										</div>
										<h2>
											<strong>-</strong>
										</h2>
										<div class="col-md-1">
											<input type="text" class="form-control" id="sex" name="sex">
											<!--숫자한자리-->
										</div>
										<h2>
											<strong>●●●●●●</strong>
										</h2>
									</div>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_address" class="text-black">주소 <span
										class="text-danger">*</span></label>
									<div class="row">
										<div class="col-md-2">
											<input type="button" class="btn btn-primary btn-lg btn-block"
												id="serchAddress" value="주소찾기" />
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" id="address"
												name="address" placeholder="주소">
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<input type="text" class="form-control" id="address2"
									placeholder="상세주소">
							</div>
							<br> <input type="button"
								class="btn btn-primary btn-lg btn-block" id="OkJoin"
								value="회원가입" />

						</div>
					</div>

				</div>
				<!-- </form> -->
			</div>
		</div>

		<%@include file="./include/footer.jsp" %>
	</div>

	<%@include file="./include/scriptArea.html" %>

</body>
</html>