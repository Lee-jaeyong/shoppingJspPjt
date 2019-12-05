<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<script language="javascript">
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("./userAddress.do", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		$("#address").val(roadFullAddr);
	}
</script>
<body>
	<%
		String userIdx = "";
		if(request.getParameter("userIdx") != null)
			userIdx = request.getParameter("userIdx");
		else if(request.getSession().getAttribute("userIdx") != null)
			userIdx = request.getSession().getAttribute("userIdx").toString();
		boolean type = true;
		String totalList = "";
		if (request.getParameter("sendShoppingCartList") != null)
		{
			totalList = request.getParameter("sendShoppingCartList");
			type = false;			
		}
		String sendShoppingCartTotal = request.getParameter("sendShoppingCartSubTotal");
		String sendShoppingCartSubTotal = request.getParameter("sendShoppingCartTotal");
		String optionCount = request.getParameter("sendShoppingCartCount");
		String shoppingCartList = request.getParameter("shoppingCartItemList");
	%>
	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <a
							href="cart.html">Cart</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Checkout</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<form id="orderForm">
					<input type="hidden" name="orderType" value="<%=type%>"/>
					<input type="hidden" id="myInfo" name="myInfo"
						value="<%=userIdx%>"> <input
						type="hidden" value="<%=optionCount%>" name="optionCount" /><input
						type="hidden" value="<%=shoppingCartList%>"
						name="shoppingCartItemList" />
					<div class="row">
						<div class="col-md-6 mb-5 mb-md-0">
							<h2 class="h3 mb-3 text-black">주문 정보</h2>
							<input type="radio" name="recipientCheck" value="myinfo"
								checked="checked"> 내정보 &nbsp;&nbsp; <input type="radio"
								name="recipientCheck" value="different"> 다른사람
							<div class="p-3 p-lg-5 border">
								<input type="hidden" value="<%=shoppingCartList%>"
									name="totalOrderList"> <input type="hidden"
									value="<%=sendShoppingCartTotal%>" name="orderTotal"> <input
									type="hidden" value="<%=sendShoppingCartSubTotal%>"
									name="orderSubTotal"><input type="hidden"
									value="<%=sendShoppingCartSubTotal%>" name="shoppingCartList">
								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_fname" class="text-black">이름 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="name" name="c_fname">
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-4">
										<label for="c_companyname" class="text-black">전화번호<span
											class="text-danger">*</span></label> <select id="phone1"
											class="form-control" name="phone1">
											<option value="010">010</option>
											<option value="070">070</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>

									</div>
									<div class="col-md-4">
										<label for="c_fname" class="text-black">&nbsp;</label> <input
											type="text" class="form-control" id="phone2" name="phone2">
									</div>
									<div class="col-md-4">
										<label for="c_fname" class="text-black">&nbsp;</label> <input
											type="text" class="form-control" id="phone3" name="phone3">
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_companyname" class="text-black">이메일 <span
											class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="email"
											name="email" placeholder="abcd1234@email.com">
									</div>
								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-md-8">
											<label for="c_address" class="text-black">주소 <span
												class="text-danger">*</span></label> <input type="text"
												class="form-control" id="address" name="address"
												placeholder="주소">
										</div>
										<div class="col-md-4">
											<br>
											<button type="button" class="btn btn-success mt-2"
												id="btnAddressInfo">주소 검색</button>
										</div>
									</div>
								</div>

								<div class="form-group">
									<input type="text" class="form-control" name="address2"
										id="address2" placeholder="상세주소">
								</div>

								<div class="form-group">
									<label for="c_order_notes" class="text-black">배송요청사항</label>
									<textarea name="notes" id="notes" cols="30" rows="5"
										class="form-control"></textarea>
								</div>

								<div class="form-group row" style="display: none;"
									id="nonMemberPass">
									<div class="col-md-12">
										<label for="c_companyname" class="text-black">비회원
											주문비밀번호 <span class="text-danger">*</span>
										</label> <input type="text" class="form-control" id="nonPw"
											name="nonPw" placeholder="비밀번호 입력"> <input
											type="text" class="form-control" id="nonPw2" name="nonPw2"
											placeholder="비밀번호 확인">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">

							<div class="row mb-5">
								<div class="col-md-12">
									<h2 class="h3 mb-3 text-black">최종 결제 금액</h2>
									<br>
									<div class="p-3 p-lg-5 border">
										<table class="table site-block-order-table mb-5">
											<thead>
												<th>Product</th>
												<th>Total</th>
											</thead>
											<tbody>
												<tr>
													<td>Top Up T-Shirt <strong class="mx-2">x</strong> 1
													</td>
													<td>$250.00</td>
												</tr>
												<tr>
													<td>Polo Shirt <strong class="mx-2">x</strong> 1
													</td>
													<td>$100.00</td>
												</tr>
												<tr>
													<td class="text-black font-weight-bold"><strong>Cart
															Subtotal</strong></td>
													<td class="text-black"><%=sendShoppingCartTotal%></td>
												</tr>
												<tr>
													<td class="text-black font-weight-bold"><strong>Order
															Total</strong></td>
													<td class="text-black font-weight-bold"><strong><%=sendShoppingCartSubTotal%></strong></td>
												</tr>
											</tbody>
										</table>

										<div class="border p-3 mb-3">
											<h3 class="h6 mb-0">
												<a class="d-block" data-toggle="collapse"
													href="#collapsebank" role="button" aria-expanded="false"
													aria-controls="collapsebank">Direct Bank Transfer</a>
											</h3>

											<div class="collapse" id="collapsebank">
												<div class="py-2">
													<p class="mb-0">Make your payment directly into our
														bank account. Please use your Order ID as the payment
														reference. Your order won’t be shipped until the funds
														have cleared in our account.</p>
												</div>
											</div>
										</div>

										<div class="border p-3 mb-3">
											<h3 class="h6 mb-0">
												<a class="d-block" data-toggle="collapse"
													href="#collapsecheque" role="button" aria-expanded="false"
													aria-controls="collapsecheque">Cheque Payment</a>
											</h3>

											<div class="collapse" id="collapsecheque">
												<div class="py-2">
													<p class="mb-0">Make your payment directly into our
														bank account. Please use your Order ID as the payment
														reference. Your order won’t be shipped until the funds
														have cleared in our account.</p>
												</div>
											</div>
										</div>

										<div class="border p-3 mb-5">
											<h3 class="h6 mb-0">
												<a class="d-block" data-toggle="collapse"
													href="#collapsepaypal" role="button" aria-expanded="false"
													aria-controls="collapsepaypal">Paypal</a>
											</h3>

											<div class="collapse" id="collapsepaypal">
												<div class="py-2">
													<p class="mb-0">Make your payment directly into our
														bank account. Please use your Order ID as the payment
														reference. Your order won’t be shipped until the funds
														have cleared in our account.</p>
												</div>
											</div>
										</div>
										<div class="form-group">
											<button id="btnOrderInsert"
												class="btn btn-primary btn-lg py-3 btn-block">주문하기</button>
										</div>

									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- </form> -->
				</form>
			</div>
		</div>

		<%@include file="./include/footer.jsp"%>
	</div>

	<%@include file="./include/scriptArea.html"%>
	<script>
		var user;
		$(document).ready(
				function() {
					$("#btnAddressInfo").click(function() {
						goPopup();
					});
					$("#btnOrderInsert").click(
							function() {
								if ($("#c_fname").val() === '')
									alert("이름을 입력해주세요.");
								else if ($("#phone2").val() === ''
										|| $("#phone3").val() === '')
									alert("전화번호를 입력해주세요.");
								else if ($("#email").val() === '')
									alert("이메일을 입력해주세요.");
								else if ($("#address2").val() === '')
									alert("주소를 입력해주세요.");
								else if ($("#address").val() === '')
									alert("상세 주소를 입력해주세요.");
								else {
									$("#orderForm").attr("method", "post")
											.attr("action", "./thankyou.do")
											.submit();
								}
							});
					$("input[name=recipientCheck]").change(function() {
						if ($(this).val() === "myinfo")
							changeInfo();
						else {
							$("#name").val("");
							$("#phone2").val("");
							$("#phone3").val("");
							$("#email").val("");
							$("#address").val("");
							$("#address2").val("");
							$("#notes").text("");
							inputReadOnly(false);
						}
					});
				});
		function getMyInfo() {
			if($("#myInfo").val() != '')
				$.ajax({
					url : "./selectUserInfo.aj",
					data : {
						customer : $("#myInfo").val()
					},
					dataType : "json",
					success : function(data) {
						user = data;
						changeInfo();
					}
				});
		}
		function changeInfo() {
			var address = user.userAddress.split('#');
			$("#name").val(user.userName);
			$('#phone1 option').each(
					function(index) {
						if (this.value == user.userPhone.substring(0, 3)) {
							$("#phone1 option:eq(" + index + ")").attr(
									"selected", "selected");
							return;
						}
					});
			$("#phone2").val(user.userPhone.substring(3, 7));
			$("#phone3").val(user.userPhone.substring(7, 11));
			$("#email").val(user.userEmail);
			$("#address").val(address[0]);
			$("#address2").val(address[1]);
			inputReadOnly(true);
		}

		function inputReadOnly(type) {
			$("#name").attr("readonly", type);
			$("#phone1").attr("readonly", type);
			$("#phone2").attr("readonly", type);
			$("#phone3").attr("readonly", type);
			$("#email").attr("readonly", type);
			$("#address").attr("readonly", type);
			$("#address2").attr("readonly", type);
			$("#btnAddressInfo").attr("disabled", type);
		}
		window.onload = getMyInfo();
	</script>
</body>
</html>