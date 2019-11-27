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
				<center>
					<div class="row">
						<!--<div class="col-md-3"></div>-->
						<div class="col-md-12 mb-0">
							<a href="index.html">아우터</a>&nbsp;&nbsp;&nbsp;<a
								href="index.html">블라우스</a> &nbsp;&nbsp;&nbsp;<a
								href="index.html">맨투맨</a>&nbsp;&nbsp;&nbsp;<a href="index.html">후드</a>
						</div>
						<!--<div class="col-md-3"></div>-->
					</div>
				</center>
			</div>
		</div>


		<div class="site-section">
			<div class="container">

				<div class="row mb-5">
					<div class="col-md-12 order-2">

						<div class="row">
							<div class="col-md-12 mb-5">
								<div class="float-md-left mb-4">
									<h2 class="text-black h5">Shop All</h2>
								</div>
								<div class="d-flex">
									<div class="dropdown mr-1 ml-md-auto">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuOffset" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">Latest</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuOffset">
											<a class="dropdown-item" href="#">Men</a> <a
												class="dropdown-item" href="#">Women</a> <a
												class="dropdown-item" href="#">Children</a>
										</div>
									</div>
									<div class="btn-group">
										<button type="button"
											class="btn btn-secondary btn-sm dropdown-toggle"
											id="dropdownMenuReference" data-toggle="dropdown">Reference</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuReference">
											<a class="dropdown-item" href="#">Relevance</a> <a
												class="dropdown-item" href="#">Name, A to Z</a> <a
												class="dropdown-item" href="#">Name, Z to A</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Price, low to high</a> <a
												class="dropdown-item" href="#">Price, high to low</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mb-5">

							<div class="col-sm-4 col-lg-3 mb-4" data-aos="fade-up">
								<div class="block-4 text-center border">
									<figure class="block-4-image">
										<a href="shop-single.html"><img
											src="front/images/cloth_1.jpg" alt="Image placeholder"
											class="img-fluid"></a>
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="shop-single.html">Tank Top</a>
										</h3>
										<p class="mb-0">Finding perfect t-shirt</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="col-sm-4 col-lg-3 mb-4" data-aos="fade-up">
								<div class="block-4 text-center border">
									<figure class="block-4-image">
										<a href="shop-single.html"><img
											src="front/images/shoe_1.jpg" alt="Image placeholder"
											class="img-fluid"></a>
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="shop-single.html">Corater</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="col-sm-4 col-lg-3 mb-4" data-aos="fade-up">
								<div class="block-4 text-center border">
									<figure class="block-4-image">
										<a href="shop-single.html"><img
											src="front/images/cloth_2.jpg" alt="Image placeholder"
											class="img-fluid"></a>
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="shop-single.html">Polo Shirt</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="col-sm-4 col-lg-3 mb-4" data-aos="fade-up">
								<div class="block-4 text-center border">
									<figure class="block-4-image">
										<a href="shop-single.html"><img
											src="front/images/cloth_2.jpg" alt="Image placeholder"
											class="img-fluid"></a>
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="shop-single.html">Polo Shirt</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>




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

			<div class="row">
				<div class="col-md-12">
					<div class="site-section site-blocks-2">
						<div class="row justify-content-center text-center mb-5">
							<div class="col-md-7 site-section-heading pt-4">
								<h2>Categories</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0"
								data-aos="fade" data-aos-delay="">
								<a class="block-2-item" href="#">
									<figure class="image">
										<img src="front/images/women.jpg" alt="" class="img-fluid">
									</figure>
									<div class="text">
										<span class="text-uppercase">Collections</span>
										<h3>Clothing</h3>
									</div>
								</a>
							</div>
							<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
								data-aos="fade" data-aos-delay="100">
								<a class="block-2-item" href="#">
									<figure class="image">
										<img src="front/images/children.jpg" alt="" class="img-fluid">
									</figure>
									<div class="text">
										<span class="text-uppercase">Collections</span>
										<h3>Shoes</h3>
									</div>
								</a>
							</div>
							<div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0"
								data-aos="fade" data-aos-delay="200">
								<a class="block-2-item" href="#">
									<figure class="image">
										<img src="front/images/men.jpg" alt="" class="img-fluid">
									</figure>
									<div class="text">
										<span class="text-uppercase">Collections</span>
										<h3>Accessory</h3>
									</div>
								</a>
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