<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shopping.database.dto.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#addShoppingCart").click(function() {
			if ($("#op_color").val() == '') {
				alert("색상을 선택해주세요.");
				return;
			} else {
				if($("#userName").val() === '')
				{
					alert("로그인이 필요한 기능입니다.");
					return;
				}
				$("#shoppingCartCount").val($("#itemCount").val());
				$("#optionIdx").val($("#op_color").val());
				$.ajax({
					url:"",
					data:{
						userId:$("#userName").val(),
						shoppingCartCount:$("#shoppingCartCount").val(),
						optionIdx:$("#optionIdx").val()
					},
					success:function(data){
						if(data === 'true')
						{
							if(confirm("장바구니에 추가하였습니다. 장바구니로 이동하시겠습니까?"))
								location.href='';
						}
						else
							alert("장바구니 추가 실패");
					}
				});
			}
		});
	});
</script>
<body>
	<%
		String[] categoryInfo = (String[]) request.getAttribute("categoryInfo");
		ItemDTO item = (ItemDTO) request.getAttribute("itemInfo");
	%>
	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html"><%=categoryInfo[0]%></a> <span
							class="mx-2 mb-0">/</span> <strong class="text-black"><%=categoryInfo[1]%>&nbsp;&nbsp;/
							<%=categoryInfo[2]%></strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<img
							src="${pageContext.request.contextPath}/uploadImage/<%=item.getItemMainImg() %>"
							alt="Image" class="img-fluid">
					</div>
					<div class="col-md-6">
						<h2 class="text-black"><%=categoryInfo[2]%></h2>
						<p><%=item.getItemContent()%></p>

						<p>
							<strong class="text-primary h4"><%=item.getItemSalePrice()%></strong>
						</p>
						<div class="mb-2 d-flex">
							<select id="op_color" class="form-control">
								<option value="">색상을 선택해주세요</option>
								<%
									List<ItemDTO> list = (ArrayList<ItemDTO>) request.getAttribute("itemOption");
									for (int i = 0; i < list.size(); i++) {
								%>
								<option value="<%=list.get(i).getItemIdx()%>"><%=list.get(i).getSize()%>[<%=list.get(i).getColor()%>]=<%=list.get(i).getItemStock()%></option>
								<%
									}
								%>
							</select>

						</div>
						<div class="mb-3">
							<div class="input-group mb-3" style="max-width: 120px;">
								<div class="input-group-prepend">
									<button class="btn btn-outline-primary js-btn-minus"
										type="button">&minus;</button>
								</div>
								<input type="text" id="itemCount" class="form-control text-center" value="1"
									placeholder="" aria-label="Example text with button addon"
									aria-describedby="button-addon1">
								<div class="input-group-append">
									<button class="btn btn-outline-primary js-btn-plus"
										type="button">&plus;</button>
								</div>
							</div>

						</div>
						<p>
							<button id="addShoppingCart"
								class="buy-now btn btn-sm btn-primary">Add To Cart</button>
						</p>

					</div>
				</div>
			</div>
		</div>

		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<center>
					<img id="detailImg"
						src="${pageContext.request.contextPath}/uploadImage/<%=item.getItemDetailImg() %>"
						alt="Image">
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

		<%@include file="./include/footer.jsp"%>
	</div>

	<%@include file="./include/scriptArea.html"%>
	<form id="addShoppingCartForm">
		<input type="hidden" id="optionIdx" name="optionIdx" value=""/>
		<input type="hidden" id="userName" name="userName" value="<%=session.getAttribute("")%>"/>
		<input type="hidden" id="shoppingCartCount" name="shoppingCartCount" value=""/>
	</form>
</body>
</html>