<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<body>
	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Cart</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row mb-5">
					<form class="col-md-12" method="post">
						<div class="site-blocks-table">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="product-thumbnail">Image</th>
										<th class="product-name">Product</th>
										<th class="product-price">Price</th>
										<th class="product-quantity">Quantity</th>
										<th class="product-total">Total</th>
										<th class="product-remove">Remove</th>
									</tr>
								</thead>
								<tbody id="shoppingCartList">
									<tr>
										<td class="product-thumbnail"><img
											src="front/images/cloth_1.jpg" alt="Image" class="img-fluid">
										</td>
										<td class="product-name">
											<h2 class="h5 text-black">Top Up T-Shirt</h2>
										</td>
										<td>$49.00</td>
										<td>
											<div class="input-group mb-3" style="max-width: 120px;">
												<div class="input-group-prepend">
													<button class="btn btn-outline-primary js-btn-minus"
														type="button">&minus;</button>
												</div>
												<input type="text" class="form-control text-center"
													value="1" placeholder=""
													aria-label="Example text with button addon"
													aria-describedby="button-addon1">
												<div class="input-group-append">
													<button class="btn btn-outline-primary js-btn-plus"
														type="button">&plus;</button>
												</div>
											</div>

										</td>
										<td>$49.00</td>
										<td><a href="#" class="btn btn-primary btn-sm">X</a></td>
									</tr>

									<tr>
										<td class="product-thumbnail"><img
											src="front/images/cloth_2.jpg" alt="Image" class="img-fluid">
										</td>
										<td class="product-name">
											<h2 class="h5 text-black">Polo Shirt</h2>
										</td>
										<td>$49.00</td>
										<td>
											<div class="input-group mb-3" style="max-width: 120px;">
												<div class="input-group-prepend">
													<button class="btn btn-outline-primary js-btn-minus"
														type="button">&minus;</button>
												</div>
												<input type="text" class="form-control text-center"
													value="1" placeholder=""
													aria-label="Example text with button addon"
													aria-describedby="button-addon1">
												<div class="input-group-append">
													<button class="btn btn-outline-primary js-btn-plus"
														type="button">&plus;</button>
												</div>
											</div>

										</td>
										<td>$49.00</td>
										<td><a href="#" class="btn btn-primary btn-sm">X</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="row mb-5"></div>
						<div class="row"></div>
					</div>
					<div class="col-md-12 pl-5">
						<div class="row justify-content-end">
							<div class="col-md-7">
								<div class="row">
									<div class="col-md-12 text-right border-bottom mb-5">
										<h3 class="text-black h4 text-uppercase">총 결제 금액</h3>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-6">
										<span class="text-black">총 판매가</span>
									</div>
									<div class="col-md-6 text-right">
										<strong class="text-black" id="subTotal"></strong>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-md-6">
										<span class="text-black">최종 결제가</span>
									</div>
									<div class="col-md-6 text-right">
										<strong class="text-black" id="total"></strong>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<button class="btn btn-primary btn-lg py-3 btn-block"
											onclick="window.location='checkout.html'">Proceed To
											Checkout</button>
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
	<input type="text" id="userIdx"
		value="<%=session.getAttribute("userIdx").toString()%>">
	<%@include file="./include/scriptArea.html"%>
	<script>
		const ctx = window.location.pathname.substring(0,
				window.location.pathname.indexOf("/", 2));

		$(document).ready(function() {

		});

		function getShoppingCartList() {
			$
					.ajax({
						url : "./SelectShoppingCart.aj",
						data : {
							userIdx : $("#userIdx").val()
						},
						dataType : "json",
						success : function(data) {
							var shoppingCart = data.result;
							var totalSalePrice = 0;
							var _totalPrice = 0;
							html = '';
							for (var i = 0; i < shoppingCart.length; i++) {
								html += '<tr><td class="product-thumbnail"><img src="'+ctx+'/uploadImage/'+shoppingCart[i].itemMainImg+'" style="height:150px; width:330px;" class="img-fluid">';
								html += '</td><td class="product-name"><h2 class="h5 text-black">'
										+ shoppingCart[i].itemName
										+ '</h2></td>';
								html += '<td>'
										+ shoppingCart[i].itemSalePrice
										+ '</td><td><div class="input-group mb-3" style="max-width: 120px;">';
								html += '<div class="input-group-prepend"><button class="btn btn-outline-primary js-btn-minus">&minus;</button></div>';
								html += '<input type="text" class="form-control text-center" value="'+shoppingCart[i].cartCount+'" placeholder="" aria-label="Example text with button addon"';
						html += 'aria-describedby="button-addon1"><div class="input-group-append">';
								html += '<button class="btn btn-outline-primary js-btn-plus">&plus;</button></div></div></td>';
								var totalPrice = (shoppingCart[i].cartCount * shoppingCart[i].itemSalePrice);
								totalSalePrice += parseInt(shoppingCart[i].itemSalePrice);
								_totalPrice += parseInt(shoppingCart[i].itemPrice);
								html += '<td>'
										+ numberWithCommas(totalPrice)
										+ '원</td><td><a href="#" class="btn btn-primary btn-sm">X</a></td></tr>';
							}
							$("#shoppingCartList").html(html);
							$("#total").text(
									numberWithCommas(totalSalePrice) + "원");
							$("#subTotal").text(
									numberWithCommas(_totalPrice) + "원");
						}
					});
		}

		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		window.onload = function() {
			getShoppingCartList();
		}
	</script>
</body>
</html>