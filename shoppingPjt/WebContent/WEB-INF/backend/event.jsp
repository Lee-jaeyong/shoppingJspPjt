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
					<h1>이벤트 관리</h1>
					<br />
					<p>
						- 이벤트는 최대 <strong>[3개]</strong> 까지 등록가능합니다.
					</p>
				</div>
				<hr />
				<div class="row">
					<div class="col-lg-2">
						<strong>현재 진행중인 이벤트</strong>
					</div>
				</div>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th style="width: 100px;">번 호</th>
								<th>제 목</th>
								<th>이벤트 품명</th>
								<th>이미지</th>
								<th>URL</th>
								<th>시작일</th>
								<th>종료일</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="nowEvent">
						</tbody>
					</table>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-2">
						<strong>이벤트 목록</strong>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-6">
						<button type="button" class="btn btn-success btn-block"
							onclick="location.href='./adminAddEvent.admin'">등 록</button>
					</div>
				</div>
				<hr>
			</div>
			<div class="row"></div>
			<div class="col-lg-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width: 100px;">번 호</th>
							<th>제 목</th>
							<th>이벤트 품명</th>
							<th>이미지</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>URL</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="eventSection">
					</tbody>
				</table>
				<div class="mb-5">
					<div id="pageArea" class="btn-group"></div>
				</div>
			</div>
			<%@include file="./include/footer.jsp"%>
		</div>
	</div>
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script>
	const ctx = window
    .location
    .pathname
    .substring(0, window
        .location
        .pathname
        .indexOf("/", 2));
function loadEvent(pageNum) {
    $.ajax({
        url: "./SelectEvent.ajax",
        data: {
            pageNum: pageNum
        },
        dataType: "json",
        success: function (data) {
            var eventList = data.result;
            var startBlock = parseInt(data.startBlock);
            var endBlock = parseInt(data.endBlock);
            var totalBlock = parseInt(data.totalBlock);
            var eventSection = '';
            var pageArea = '';
            var nowEvent = '';
            for (var i = 0; i < eventList.length; i++) {
            	if(eventList[i].status == 1)
           		{
            		nowEvent += '<tr>';
            		nowEvent += '<td>' + eventList[i].eventIdx + '</td>';
            		nowEvent += '<td><label class="btn btn-primary btn-sm">' + eventList[i].eventTitle + '</label></td>';
            		nowEvent += '<td><label class="btn btn-success btn-sm">' + eventList[i].itemName + '</label></td>';
            		nowEvent += '<td><img src="' + ctx + '/uploadBest/' + eventList[i].eventImg + '" style="width: 100px; height: 100px;"></td>';
            		nowEvent += '<td><a href=./single.do?itemNumber=' + eventList[i].eventItemIdx + ' target=_blank>./single.do?itemNumber=' + eventList[i].eventItemIdx + '</a></td>';
            		nowEvent += '<td><label class="btn btn-success btn-sm">' + eventList[i].eventStart + '</label></td>';
	           		 var eventEnd = "설정 안함";
	                    if(eventList[i].eventEnd != '')
	                    	eventEnd = eventList[i].eventEnd;
            		nowEvent += '<td><label class="btn btn-success btn-sm">' + eventEnd + '</label></td>';
            		nowEvent += '<td><button onclick="updateEventStatus(' + eventList[i].eventIdx + ',0)" type="button" class="btn btn-danger">이벤트 중지</button></td>';
            		nowEvent += '</tr>';
           		}
                eventSection += '<tr>';
                eventSection += '<td>' + eventList[i].eventIdx + '</td>';
                eventSection += '<td><label class="btn btn-primary btn-sm">' + eventList[i].eventTitle + '</label></td>';
                eventSection += '<td><label class="btn btn-success btn-sm">' + eventList[i].itemName + '</label></td>';
                eventSection += '<td><img src="' + ctx + '/uploadBest/' + eventList[i].eventImg + '" style="width: 100px; height: 100px;"></td>';
                eventSection += '<td><a href=./single.do?itemNumber=' + eventList[i].eventItemIdx + ' target=_blank>./single.do?itemNumber=' + eventList[i].eventItemIdx + '</a></td>';
                eventSection += '<td><label class="btn btn-success btn-sm">' + eventList[i].eventStart + '</label></td>';
                var eventEnd = "설정 안함";
                if(eventList[i].eventEnd != '')
                	eventEnd = eventList[i].eventEnd;
                eventSection += '<td><label class="btn btn-success btn-sm">' + eventEnd + '</label></td>';
                if (eventList[i].status == 0) 
                    eventSection += '<td><button onclick="updateEventStatus(' + eventList[i].eventIdx + ',1)" type="button" class="btn btn-info">이벤트 개시</button></td>';
                 else 
                    eventSection += '<td><button onclick="updateEventStatus(' + eventList[i].eventIdx + ',0)" type="button" class="btn btn-danger">이벤트 중지</button></td>';
                 eventSection += '</tr>';
            }
            if (startBlock == 0) 
                pageArea += '<button type="button" class="btn btn-primary" disabled><</button>';
             else 
                pageArea += '<button type="button" onclick="loadEvent(' + (
                    startBlock - 1
                ) + ')" class="btn btn-primary"><</button>';
            
            for (var i = startBlock; i < endBlock; i++) {
                if (pageNum != i) 
                    pageArea += '<button type="button" onclick="loadEvent(' + i + ')" class="btn btn-primary">' + (
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
                pageArea += '<button type="button" onclick="loadEvent(' + endBlock + ')" class="btn btn-primary">></button>';
            
            $("#eventSection").html(eventSection);
            $("#pageArea").html(pageArea);
            $("#nowEvent").html(nowEvent);
        }
    });
}
function updateEventStatus(idx, status) {
    var chk = false;
    if (status == 1) {
        if (confirm("해당 이벤트를 개시하시겠습니까?")) 
            chk = true;
        
    } else {
        if (confirm("해당 이벤트를 중지하시겠습니까?")) 
            chk = true;
        
    }
    if (chk) 
        $.ajax({
            url: "./UpdateEventStatus.ajax",
            data: {
                eventIdx: idx,
                status: status
            },
            success: function (data) {
                alert(data);
                loadEvent(0);
            }
        });
    
}
window.onload = function () {
    loadEvent(0);
}
	</script>
</body>
</html>
