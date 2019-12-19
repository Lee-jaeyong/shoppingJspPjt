<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	const pjt = window.location.pathname.substring(0,
			window.location.pathname.indexOf("/", 2));
	$(document).ready(
			function() {
				 $("#headerInputSearch").keyup(function(){
					if($("#headerInputSearch").val().trim() === '')
					{
						$("#searchArea").html("");
						return;
					}
					$.ajax({
						url : "./SelectSearchItem.aj",
						data : {
							item : $(this).val()
						},
						dataType : "json",
						success : function(data){
							var itemList = data.result;
							var searchSection = '';
							for(var i= 0;i<itemList.length;i++)
							{
								searchSection += '<tr style = "cursor:pointer;" onclick="javascript:pageMove('+itemList[i].itemIdx+')">';
								searchSection += '<td><img src="'+pjt+'/uploadImage/'+itemList[i].itemMainImg+'" style="height:120px; width:120px;" class="img-fluid"></td>';
								searchSection += '<td>'+itemList[i].itemName+'</td>';
								searchSection += '<td>'+itemList[i].itemPrice+'원</td>';
								searchSection += '<td>'+itemList[i].itemPrice+'원</td>';
								searchSection += '</tr>';
							}
							$("#searchArea").html(searchSection);
						}
					});
				}); 
				
				$('#summernote').summernote({
					placeholder : '질문 내용을 입력해주세요.',
					minHeight : 370,
					maxHeight : null,
					focus : true,
					lang : 'ko-KR',
					toolbar: [
					    ['style', ['style']],
					    ['font', ['bold', 'italic', 'underline', 'clear']],
					    ['fontname', ['fontname']],
					    ['color', ['color']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['table', ['table']],
					    ['insert', ['link', 'hr']],
					    ['view', ['fullscreen']],
					    ['help', []]
					  ],
				});

				$("#btnLoginExecute").click(
						function() {

							if ($("#loginId").val().trim() === ''
									|| $("#loginPw").val().trim() === '')
								alert("아이디 혹은 비밀번호를 입력해주세요.");
							else
								$("#loginForm").attr("method", "post").attr(
										"action", "./loginAction.do").submit();
						});

				$("#loginPw").keyup(function(e) {
					if (e.keyCode == 13)
						$("#btnLoginExecute").click();
				});

				$("#loginId").keyup(function(e) {
					if (e.keyCode == 13)
						$("#btnLoginExecute").click();
				});
			});

	function categoryLoad() {
		$
				.ajax({
					url : "./SelectCategory.ajax",
					dataType : "json",
					success : function(data) {
						var category = data.category;
						var smallCategory = data.smallCategory;
						var html = '';
						for (var i = 0; i < category.length; i++) {
							html += '<li class="has-children"><a href="#">'
									+ category[i].categoryName
									+ '</a><ul class="dropdown">';
							for (var j = 0; j < smallCategory.length; j++) {
								if (category[i].categoryChkIdx == smallCategory[j].categoryHighIdx) {
									html += '<li><a href="./shop.do?category='
											+ smallCategory[j].categoryChkIdx
											+ '">'
											+ smallCategory[j].categoryName
											+ '</a></li>';
								}
							}
							html += '</ul></li>';
						}
						$("#categoryArea").html(html);
					}
				});
	}

	function pageMove(itemIdx){
		location.href="./single.do?itemNumber="+itemIdx;
	}
	
	function checkLogin(type) {
		if ($("#userloginChk").val() === '') {
			alert("로그인이 필요한 기능입니다.");
			$("#loginBtn").click();
		} else
			if(type === 'mypage')
				location.href = './myPage.do';
			else if(type === 'cart')
				location.href = './cart.do';
	}

	window.onload = categoryLoad();
</script>
<style>
	#searchArea{
		position: absolute;
		top: 30px;
		background: white;
	}
</style>
<header class="site-navbar" role="banner">
	<%
		String url = request.getRequestURL().toString();
		int lastIndexOf = url.lastIndexOf("/") + 1;
		int urlLength = url.lastIndexOf(".");
		url = url.substring(lastIndexOf, urlLength);
	%>
	<div class="site-navbar-top">
		<div class="container">
			<div class="row align-items-center">

				<div
					class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
					<form action="" class="site-block-top-search">
						<span class="icon icon-search2"></span> <input type="text"
							class="form-control border-0" placeholder="Search" id="headerInputSearch">
					<div>
						<table class="table">
							<tbody id="searchArea" style="height:300px; overflow:auto;">
								
							</tbody>
						</table>
					</div>
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
							<li><a href="#" id="loginBtn" data-toggle="modal"
								data-target="#myModal">로그인</a> <%
 	} else {
 %>
							<li><b><%=session.getAttribute("userName")%></b>님
								&nbsp;&nbsp;</li>
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
												<input type="password" class="form-control" id="loginPw"
													name="loginPw" placeholder="비밀번호"> <br> <input
													type="hidden" value="<%=url%>" id="getNowPage"
													name="getNowPage" />
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

							<li><a href="javascript:checkLogin('mypage')">마이페이지</a></li>
							<li><a href="javascript:checkLogin('cart')" class="site-cart">
									<span class="icon icon-shopping_cart"></span>
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
				<li class="has-children"><a href="#">Shop</a>
					<ul class="dropdown" id="categoryArea">
					</ul></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="qna.do">Q & A</a></li>
			</ul>
		</div>
	</nav>

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
						<br> <input type="text" class="form-control" id="loginId"
							name="loginId" placeholder="아이디"><br> <input
							type="password" class="form-control" id="loginPw" name="loginPw"
							placeholder="비밀번호"> <br>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button id="btnLoginExecute" type="button" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</header>


<%
	if (session.getAttribute("userIdx") == null && request.getQueryString() != null
			&& request.getQueryString().equals("error")) {
%>
<script>
	alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
</script>
<%
	}
%>

<%
	String userName = "";
	if (session.getAttribute("userIdx") != null)
		userName = session.getAttribute("userIdx").toString();
%>
<input type="hidden" id="userloginChk" value="<%=userName%>" />