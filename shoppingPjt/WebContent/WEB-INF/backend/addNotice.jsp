<%@page import="shopping.database.dto.ItemDTO"%>
<%@page import="shopping.database.dao.ItemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<div class="jumbotron">
					<h1>상품 등록 시 유의 사항</h1>
					<br />
					<p>- 모든 항목은 필수로 기재해야한다.</p>
					<p>- 색상과 사이즈는 반드시 하나 이상 입력해야한다.</p>
					<p>
						- 상품 등록 후 <strong>[상품 재고]</strong>는 상품 목록 페이지에서 입력해야한다.
					</p>
				</div>
				<hr />
				<!-- Breadcrumbs-->
				<strong>공지사항 등록</strong>
				<hr />
				<p>
					<span class="text-danger">* 모든 항목을 입력해주시기 바랍니다.</span>
				</p>
				<form id="noticeForm">
					<div class="row">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>공지사항 제목</td>
									<td><div class="col-sm-8">
											<input type="text" id="noticeTitle" name="noticeTitle"
												class="form-control" value="">
										</div></td>
								</tr>
								<tr>
									<td>전시 상태</td>
									<td style="text-align: left;">
										<div class="form-check-inline ml-3">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="noticeStatus" checked
												value="1">개시
											</label>
										</div>
										<div class="form-check-inline">
											<label class="form-check-label"> <input type="radio"
												class="form-check-input" name="noticeStatus" value="0">미
												개시
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td id="dateChk">기간 설정</td>
									<td style="text-align: left;"><a href="#demo"
										class="btn btn-primary ml-3" data-toggle="collapse" onclick="dateSet()">기간 설정</a>
										<div id="demo" class="collapse">
											<div class="col-lg-5">
												<input type="text" id="datepicker1" readonly name="datepicker1"
													class="form-control mt-3" value="">
											</div>
											~
											<div class="col-lg-5">
												<input type="text" id="datepicker2" readonly name="datepicker2"
													class="form-control" value="">
											</div>
										</div></td>
								</tr>
								<tr>
									<td>공지사항 내용</td>
									<td><div class="col-sm-8">
											<textarea class="form-control" rows="5" name="noticeContent"
												id="noticeContent"></textarea>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div class="row" style="margin-bottom: 200px;">
					<div class="col-sm-6"></div>
					<div class="col-sm-4">
						<button id="btnAddNotice" class="btn btn-success">공지사항 등록</button>
					</div>
				</div>
			</div>
			<hr />
			<%@include file="./include/footer.jsp"%>
		</div>
	</div>
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script>
		var dateCheck = 1;
		
		$(document).ready(function(){
			$("#datepicker1, #datepicker2").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			
			$("#btnAddNotice").click(function(){
				if(dateCheck == -1 && !($("#datepicker1").val() != '' && $("#datepicker2").val() != ''))
				{
					alert("날짜를 모두 입력해주세요.");
				}else if($("#noticeTitle").val().trim() === '')
				{
					alert("공지사항 제목을 입력해주세요.");
				}else if(!isNaN($("#noticeTitle").val()))
				{
					alert("공지사항 제목을 다시 입력해주세요.");
				}
				else if($("#noticeContent").val().trim() === '')
				{
					alert("공지사항 내용을 입력해주세요.");
				}else if(!isNaN($("#noticeContent").val()))
				{
					alert("공지사항 내용을 다시 입력해주세요.");
				}else
				{
					if(confirm("위 내용으로 정말 공지사항을 등록하시겠습니까?"))
					{
						$("#noticeForm").attr("action","./addNoticeExecute.admin").attr("method","post").submit();	
					}
				}
			});
		});
		function dateSet(){
			dateCheck *= -1;
		}
	</script>
</body>
</html>
