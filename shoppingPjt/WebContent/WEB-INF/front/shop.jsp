<%@page import="shopping.database.dto.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<body>
	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>

		<div class="bg-light py-3">
			<div class="container" id="top">
				<div class="row" id="smallCategorySection"></div>
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
											id="dropdownMenuReference" data-toggle="dropdown">정
											렬</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuReference">
											<a class="dropdown-item"
												href="javascript:sortChange('itemDate')">상품 등록일 순</a> <a
												class="dropdown-item"
												href="javascript:sortChange('itemSalePrice')">가격 낮은 순</a> <a
												class="dropdown-item"
												href="javascript:sortChange('itemSalePrice desc')">가격 높은
												순</a>
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
							<%
								ArrayList<CategoryDTO> representCategory = (ArrayList) request.getAttribute("representList");
								int size = 12;
								size = size / representCategory.size();
								int widthSize = 350 * size;
								for (int i = 0; i < representCategory.size(); i++) {
							%>
							<div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0"
								data-aos="fade" data-aos-delay="">
								<a class="block-2-item" href="./shop.do?category=<%=representCategory.get(i).getSmallCategoryIdx()%>">
									<figure class="image">
										<img
											src="${pageContext.request.contextPath}/uploadRepresentCategory/<%=representCategory.get(i).getRepresentPath()%>"
											class="img-fluid"
											style="width: <%=widthSize %>px; height: 650px;">
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
			</div>

		</div>
	</div>
	<%
		String category = "41";
		if (request.getParameter("category") != null)
			category = request.getParameter("category");
	%>
	<input type="hidden" id="category" value="<%=category%>">
	<input type="hidden" id="sortType" value="itemDate">
	<%@include file="./include/footer.jsp"%>

	<%@include file="./include/scriptArea.html"%>
	<script>
		const ctx = window.location.pathname.substring(0,
				window.location.pathname.indexOf("/", 2));

		$(document).ready(function() {

		});

		function sortChange(sortType) {
			$("#sortType").val(sortType);
			pageLoad(0);
		}

		function selectSmallCategoryList() {
			$.ajax({
				url : "./SelectSmallCategoryEqulsNow.aj",
				data : {
					smallCategory : $("#category").val()
				},
				dataType : "json",
				success : function(data) {
					var smallCategory = data.result;
					var html = '';
					for (var i = 0; i < smallCategory.length; i++) {
						html += '<div class="mb-2 ml-5">';
						html += '<a href="./shop.do?category='
								+ smallCategory[i].categoryNum + '">'
								+ smallCategory[i].categoryName + '</a></div>';
					}
					$("#smallCategorySection").html(html);
				}
			});
		}

		function pageLoad(pageNum) {
			$
					.ajax({
						url : "./SelectItemList.aj",
						data : {
							pageNum : pageNum,
							category : $("#category").val(),
							sortType : $("#sortType").val()
						},
						dataType : "json",
						success : function(data) {
							var itemList = data.result;
							var html = '';
							for (var i = 0; i < itemList.length; i++) {
								html += '<div class="col-sm-4 col-lg-3 mb-4" data-aos="fade-up">';
								html += '<div class="block-4 text-center border"><figure class="block-4-image">';
								html += '<a href="./single.do?itemNumber='
										+ itemList[i].itemIdx
										+ '"><img src="'+ctx+'/uploadImage/'+itemList[i].itemMainImg+'" style="height:300px; width:250px;" class="img-fluid"></a></figure>';
								html += '<div class="block-4-text p-4"><h3><a href="./single.do?itemNumber='
										+ itemList[i].itemIdx
										+ '">'
										+ itemList[i].itemName
										+ '</a></h3><p class="mb-0">'
										+ itemList[i].itemInfo
										+ '</p><p class="text-primary font-weight-bold">'
										+ numberWithCommas(itemList[i].itemPrice)
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

							for (var i = startBlock; i < endBlock; i++) {
								if (i == nowPageNum) {
									pageArea += '<li class="active"><span>'
											+ (i + 1) + '</span></li>';
								} else {
									pageArea += '<li><a onclick="pageLoad(' + i
											+ ');" href="#top"><span>'
											+ (i + 1) + '</span></a></li>';
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

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		window.onload = function() {
			selectSmallCategoryList();
			pageLoad(0);
		}
	</script>
</body>
</html>