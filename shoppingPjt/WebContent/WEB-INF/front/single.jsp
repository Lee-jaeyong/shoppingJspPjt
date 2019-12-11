<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shopping.database.dto.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<%
	String userIdx = "";
	if (session.getAttribute("userIdx") != null)
		userIdx = session.getAttribute("userIdx").toString();
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
    $("#addNowOrder").click(function () {
        if ($("#op_color").val() == '') {
            alert("옵션을 선택해주세요.");
            return;
        }
        if($("input[name=sendShoppingCartCount]").val() === '0')
       	{
        	alert("수량을 1개 이상 입력해주세요");
        	return;
       	}
        $("input[name=sendShoppingCartTotal]").val($("input[name=sendShoppingCartTotal]").val() * $("input[name=sendShoppingCartCount]").val());
        $("input[name=sendShoppingCartSubTotal]").val($("input[name=sendShoppingCartSubTotal]").val() * $("input[name=sendShoppingCartCount]").val());
        $("#addOrderForm")
            .attr("method", "post")
            .attr("action", "./order.do")
            .submit();
    });
    $("#addShoppingCart").click(function () {
        if ($("#op_color").val() == '') {
            alert("옵션을 선택해주세요.");
            return;
        }else if($("input[name=sendShoppingCartCount]").val() === '0')
       	{
        	alert("수량을 1개 이상 입력해주세요");
        	return;
       	}else {
            if ($("#userloginChk").val() === '') {
                alert("로그인이 필요한 기능입니다.");
                return;
            }
            $("#shoppingCartCount").val($("#itemCount").val());
            $("#optionIdx").val($("#op_color").val());
            $.ajax({
                url: "./InsertShoppingCart.aj",
                data: {
                    userId: $("#userloginChk").val(),
                    shoppingCartCount: $("#shoppingCartCount").val(),
                    optionIdx: $("#optionIdx").val()
                },
                success: function (data) {
                    if (data === 'true') {
                        if (confirm("장바구니에 추가하였습니다. 장바구니로 이동하시겠습니까?")) 
                            location.href = './cart.do';
                        
                    } else 
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
		<form id="addOrderForm">
			<input type="hidden" value="<%=userIdx%>" name="userIdx" />
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
								alt="Image" class="img-fluid" style="width: 500px; height: 500px;">
						</div>
						<div class="col-md-6">
							<h2 class="text-black"><%=categoryInfo[2]%></h2>
							<p><%=item.getItemContent()%></p>
							<p>
								<input type="hidden" name="sendShoppingCartTotal"
									value="<%=item.getItemSalePrice()%>"> <input
									type="hidden" name="sendShoppingCartSubTotal"
									value="<%=item.getItemPrice()%>"> <strong
									class="text-primary h4"><%=item.getItemSalePrice()%></strong>
							</p>
							<div class="mb-2 d-flex">
								<select id="op_color" class="form-control"
									name="sendShoppingCartList">
									<option value="">옵션을 선택해주세요</option>
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
									<div class="row">
										<div class="input-group-prepend">
											<button class="btn btn-outline-primary js-btn-minus"
												type="button">&minus;</button>
										</div>
										<div class="col-lg-6">
										<input type="text" id="itemCount"
											class="form-control text-center" value="1" placeholder=""
											aria-label="Example text with button addon"
											aria-describedby="button-addon1" name="sendShoppingCartCount"
											readonly="readonly">
										</div>
										<div class="input-group-append">
											<button class="btn btn-outline-primary js-btn-plus"
												type="button">&plus;</button>
										</div>
									</div>
								</div>

							</div>
							<p>
								<button id="addShoppingCart" type="button"
									class="buy-now btn btn-sm btn-primary">장바구니 추가</button>
								<button id="addNowOrder" type="button" class="buy-now btn btn-sm btn-warning">바로
									구매</button>
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
		</form>
		<%@include file="./include/footer.jsp"%>
	</div>

	<%@include file="./include/scriptArea.html"%>
	<input type="hidden" id="optionIdx" name="optionIdx" value="" />
	<input type="hidden" id="shoppingCartCount" name="shoppingCartCount"
		value="" />
</body>
</html>