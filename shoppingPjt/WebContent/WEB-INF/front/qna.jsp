<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#writeQuestionBtn").click(function(){
		if($("#sessionChk").val() == 0){
			if(confirm("회원만 작성이 가능합니다. 로그인하시겠습니까?")){
				$("#loginBtn").click();
			}
		}else{
			location.href="question.do";
		}
	});
});
</script>
<body>
	<%
		if (request.getQueryString() != null && request.getQueryString().equals("error")) {
	%>
	<script>
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
	</script>
	<%
		}
	%>

	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>
		<% int sessionCheck = 0; %>


		<div class="site-section">
			<div class="container">

				<div class="row mb-1">
					<div class="col-md-12 order-2">
						<div class="row">
							<div class="col-md-3">
								<form action="" class="site-block-top-search">
									<span class="icon icon-search2"></span> <input type="text"
										class="form-control border-0" placeholder="Search">
								</form>
								
							</div>
							<div class="col-md-7"></div>
							<div class="col-md-2">
							<%if (session.getAttribute("userId") != null){ 	
									sessionCheck = 1;
							} %>
								<input type="hidden" id="sessionChk" value="<%=sessionCheck%>"/>
								<input type="button" class="btn btn-primary btn-sm" id="writeQuestionBtn"
									value="문의하기" />
							
							</div>
							

						</div>
						<br>
						<div class="row mb-4">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Firstname</th>
										<th>Lastname</th>
										<th>Email</th>
										<th>index</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>John</td>
										<td>Doe</td>
										<td>john@example.com</td>
										<td>Doe</td>
									</tr>
									<tr>
										<td>Mary</td>
										<td>Moe</td>
										<td>Doe</td>

										<td>mary@example.com</td>
									</tr>
									<tr>
										<td>July</td>
										<td>Dooley</td>
										<td>Doe</td>
										<td>july@example.com</td>
									</tr>

								</tbody>
							</table>
						</div>
						<div class="row" data-aos="fade-up">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul>
										<li><a href="#">&lt;</a></li>
										<li class="active"><span>1</span></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&gt;</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>




				</div>
			</div>



		</div>
	</div>

	<%@include file="./include/footer.jsp" %>
	</div>

	<%@include file="./include/scriptArea.html" %>

</body>
</html>