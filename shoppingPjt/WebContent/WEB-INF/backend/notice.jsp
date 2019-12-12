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
				<div class="row">
					<div class="col-lg-2">
						<strong>공지사항 목록</strong>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-3">
						<button type="button" id="updateStatus"
							class="btn btn-warning col-lg-10">개시 상태 변경</button>
						<button type="button" id="checkAll"
							class="col-lg-5 btn btn-secondary mt-2">전체 선택</button>
						<button type="button" id="unCheckAll"
							class="col-lg-5 btn btn-secondary mt-2">전체 선택 해제</button>
					</div>
					<div class="col-lg-4">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="chkNoticeStatus" checked
								value="1">개시 중
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="chkNoticeStatus" value="0">미
								개시
							</label>
						</div>
					</div>
					<div class="col-lg-2">
						<select class="form-control" id="showType">
							<option value="1" selected>개시중</option>
							<option value="0">미개시</option>
						</select>
					</div>
					<div class="col-lg-3">
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
				<div id="pageArea" class="mb-5"></div>
			</div>
			<%@include file="./include/footer.jsp"%>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="showNotice">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">공지사항</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<label for="usr">제 목 :</label> <input type="text"
							class="form-control" id="showNoticeTitle">
					</div>
					<div class="form-group">
						<label for="comment">내 용 :</label>
						<textarea class="form-control" rows="5" id="showNoticeContent"></textarea>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="updateNoticeExecute" class="btn btn-danger" data-dismiss="modal">수
						정</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫
						기</button>
				</div>
				<input type="hidden" value="" id="noticeUpdate">
			</div>
		</div>
	</div>
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script>
	$(document).ready(function () {
		$("#updateNoticeExecute").click(function(){
			if($("#showNoticeTitle").val().trim() === '' || $("#showNoticeContent").text().trim() === '')
			{
				alert("공지사항 수정 시 모든 항목을 입력하셔야합니다.");
				return;
			}
			if(confirm("정말 수정하겠습니까?"))
			{
				$.ajax({
					url : "./UpdateNotice.ajax",
					data : {
						noticeIdx : $("#noticeUpdate").val(),
						noticeTitle : $("#showNoticeTitle").val(),
						noticeContent : $("#showNoticeContent").text() 
					},success : function (data){
						alert(data);
				        loadNotice(0);
					}
				});
			}
		});
		
	    $("#showType").change(function () {
	        loadNotice(0);
	    });
	    
	    $("#updateStatus").click(function () {
	        if (confirm("개시 상태를 변경하시겠습니까?")) {
	            var noticeStatus = '';
	            $("input[name='noticeStatus']").each(function () {
	                if ($(this).is(":checked") == true) {
	                    noticeStatus += $(this).val() + ',';
	                }
	            });
	            if(noticeStatus != '')
		            $.ajax({
		                url: "./UpdateNoticeStatus.ajax",
		                data: {
		                    noticeIdx: noticeStatus,
		                    noticeStatus: $("input[name=chkNoticeStatus]:checked").val()
		                },
		                success: function (data) {
		                    alert(data);
		                    loadNotice(0);
		                }
		            });
	            else
	            	alert("개시 상태 변경할 항목을 선택해주세요.");
	        }
	    });
	    $("#checkAll").click(function () {
	        $("input[name='noticeStatus']").each(function () {
	            $(this).prop("checked", true);
	        });
	    });
	    $("#unCheckAll").click(function () {
	        $("input[name='noticeStatus']").each(function () {
	            $(this).prop("checked", false);
	        });
	    });
	});
	function loadNotice(page) {
	    $.ajax({
	        url: "./SelectNotice.ajax",
	        data: {
	            pageNum: page,
	            showType: $("#showType").val()
	        },
	        dataType: "json",
	        success: function (data) {
	            var noticeSection = '';
	            var noticeList = data.result;
	            var startBlock = parseInt(data.startBlock);
	            var endBlock = parseInt(data.endBlock);
	            var totalBlock = parseInt(data.totalBlock);
	            for (var i = 0; i < noticeList.length; i++) {
	                noticeSection += '<tr>';
	                noticeSection += '<td><input name="noticeStatus" type="checkbox" value="' + noticeList[i].noticeIdx + '" style="width: 25px; height: 25px;"></td>';
	                noticeSection += '<td><label class="btn btn-info btn-sm"><strong>' + noticeList[i].noticeTitle.substring(0, 10) + '...</strong></label></td>';
	                noticeSection += '<td>' + noticeList[i].noticeContent.substring(0, 9) + '...</td>';
	                var status = '<label class="btn btn-success btn-sm"><strong>개시중</strong></label>';
	                if (noticeList[i].noticeStatus === '0') 
	                    status = '<label class="btn btn-danger btn-sm"><strong>미개시</strong></label>';
	                
	                noticeSection += '<td>' + status + '</td>';
	                noticeSection += '<td>' + noticeList[i].noticeStartDate + '</td>';
	                var endDate = '설정 안함';
	                if (noticeList[i].noticeEndDate != '') 
	                    endDate = noticeList[i].noticeEndDate;
	                
	                noticeSection += '<td>' + endDate + '</td>';
	                noticeSection += '<td><button type="button" onclick="showNotice(\''+noticeList[i].noticeTitle+'\',\''+noticeList[i].noticeContent+'\','+noticeList[i].noticeIdx+')" class="btn btn-primary" data-toggle="modal" data-target="#showNotice">보 기</button></td>';
	                noticeSection += '</tr>';
	            }
	            $("#noticeSection").html(noticeSection);
	            var pageArea = '';
	            if (startBlock == 0) 
	                pageArea += '<button type="button" class="btn btn-primary" disabled><</button>';
	             else 
	                pageArea += '<button type="button" onclick="loadNotice(' + (
	                    startBlock - 1
	                ) + ')" class="btn btn-primary"><</button>';
	            
	            for (var i = startBlock; i < endBlock; i++) {
	                if (page != i) 
	                    pageArea += '<button type="button" onclick="loadNotice(' + i + ')" class="btn btn-primary">' + (
	                        i + 1
	                    ) + '</button>';
	                 else 
	                    pageArea += '<button type="button" class="btn btn-primary" disabled>' + (
	                        i + 1
	                    ) + '</button>';
	                
	            }
	            if (totalBlock == endBlock) 
	                pageArea += '<button type="button" class="btn btn-primary" disabled>></button>';
	             else 
	                pageArea += '<button type="button" onclick="loadNotice(' + endBlock + ')" class="btn btn-primary">></button>';
	            
	            $("#pageArea").html(pageArea);
	        }
	    });
	}

	function showNotice(title,content,idx){
		$("#noticeUpdate").val(idx);
		$("#showNoticeTitle").val(title);
		$("#showNoticeContent").html(content);
	}		
	function addNotice() {
	    location.href = "./adminAddNotice.admin";
	}
	window.onload = loadNotice(0);
	</script>
</body>
</html>
