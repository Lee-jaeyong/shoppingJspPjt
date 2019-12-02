<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<body>

	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>

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
						<div class="row mb-5" id="itemSection"></div>
						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul id="pageSection">
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
	<%
		String category = "41";
		if (request.getParameter("category") != null)
			category = request.getParameter("category");
	%>
	<input type="text" id="category" value="<%=category%>">
	<%@include file="./include/footer.jsp"%>

	<%@include file="./include/scriptArea.html"%>
	<script>
		const ctx = window.location.pathname.substring(0,
				window.location.pathname.indexOf("/", 2));

		$(document).ready(function() {

		});

		function pageLoad(pageNum) {
			$
					.ajax({
						url : "./SelectItemList.aj",
						data : {
							pageNum : pageNum,
							category : $("#category").val()
						},
						dataType : "json",
						success : function(data) {
							var itemList = data.result;
							var html = '';
							for (var i = 0; i < itemList.length; i++) {
								html += '<div class="col-sm-4 col-lg-3 mb-4" data-aos="fade-up">';
								html += '<div class="block-4 text-center border"><figure class="block-4-image">';
								html += '<a href="shop-single.html"><img src="'+ctx+'/uploadImage/'+itemList[i].itemMainImg+'" style="height:300px; width:250px;" class="img-fluid"></a></figure>';
								html += '<div class="block-4-text p-4"><h3><a href="shop-single.html">'
										+ itemList[i].itemName
										+ '</a></h3><p class="text-primary font-weight-bold">'
										+ itemList[i].itemPrice
										+ '원</p></div></div></div>';
							}
							$("#itemSection").html(html);

							var startBlock = parseInt(data.startBlock);
							var endBlock = parseInt(data.endBlock);
							var totalBlock = parseInt(data.totalBlock);
							var nowPageNum = parseInt($("#nowPageNum").val());
							var pageArea = '';

							if (startBlock == 0)
								pageArea += '<li><a href="#">&lt;</a></li>';
							else
								pageArea += '<li><a href="#">&lt;</a></li>';
							
							for (var i = startBlock; i <= endBlock; i++) {
								if (i == nowPageNum) {
									pageArea += '<li class="active"><span>'
											+ (i + 1) + '</span></li>';
								} else {
									pageArea += '<li><a href="javascript:pageLoad('+i+')"><span>' + (i + 1)
											+ '</span></a></li>';
								}
							}

							if (endBlock == totalBlock)
								pageArea += '<li><a href="#">&gt;</a></li>';
							else
								pageArea += '<li><a href="#">&gt;</a></li>';
							$("#pageSection").html(pageArea);
						}
					});
		}

		window.onload = pageLoad(0);
	</script>
</body>
</html>