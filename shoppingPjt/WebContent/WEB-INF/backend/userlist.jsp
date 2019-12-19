<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>

		<div id="content-wrapper">
			<div class="container-fluid">
				<hr>
				<strong>사용자 관리</strong>
				<hr>
				<div class="row">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="tdHead">검색 분류</td>
								<td class="tdBody">
									<div class="row">
										<div class="col-sm-12 col-lg-2 mb-3">
											<select class="form-control" id="selectSearchType">
												<option selected value="userIdx">사용자 번호</option>
												<option value="userIdenty">사용자 아이디</option>
												<option value="userName">사용자 이름</option>
												<option value="userPhone">사용자 휴대폰</option>
												<option value="userBirth">사용자 생년월일</option>
												<option value="userEmail">사용자 이메일</option>
											</select>
										</div>
										<div class="col-sm-12 col-lg-4">
											<input type="text" class="form-control" id="inputSearch">
										</div>
										<div clas="col-lg-3">
											<button type="button" id="btnSearch" class="btn btn-secondary">검 색</button>
										</div>
										<div clas="col-lg-3">
											<button type="button" id="btnInitSearch" class="btn btn-secondary ml-3">검 색 초기화</button>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-lg-2 mb-3">
						<select class="form-control" id="sortType">
							<option selected value="userIdx">정 렬</option>
							<option value="userIdx">사용자 번호</option>
							<option value="userIdenty">사용자 아이디</option>
							<option value="userName">사용자 이름</option>
							<option value="userPhone">사용자 휴대폰</option>
							<option value="userBirth">사용자 생년월일</option>
							<option value="userEmail">사용자 이메일</option>
						</select>
					</div>
				</div>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>사용자 번호</th>
								<th>사용자 아이디</th>
								<th>사용자 이름</th>
								<th>사용자 이메일</th>
								<th>사용자 휴대폰</th>
								<th>사용자 생년월일</th>
								<th>사용자 주소</th>
							</tr>
						</thead>
						<tbody id="userSection">
						</tbody>
					</table>
					<div class="btn-group ml-2" id="pageSection"></div>
				</div>
			</div>
			<%@include file="./include/footer.jsp"%>
		</div>
		<%@include file="./include/scrollTop.html"%>
		<%@include file="./include/scriptArea.html"%>
		<input type="hidden" id="searchType" value=""/>
		<input type="hidden" id="searchInput" value=""/>
		<script>
		$(document).ready(function () {
			$("#datepicker1, #datepicker2").datepicker({
				dateFormat : 'yy-mm-dd'
			});
			
			$("#sortType").change(function(){
				userload(0);
			});
			
			$("#btnSearch").click(function(){
				if($("#inputSearch").val().trim() === '')
				{
					alert("검색할 사용자를 입력해주세요.");
					$("#inputSearch").val("");
					return;
				}
				$("#searchType").val($("#selectSearchType").val());
				$("#searchInput").val($("#inputSearch").val());
				userload(0);
			});
			
			$("#btnInitSearch").click(function(){
				$("#searchType").val("");
				$("#searchInput").val("");
				$("#inputSearch").val("");
				$("#selectSearchType option:eq(0)").prop("selected", true);
				$("#sortType option:eq(0)").prop("selected", true);
				userload(0);
			});
		});
		function userload(pageNum) {
		    $.ajax({
		        url: "./SelectUserList.ajax",
		        data: {
		            pageNum: pageNum,
		            sortType : $("#sortType").val(),
		           	searchType : $("#searchType").val(),
		           	searchInput : $("#searchInput").val()
		        },
		        dataType: "json",
		        success: function (data) {
		            var userList = data.result;
		            var userSection = '';
		            var pageSection = '';
		            var startBlock = data.startBlock;
		            var endBlock = data.endBlock;
		            var totalBlock = data.totalBlock;
		            for (var i = 0; i < userList.length; i++) {
		                userSection += '<tr>';
		                userSection += '<td>' + userList[i].userIdx + '</td>';
		                userSection += '<td>' + userList[i].userIdenty + '</td>';
		                userSection += '<td>' + userList[i].userName + '</td>';
		                userSection += '<td>' + userList[i].userEmail + '</td>';
		                userSection += '<td>' + userList[i].userPhone + '</td>';
		                userSection += '<td>' + userList[i].userBirth + '</td>';
		                userSection += '<td>' + userList[i].userAddress + '</td>';
		                userSection += '</tr>';
		            }
		            if (startBlock == 0) 
		                pageSection += '<button type="button" class="btn btn-primary" disabled><</button>';
		             else 
		                pageSection += '<button type="button" class="btn btn-primary">Apple</button>';
		            
		            for (var i = startBlock; i < endBlock; i++) {
		                if (pageNum == i) 
		                    pageSection += '<button type="button" class="btn btn-primary" disabled>' + (
		                        i + 1
		                    ) + '</button>';
		                 else 
		                    pageSection += '<button type="button" class="btn btn-primary">' + (
		                        i + 1
		                    ) + '</button>';
		                
		            }
		            if (endBlock == totalBlock) 
		                pageSection += '<button type="button" class="btn btn-primary" disabled>></button>';
		             else 
		                pageSection += '<button type="button" class="btn btn-primary">></button>';
		            
		            $("#userSection").html(userSection);
		            $("#pageSection").html(pageSection);
		        }
		    });
		}
		window.onload = function () {
		    userload(0);
		};
		</script>
</body>

</html>
