<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#OkQuestion").click(
						function() {
							if ($("#title").val() == "") {
								alert("제목을 입력해주세요");
								$("#title").focus();
							} else if ($("#summernote").val() == "") {
								alert("내용을 입력해주세요.");
								$("#summernote").focus();
							} else
								$("#questionForm").attr("action",
										"enterQuestion.do").attr("method",
										"post").submit();
							alert("질문이 등록되었습니다.");
						});
			});
</script>
<%@include file="./include/head.jsp"%>
<%
	if (request.getQueryString() != null && request.getQueryString().equals("fail")) {
%>
<script>
	alert("질문을 등록하는데 문제가 발생하였습니다.");
</script>
<%
	}
	if(session.getAttribute("userIdx") ==null)
		response.sendRedirect("index.do");
%>
<body>

	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="#">문의하기</a>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<form id="questionForm">
					<div class="row">
						<div class="col-md-12 mb-12 mb-md-0">
							<h2 class="h3 mb-3 text-black">Q & A</h2>
							<div class="p-3 p-lg-5 border">

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_fname" class="text-black">제목<span
											class="text-info"> [작성자 : <%=session.getAttribute("userName")%>]
										</span></label> <input type="text" class="form-control" id="title"
											name="title">
										<div id="idMsg"></div>
									</div>
								</div>

								<div class="form-group">
									<div class="row">
										<label for="c_fname" class="text-black">&nbsp;&nbsp;&nbsp;문의내용
										</label>
									</div>


									<!-- <textarea name="mainTxt" id="mainTxt" cols="30" rows="8"
										class="form-control"></textarea> -->
									<textarea id="summernote" name="mainTxt"></textarea>
								</div>
								<input type="hidden"
									value="<%=session.getAttribute("userIdx")%>" name="userIdx" />

								<input type="button" class="btn btn-primary btn-lg btn-block"
									id="OkQuestion" value="등록하기" />

							</div>
						</div>

					</div>
				</form>
			</div>
		</div>

		<%@include file="./include/footer.jsp"%>
	</div>

	<%@include file="./include/scriptArea.html"%>






</body>
</html>