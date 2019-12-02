<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#btnLoginExecute").click(function() {
					if ($("#loginId").val().trim() === ''|| $("#loginPw").val().trim() === '')
							alert("아이디 혹은 비밀번호를 입력해주세요.");
					else
							$("#loginForm").attr("method", "post").attr("action", "./loginAction.do").submit();
				});
				
				$("#loginPw").keyup(function(e){
					if(e.keyCode == 13)  
						$("#btnLoginExecute").click();
				});
				
				$("#loginId").keyup(function(e){
					if(e.keyCode == 13)  
						$("#btnLoginExecute").click();
				});
			});
	
	function categoryLoad() {
		$.ajax({
					url : "./SelectCategory.ajax",
					dataType : "json",
					success : function(data) {
						var category = data.category;
						var smallCategory = data.smallCategory;
						var html = '';
						for (var i = 0; i < category.length; i++) {
							html += '<li class="has-children"><a href="#">'+category[i].categoryName+'</a><ul class="dropdown">';
							for (var j = 0; j < smallCategory.length; j++) {
								if (category[i].categoryChkIdx == smallCategory[j].categoryHighIdx) {
									html += '<li><a href="./shop.do?category='+smallCategory[j].categoryChkIdx+'">'+smallCategory[j].categoryName+'</a></li>';
								}
							}
							html += '</ul></li>';
						}
						$("#categoryArea").html(html);
					}
				});
	}
	window.onload = categoryLoad();
</script>
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
						<a href="index.do" class="js-logo-clone">Shopping</a>
					</div>
				</div>

				<div class="col-6 col-md-4 order-3 order-md-3 text-right">
					<div class="site-top-icons">
						<ul>
							<%
								if (session.getAttribute("userId") == null) {
							%>
							<li><a href="join.do">회원가입</a></li>
							<li><a href="#" data-toggle="modal" data-target="#myModal">로그인</a>
								<%
									} else {
								%>
								<li><b><%=session.getAttribute("userName")%></b>님 &nbsp;&nbsp; </li>
							<li><a href="logoutAction.do">로그아웃</a></li>
							<%
								}
							%>
							<!-- The Modal -->
							<div class="modal fade" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">로그인</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<form id="loginForm">
											<!-- Modal body -->
											<div class="modal-body">
												<br> <input type="text" class="form-control"
													id="loginId" name="loginId" placeholder="아이디"><br>
												<input type="text" class="form-control" id="loginPw"
													name="loginPw" placeholder="비밀번호"> <br>
											</div>

											<!-- Modal footer -->
											<div class="modal-footer">
												<button id="btnLoginExecute" type="button"
													class="btn btn-primary">Login</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							</li>

							<li style="display: none;"><a href="#">로그아웃</a></li>

							<li><a href="#">마이페이지</a></li>
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
				<li><a href="index.do">Home</a></li>
				<li class="has-children active"><a href="about.html">BEST10</a>
					<ul class="dropdown">
						<li><a href="#">Menu One</a></li>
						<li><a href="#">Menu Two</a></li>
						<li><a href="#">Menu Three</a></li>
					</ul></li>
				<li class="has-children"><a href="index.html">Shop</a>
					<ul class="dropdown" id="categoryArea">
						<li class="has-children"><a href="#">Sub Menu</a>
							<ul class="dropdown">
								<li><a href="#">Menu One</a></li>
								<li><a href="#">Menu Two</a></li>
								<li><a href="#">Menu Three</a></li>
							</ul></li>
						<li class="has-children"><a href="#">Sub Menu</a>
							<ul class="dropdown">
								<li><a href="#">Menu One</a></li>
								<li><a href="#">Menu Two</a></li>
								<li><a href="#">Menu Three</a></li>
							</ul></li>
						<li class="has-children"><a href="#">Sub Menu</a>
							<ul class="dropdown">
								<li><a href="#">Menu One</a></li>
								<li><a href="#">Menu Two</a></li>
								<li><a href="#">Menu Three</a></li>
							</ul></li>
					</ul></li>
				<li><a href="#">Review</a></li>
				<li><a href="qna.do">Q & A</a></li>
			</ul>
		</div>
	</nav>

</header>