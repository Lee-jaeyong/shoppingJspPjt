<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
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
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Tank Top T-Shirt</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<img src="front/images/cloth_1.jpg" alt="Image" class="img-fluid">
					</div>
					<div class="col-md-6">
						<h2 class="text-black">Tank Top T-Shirt</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores
							iusto! Molestiae expedita veritatis nesciunt doloremque sint
							asperiores fuga voluptas, distinctio, aperiam, ratione dolore.</p>

						<p>
							<strong class="text-primary h4">$50.00</strong>
						</p>
						<div class="mb-2 d-flex">
							<select id="op_color" class="form-control">
								<option value="1">색상을 선택해주세요</option>
								<option value="2">070</option>
								<option value="3">011</option>
							</select>

						</div>
						<div class="mb-2 d-flex">
							<select id="op_size" class="form-control">
								<option value="1">사이즈를 선택해주세요</option>
								<option value="2">070</option>
								<option value="3">011</option>
							</select>

						</div>



						<div class="mb-3">
							<div class="input-group mb-3" style="max-width: 120px;">
								<div class="input-group-prepend">
									<button class="btn btn-outline-primary js-btn-minus"
										type="button">&minus;</button>
								</div>
								<input type="text" class="form-control text-center" value="1"
									placeholder="" aria-label="Example text with button addon"
									aria-describedby="button-addon1">
								<div class="input-group-append">
									<button class="btn btn-outline-primary js-btn-plus"
										type="button">&plus;</button>
								</div>
							</div>

						</div>
						<p>
							<a href="cart.html" class="buy-now btn btn-sm btn-primary">Add
								To Cart</a>
						</p>

					</div>
				</div>
			</div>
		</div>

		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<center>
					<img id="detailImg" src="front/images/img11.jpg" alt="Image">
				</center>
				<br>
				<hr>
				<br>
				<p>상세 설명 입니다.</p>
				<br>
				<hr>
				<br>
				<p>리뷰 입니다.</p>
				<div class="site-section border-bottom" data-aos="fade">
					<div class="container">
						<div class="row justify-content-center mb-5">
							<div class="col-md-7 site-section-heading text-center pt-4">
								<h2>Reviews</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-lg-3">

								<div class="block-38 text-center">
									<div class="block-38-img">
										<div class="block-38-header">
											<img src="front/images/person_1.jpg" alt="Image placeholder"
												class="mb-4">
											<h3 class="block-38-heading h4">Elizabeth Graham</h3>
											<p class="block-38-subheading">CEO/Co-Founder</p>
										</div>
										<div class="block-38-body">
											<p>Lorem ipsum dolor sit amet consectetur adipisicing
												elit. Vitae aut minima nihil sit distinctio recusandae
												doloribus ut fugit officia voluptate soluta.</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="block-38 text-center">
									<div class="block-38-img">
										<div class="block-38-header">
											<img src="front/images/person_2.jpg" alt="Image placeholder"
												class="mb-4">
											<h3 class="block-38-heading h4">Jennifer Greive</h3>
											<p class="block-38-subheading">Co-Founder</p>
										</div>
										<div class="block-38-body">
											<p>Lorem ipsum dolor sit amet consectetur adipisicing
												elit. Vitae aut minima nihil sit distinctio recusandae
												doloribus ut fugit officia voluptate soluta.</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="block-38 text-center">
									<div class="block-38-img">
										<div class="block-38-header">
											<img src="front/images/person_3.jpg" alt="Image placeholder"
												class="mb-4">
											<h3 class="block-38-heading h4">Patrick Marx</h3>
											<p class="block-38-subheading">Marketing</p>
										</div>
										<div class="block-38-body">
											<p>Lorem ipsum dolor sit amet consectetur adipisicing
												elit. Vitae aut minima nihil sit distinctio recusandae
												doloribus ut fugit officia voluptate soluta.</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3">
								<div class="block-38 text-center">
									<div class="block-38-img">
										<div class="block-38-header">
											<img src="front/images/person_4.jpg" alt="Image placeholder"
												class="mb-4">
											<h3 class="block-38-heading h4">Mike Coolbert</h3>
											<p class="block-38-subheading">Sales Manager</p>
										</div>
										<div class="block-38-body">
											<p>Lorem ipsum dolor sit amet consectetur adipisicing
												elit. Vitae aut minima nihil sit distinctio recusandae
												doloribus ut fugit officia voluptate soluta.</p>
										</div>
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