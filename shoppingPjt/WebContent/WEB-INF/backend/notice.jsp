<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<div class="jumbotron">
					<h1>공지사항 관리</h1>
					<br />
					<p>
						- 삭제한 상품은 모두 <strong>[삭제일 기준 일주일]</strong> 동안 이곳에 보관되며, <strong>일주일
							후 삭제 처리</strong>됩니다.
					</p>
					<p>
						- 삭제된 상품은 <strong>[복구]가 불가능</strong>합니다.
					</p>
					<p>
						- 삭제 취소 시 해당상품은 <strong>[판매 중지]</strong> 상태로 변경됩니다.
					</p>
				</div>
				<hr />
				<hr>
				<div class="row">
					<div class="col-lg-7">
						<strong>공지사항 목록</strong>
					</div>
					<div class="col-lg-5">
						<button type="button" class="btn btn-success btn-block"
							data-toggle="modal" onclick="addNotice()">등 록</button>
					</div>
				</div>
				<hr>
			</div>
			<div class="row"></div>
			<div class="col-lg-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th></th>
							<th>제 목</th>
							<th>내 용</th>
							<th>개시 상태</th>
							<th>개시 일 자</th>
							<th>마감 일자</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="noticeSection">
					</tbody>
				</table>
			</div>
			<%@include file="./include/footer.jsp"%>
		</div>
	</div>
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script>
		$(document).ready(function() {

		});

		function loadNotice(page) {
			$.ajax({
				url : "./SelectNotice.ajax",
				data : {
					pageNum : page
				},
				dataType : "json",
				success : function(data) {
					var noticeSection = '';
					var noticeList = data.result;
					for(var i = 0;i<noticeList.length;i++)
					{
						noticeSection += '<tr>';
						noticeSection += '<td><input type="checkbox" value="'+noticeList[i].noticeIdx+'" style="width: 25px; height: 25px;"></td>';
						noticeSection += '<td>'+noticeList[i].noticeTitle+'</td>';
						noticeSection += '<td>'+noticeList[i].noticeContent+'</td>';
						var status = "개시중";
						if(noticeList[i].noticeStatus === 0)
							status = "미개시";
						noticeSection += '<td>'+status+'</td>';
						noticeSection += '<td>'+noticeList[i].noticeStartDate+'</td>';
						var endDate = '설정 안함';
						if(noticeList[i].noticeEndDate != '')
							endDate = noticeList[i].noticeEndDate;
						noticeSection += '<td>'+endDate+'</td>';
						noticeSection += '<td><button type="button" class="btn btn-primary">보 기</button></td>';
						noticeSection += '</tr>';
					}
					$("#noticeSection").html(noticeSection);
				}
			});
		}

		function addNotice() {
			location.href = "./adminAddNotice.admin";
		}

		window.onload = loadNotice(0);
	</script>
</body>
</html>
