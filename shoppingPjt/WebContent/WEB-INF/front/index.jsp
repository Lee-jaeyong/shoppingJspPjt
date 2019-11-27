<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp" %>
<body>
	<style type="text/css">
.carousel-item img {
	width: 1350px;
	height: 500px;
}
</style>

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
		<div class="row" style="margin-bottom: 70px;">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div id="demo" class="carousel slide" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="front/images/cloth_1.jpg" alt="Los Angeles">
							<div class="carousel-caption">
								<h3>BEST1</h3>
								<p>We had such a great time in LA!</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="front/images/cloth_2.jpg" alt="Chicago" width="1250"
								height="500">
							<div class="carousel-caption">
								<h3>BEST2</h3>
								<p>Thank you, Chicago!</p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="front/images/cloth_3.jpg" alt="New York" width="1250"
								height="500">
							<div class="carousel-caption">
								<h3>BEST3</h3>
								<p>We love the Big Apple!</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
		<hr>

		<div class="site-section site-blocks-2">
			<div class="container">
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

		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>NEW</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="nonloop-block-3 owl-carousel">
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="front/images/cloth_1.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Tank Top</a>
										</h3>
										<p class="mb-0">Finding perfect t-shirt</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="front/images/shoe_1.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Corater</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="front/images/cloth_2.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Polo Shirt</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="front/images/cloth_3.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">T-Shirt Mockup</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="block-4 text-center">
									<figure class="block-4-image">
										<img src="front/images/shoe_1.jpg" alt="Image placeholder"
											class="img-fluid">
									</figure>
									<div class="block-4-text p-4">
										<h3>
											<a href="#">Corater</a>
										</h3>
										<p class="mb-0">Finding perfect products</p>
										<p class="text-primary font-weight-bold">$50</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section block-8">
			<div class="container">
				<div class="row justify-content-center  mb-5">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>Big Sale!</h2>
					</div>
				</div>
				<div class="row align-items-center">
					<div class="col-md-12 col-lg-7 mb-5">
						<a href="#"><img src="front/images/blog_1.jpg"
							alt="Image placeholder" class="img-fluid rounded"></a>
					</div>
					<div class="col-md-12 col-lg-5 text-center pl-md-5">
						<h2>
							<a href="#">50% less in all items</a>
						</h2>
						<p class="post-meta mb-4">
							By <a href="#">Carl Smith</a> <span class="block-8-sep">&bullet;</span>
							September 3, 2018
						</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quisquam iste dolor accusantium facere corporis ipsum animi
							deleniti fugiat. Ex, veniam?</p>
						<p>
							<a href="#" class="btn btn-primary btn-sm">Shop Now</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<%@include file="./include/footer.jsp" %>
	</div>

	<%@include file="./include/scriptArea.html" %>

</body>
</html>