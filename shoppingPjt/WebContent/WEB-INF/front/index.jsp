<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<style type="text/css">
.carousel-item img {
	width: 1350px;
	height: 500px;
}
</style>
<body>
	<%
		if (request.getQueryString() != null && request.getQueryString().equals("error")) {
	%>
	<script>
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
	</script>
	<%
		}
	%>
	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>
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

		<%@include file="./include/footer.jsp"%>
	</div>

	<%@include file="./include/scriptArea.html"%>

</body>
</html>