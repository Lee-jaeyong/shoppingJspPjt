<%@page import="shopping.database.dto.CategoryDTO"%>
<%@page import="shopping.database.dto.ItemDTO"%>
<%@page import="shopping.database.dto.EventDTO"%>
<%@page import="java.util.ArrayList"%>
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
						<%
							ArrayList<EventDTO> eventList = (ArrayList<EventDTO>) request.getAttribute("eventList");

							for (int i = 0; i < eventList.size(); i++) {
								if (i == 0) {
						%>
						<div class="carousel-item active">
							<%
								} else {
							%>
							<div class="carousel-item">
								<%
									}
								%>
								<a href=./single.do?itemNumber=<%=eventList.get(i).getEventItemIdx()%>> <img
									src="${pageContext.request.contextPath}/uploadBest/<%=eventList.get(i).getEventImg()%>">
									<div class="carousel-caption">
										<h3><%=eventList.get(i).getItemName()%></h3>
										<p><%=eventList.get(i).getEventTitle()%></p>
									</div>
								</a>
							</div>
							<%
								}
							%>
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
						<%
							ArrayList<CategoryDTO> representCategory = (ArrayList) request.getAttribute("representCategory");
							int size = 12;
							size = size / representCategory.size();
							int widthSize = 350 * size;
							for (int i = 0; i < representCategory.size(); i++) {
						%>
						<div class="col-sm-6 col-md-6 col-lg-<%=size %> mb-4 mb-lg-0"
							data-aos="fade" data-aos-delay="">
							<a class="block-2-item"
								href="./shop.do?category=<%=representCategory.get(i).getSmallCategoryIdx()%>">
								<figure class="image">
									<img
										src="${pageContext.request.contextPath}/uploadRepresentCategory/<%=representCategory.get(i).getRepresentPath()%>"
										class="img-fluid" style="width: <%=widthSize %>px; height: 400px;">
								</figure>
								<div class="text">
									<span class="text-uppercase">Collections</span>
									<h3><%=representCategory.get(i).getRepresentName()%></h3>
								</div>
							</a>
						</div>
						<%
							}
						%>
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
								<%
									ArrayList<ItemDTO> itemList = (ArrayList<ItemDTO>) request.getAttribute("newItem");
									for (int i = 0; i < itemList.size(); i++) {
								%>
								<div class="item">
									<a
										href="./single.do?itemNumber=<%=itemList.get(i).getItemIdx()%>">
										<div class="block-4 text-center">
											<figure class="block-4-image">
												<img style="height: 300px; width: 350px;"
													src="${pageContext.request.contextPath}/uploadImage/<%=itemList.get(i).getItemMainImg()%>"
													alt="Image placeholder" class="img-fluid">
											</figure>
											<div class="block-4-text p-4">
												<h3>
													<a href="#"><%=itemList.get(i).getItemName()%></a>
												</h3>
												<p class="mb-0"><%=itemList.get(i).getItemContent()%></p>
												<p class="text-primary font-weight-bold"><%=itemList.get(i).getItemSalePrice()%></p>
											</div>
										</div>
									</a>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="./include/footer.jsp"%>
		</div>
	</div>
	<%@include file="./include/scriptArea.html"%>
</body>
</html>