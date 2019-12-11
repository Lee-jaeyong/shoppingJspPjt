<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shopping.database.dto.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<%
	String userIdx = "";
	if (session.getAttribute("userIdx") != null)
		userIdx = session.getAttribute("userIdx").toString();
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#addNowOrder")
								.click(
										function() {
											if ($("#op_color").val() == '') {
												alert("옵션을 선택해주세요.");
												return;
											}
											if ($(
													"input[name=sendShoppingCartCount]")
													.val() === '0') {
												alert("수량을 1개 이상 입력해주세요");
												return;
											}
											$(
													"input[name=sendShoppingCartTotal]")
													.val(
															$(
																	"input[name=sendShoppingCartTotal]")
																	.val()
																	* $(
																			"input[name=sendShoppingCartCount]")
																			.val());
											$(
													"input[name=sendShoppingCartSubTotal]")
													.val(
															$(
																	"input[name=sendShoppingCartSubTotal]")
																	.val()
																	* $(
																			"input[name=sendShoppingCartCount]")
																			.val());
											$("#addOrderForm").attr("method",
													"post").attr("action",
													"./order.do").submit();
										});
						$("#addShoppingCart")
								.click(
										function() {
											if ($("#op_color").val() == '') {
												alert("옵션을 선택해주세요.");
												return;
											} else if ($(
													"input[name=sendShoppingCartCount]")
													.val() === '0') {
												alert("수량을 1개 이상 입력해주세요");
												return;
											} else {
												if ($("#userloginChk").val() === '') {
													alert("로그인이 필요한 기능입니다.");
													return;
												}
												$("#shoppingCartCount").val(
														$("#itemCount").val());
												$("#optionIdx").val(
														$("#op_color").val());
												$
														.ajax({
															url : "./InsertShoppingCart.aj",
															data : {
																userId : $(
																		"#userloginChk")
																		.val(),
																shoppingCartCount : $(
																		"#shoppingCartCount")
																		.val(),
																optionIdx : $(
																		"#optionIdx")
																		.val()
															},
															success : function(
																	data) {
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
<style>
table td {
	text-align: center;
}
</style>
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
								alt="Image" class="img-fluid"
								style="width: 500px; height: 500px;">
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
												aria-describedby="button-addon1"
												name="sendShoppingCartCount" readonly="readonly">
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
								<button id="addNowOrder" type="button"
									class="buy-now btn btn-sm btn-warning">바로 구매</button>
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
					<div class="site-section border-bottom" data-aos="fade">
						<div class="container">
							<div class="row">
								<%
									if (Boolean.parseBoolean(request.getAttribute("checkReviewWrite").toString())
											&& Boolean.parseBoolean(request.getAttribute("buyChk").toString())) {
								%>
								<div class="mb-4">
									<button id="addReview" type="button" class="btn btn-primary">리뷰
										등록</button>
								</div>
								<div class="col-lg-6">
									<textarea class="form-control" rows="6" id="reviewContent"></textarea>
								</div>
								<div class="col-lg-4">
									<div>
										<h5>리뷰 평점을 선택해주세요</h5>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input"
											style="width: 25px; height: 25px;" value="1" id="chkStar1">
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input"
											style="width: 25px; height: 25px;" value="2" id="chkStar2">
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input"
											style="width: 25px; height: 25px;" value="3" id="chkStar3">
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input"
											style="width: 25px; height: 25px;" value="4" id="chkStar4">
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> <input
											type="checkbox" class="form-check-input"
											style="width: 25px; height: 25px;" value="5" id="chkStar5">
										</label>
									</div>
									<div>
										<h5>* 마지막으로 구매한 옵 션</h5>
										<input id="reviewOption" type="text" readonly
											class="form-control form-control"
											value="<%=request.getAttribute("buyOption")%>">
									</div>
								</div>
								<%
									} else if (!Boolean.parseBoolean(request.getAttribute("checkReviewWrite").toString())
											&& Boolean.parseBoolean(request.getAttribute("buyChk").toString())) {
								%>
								<div class="col-md-4">
									<label>*이미 리뷰를 작성하셨습니다.</label>
								</div>
								<%
									} else {
								%>
								<div class="col-md-4">
									<label>*리뷰는 이 상품을 구매한 회원만 등록 가능합니다.</label>
								</div>
								<%
									}
								%>
							</div>
							<hr>
							<table class="table">
								<tbody id="reviewSection">
								</tbody>
							</table>
							<div>
								<button id="prevBtn" type="button" disabled="disabled"
									class="btn btn-secondary"><</button>
								<button id="nextBtn" type="button" class="btn btn-secondary">></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<%@include file="./include/footer.jsp"%>
		<input type="hidden" id="checkStar" value="0" />
	</div>
	<%@include file="./include/scriptArea.html"%>
	<input type="hidden" id="optionIdx" name="optionIdx" value="" />
	<input type="hidden" id="shoppingCartCount" name="shoppingCartCount"
		value="" />
	<input type="hidden" id="nowItemIdx"
		value="<%=request.getParameter("itemNumber")%>" />
	<input type="hidden" id="nowPageNum" value="0" />
	<script>
		$(document).ready(
				function() {
					$("#prevBtn").click(
							function() {
								$("#nowPageNum").val(
										parseInt($("#nowPageNum").val()) - 1);
								loadReview();
							});

					$("#nextBtn").click(
							function() {
								$("#nowPageNum").val(
										parseInt($("#nowPageNum").val()) + 1);
								loadReview();
							});

					$("#addReview").click(
							function() {
								if ($("#reviewContent").val().trim() === ''
										|| $("#checkStar").val() === '0') {
									alert("리뷰 내용 혹은 별점을 선택해주세요.");
									return;
								}
								$
										.ajax({
											url : "./InsertReview.aj",
											data : {
												itemIdx : $("#nowItemIdx")
														.val(),
												reviewOption : $(
														"#reviewOption").val(),
												checkStar : $("#checkStar")
														.val(),
												reviewContent : $(
														"#reviewContent").val()
											},
											success : function(data) {
												alert(data);
												loadReview(0);
											}
										});
							});

					$("#chkStar1 ,#chkStar2, #chkStar3, #chkStar4, #chkStar5")
							.change(
									function() {
										if ($(this).is(":checked")) {
											for (var i = 1; i <= parseInt($(
													this).val()); i++)
												$("#chkStar" + i).prop(
														"checked", true);
											$("#checkStar").val($(this).val());
										} else {
											for (var i = 1; i <= 5; i++)
												$("#chkStar" + i).prop(
														"checked", false);
											$("#checkStar").val('0');
										}
									});
				});

		function loadReview() {
			$
					.ajax({
						url : "SelectReview.aj",
						data : {
							pageNum : $("#nowPageNum").val(),
							itemNum : $("#nowItemIdx").val()
						},
						dataType : "json",
						success : function(data) {
							var reviewList = data.result;
							var reviewSection = '';
							for (var i = 0; i < reviewList.length; i++) {
								reviewSection += "<tr>";
								reviewSection += '<td>'
										+ reviewList[i].userName + '</td>';
								reviewSection += '<td><label class="btn-success btn-sm">'
										+ reviewList[i].reviewTitle
										+ '</label></td>';
								reviewSection += '<td><strong>'
										+ reviewList[i].reviewDate
										+ '</strong></td>';
								reviewSection += '<td><label class="btn-warning btn-sm">'
										+ reviewList[i].reviewContent
										+ '</label></td>';
								reviewSection += '<td>';
								for (var j = 0; j < reviewList[i].reviewStar; j++)
									reviewSection += '<i class="fas fa-heart"></i>';
								reviewSection += '</td>';
								reviewSection += "</tr>";
							}
							$("#reviewSection").html(reviewSection);
							if (parseInt(data.totalPage) - 1 == $("#nowPageNum")
									.val())
								$("#nextBtn").attr("disabled", true);
							else
								$("#nextBtn").attr("disabled", false);
							if ($("#nowPageNum").val() == 0)
								$("#prevBtn").attr("disabled", true);
							else
								$("#prevBtn").attr("disabled", false);
						}
					});
		}
		window.onload = loadReview();
	</script>
</body>
</html>