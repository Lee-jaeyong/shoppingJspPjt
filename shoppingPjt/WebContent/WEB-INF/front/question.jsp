<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp" %>
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

				<div class="row">
					<div class="col-md-12 mb-12 mb-md-0">
						<h2 class="h3 mb-3 text-black">Q & A</h2>
						<div class="p-3 p-lg-5 border">

							<div class="form-group row">
								<div class="col-md-12">
									<label for="c_fname" class="text-black">제목<span
										class="text-info"> [작성자 : 누구누구]</span></label> <input type="text"
										class="form-control" id="title" name="title">
									<div id="idMsg"></div>
								</div>
							</div>

							<div class="form-group">
								<label for="c_fname" class="text-black">문의내용 </label>
								<textarea name="notes" id="notes" cols="30" rows="8"
									class="form-control"></textarea>
							</div>

							<input type="button" class="btn btn-primary btn-lg btn-block"
								id="OkQuestion" value="등록하기" />

						</div>
					</div>

				</div>
				<!-- </form> -->
			</div>
		</div>

		<%@include file="./include/footer.jsp" %>
	</div>

	<%@include file="./include/scriptArea.html" %>

</body>
</html>