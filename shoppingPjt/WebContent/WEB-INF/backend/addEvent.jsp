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
					<h1>이벤트 등록 시 유의 사항</h1>
					<br />
					<p>- 모든 항목은 필수로 기재해야한다.</p>
					<p>- 색상과 사이즈는 반드시 하나 이상 입력해야한다.</p>
					<p>
						- 상품 등록 후 <strong>[상품 재고]</strong>는 상품 목록 페이지에서 입력해야한다.
					</p>
				</div>
				<hr />
				<!-- Breadcrumbs-->
				<strong>이벤트 등록</strong>
				<hr />
				<p>
					<span class="text-danger">* 모든 항목을 입력해주시기 바랍니다.</span>
				</p>
				<form id="eventForm" enctype="multipart/form-data">
					<input type="hidden" value="" id="itemIdx" name="itemIdx" />
					<div class="row">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>이벤트 제목</td>
									<td><div class="col-sm-8">
											<input type="text" id="eventTitle" name="eventTitle"
												class="form-control" value="">
										</div></td>
								</tr>
								<tr>
									<td id="dateChk">기간 설정</td>
									<td style="text-align: left;"><a href="#demo"
										class="btn btn-primary ml-3" data-toggle="collapse"
										onclick="dateSet()">기간 설정</a>
										<div id="demo" class="collapse">
											<div class="col-lg-5">
												<input type="text" id="datepicker1" readonly
													name="datepicker1" class="form-control mt-3" value="">
											</div>
											~
											<div class="col-lg-5">
												<input type="text" id="datepicker2" readonly
													name="datepicker2" class="form-control" value="">
											</div>
										</div></td>
								</tr>
								<tr>
									<td>이벤트 상품</td>
									<td>
										<div class="row">
											<div class="col-sm-5">
												<input type="text" id="eventItem" name="eventItem" readonly
													class="form-control" value="">
											</div>
											<div class="col-sm-3">
												<button type="button" id="showItem"
													class="btn btn-secondary btn-block" data-toggle="modal"
													data-target="#myModal">상품 보기</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>이벤트 상품</td>
									<td>
										<div class="col-lg-6">
											<input type="file" class="form-control" id="eventImg"
												name="eventImg" accept="image/gif, image/jpeg, image/png"><br>
											<img id="eventImage" style="width: 300px; height: 300px;">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div class="row" style="margin-bottom: 200px;">
					<div class="col-sm-6"></div>
					<div class="col-sm-4">
						<button id="addEventBtn" class="btn btn-success">이벤트 등록</button>
					</div>
				</div>
			</div>
			<hr />
			<%@include file="./include/footer.jsp"%>
		</div>
	</div>
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">이벤트 상품 선택</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-4" id="categoryArea"></div>
						<div class="col-sm-4" id="smallCategoryArea">
							<select class="form-control">
								<option>소분류</option>
							</select>
						</div>
						<div class="col-sm-3">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">검 색</span>
								</div>
								<input type="text" id="itemSearch" class="form-control">
							</div>
						</div>
					</div>
					<hr>
					<div>
						<table class="table">
							<thead>
								<tr>
									<th>상품 코드</th>
									<th>상품명</th>
									<th>이미지</th>
									<th>할인가</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="itemSection">
							</tbody>
						</table>
						<div>
							<div class="btn-group btn-group-sm" id="pageArea"></div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫
						기</button>
				</div>
				<input type="hidden" value="47" id="searchCategory">
			</div>
		</div>
	</div>

	<script>
			const pjt = window
		    .location
		    .pathname
		    .substring(0, window
		        .location
		        .pathname
		        .indexOf("/", 2));
		var dateCheck = 1;
		$(document).ready(function () {
		    $("#eventImg").change(function () {
		        if($(this).val().substring($(this).val().length-3) != 'jpg')
	        	{
		    		alert("이미지는 jpg 형식만 업로드해주시기 바랍니다.");    	
					$(this).val('');	        	
	        	}
		        else
		        	readURL(this, 'eventImage');
		    });
		    
		    $("#itemSearch").keyup(function () {
		        itemLoad(0);
		    });
		    $("#showItem").click(function () {
		        itemLoad(0);
		    });
		    $("#datepicker1, #datepicker2").datepicker({dateFormat: 'yy-mm-dd'});
		    $("#addEventBtn").click(function () {
		        if (dateCheck == -1 && !($("#datepicker1").val() != '' && $("#datepicker2").val() != '')) {
		            alert("날짜를 모두 입력해주세요.");
		        } else if ($("#eventTitle").val().trim() === '' || $("#itemIdx").val() === '' || $("#eventItem").val().trim() === '' || $("#eventImg").val() === '') {
		            alert("항목을 모두 입력해주세요.");
		        } else {
		            if (confirm("위 내용으로 정말 이벤트를 등록하시겠습니까?")) {
		                $("#eventForm")
		                    .attr("action", "./addEventExecute.admin")
		                    .attr("method", "post")
		                    .submit();
		            }
		        }
		    });
		});
		function dateSet() {
		    dateCheck *= -1;
		}
		function categoryLoad() {
		    $.ajax({
		        url: "./SelectCategory.ajax",
		        dataType: "json",
		        success: function (data) {
		            smallCategory = data.smallCategory;
		            var categoryArea = '<select class="form-control" id="category" name="category" onchange="categoryUpdate(this)">';
		            categoryArea += '<option selected="" value="">대분류</option>';
		            for (var i = 0; i < data.category.length; i++) {
		                categoryArea += '<option value=' + data.category[i].categoryChkIdx + '>' + data.category[i].categoryName + '</option>';
		            }
		            categoryArea += "</select>";
		            $("#categoryArea").html(categoryArea);
		        }
		    });
		}
		function categoryUpdate(select) {
		    if (isNaN(select.value)) 
		        return;
		    
		    var smallCategorySelect = '<select class="form-control" onchange="searchCategory(this);" id="smallCategory">';
		    smallCategorySelect += '<option selected="" value="22">소분류</option>';
		    for (var i = 0; i < smallCategory.length; i++) {
		        if (smallCategory[i].categoryHighIdx === select.value) 
		            smallCategorySelect += '<option value=' + smallCategory[i].categoryChkIdx + '>' + smallCategory[i].categoryName + '</option>';
		        
		    }
		    smallCategorySelect += '</select>';
		    $("#smallCategoryArea").html(smallCategorySelect);
		}
		function searchCategory(select) {
		    $("#searchCategory").val(select.value);
		    itemLoad(0);
		}
		function itemLoad(pageNum) {
		    $.ajax({
		        url: "./SelectEventItemList.ajax",
		        data: {
		            pageNum: pageNum,
		            search: $("#itemSearch").val(),
		            categoryNum: $("#searchCategory").val()
		        },
		        dataType: "json",
		        success: function (data) {
		            var itemSection = '';
		            var itemList = data.result;
		            var startBlock = parseInt(data.startBlock);
		            var endBlock = parseInt(data.endBlock);
		            var totalBlock = parseInt(data.totalBlock);
		            for (var i = 0; i < itemList.length; i++) {
		                itemSection += '<tr>';
		                itemSection += '<td>' + itemList[i].itemCode + '</td>';
		                itemSection += '<td>' + itemList[i].itemName + '</td>';
		                itemSection += '<td><img src="' + pjt + '/uploadImage/' + itemList[i].itemMainImg + '" style="width: 100px; height: 100px;"></td>';
		                itemSection += '<td>' + numberWithCommas(itemList[i].itemSalePrice) + '원</td>';
		                itemSection += '<td><button onclick="javascript:eventItemAdd(' + itemList[i].itemIdx + ',\'' + itemList[i].itemName + '\',\'' + itemList[i].itemCode + '\')" type="button" class="btn btn-danger" data-dismiss="modal">선 택</button></td>';
		                itemSection += '</tr>';
		            }
		            var pageArea = '';
		            if (startBlock == 0) 
		                pageArea += '<button type="button" class="btn btn-primary" disabled><</button>';
		             else 
		                pageArea += '<button type="button" class="btn btn-primary" onclick="itemLoad(' + (
		                    startBlock - 1
		                ) + ')"><</button>';
		            
		            for (var i = startBlock; i < endBlock; i++) {
		                if (i != pageNum) 
		                    pageArea += '<button type="button" class="btn btn-primary" onclick="itemLoad(' + i + ')">' + (
		                        i + 1
		                    ) + '</button>';
		                 else 
		                    pageArea += '<button type="button" class="btn btn-primary" disabled>' + (
		                        i + 1
		                    ) + '</button>';
		                
		            }
		            if (endBlock == totalBlock) 
		                pageArea += '<button type="button" class="btn btn-primary" disabled>></button>';
		             else 
		                pageArea += '<button type="button" class="btn btn-primary" onclick="itemLoad(' + endBlock + ')">></button>';
		            
		            $("#itemSection").html(itemSection);
		            $("#pageArea").html(pageArea);
		        }
		    });
		}
		// 이미지 미리보기
		function readURL(input, area) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            document.getElementById(area).src = e.target.result;
		        };
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		function eventItemAdd(idx, itemName, itemCode) {
		    $("#itemIdx").val(idx);
		    $("#eventItem").val(itemName + "[" + itemCode + "]");
		}
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		window.onload = function () {
		    categoryLoad();
		}
	</script>
</body>
</html>
