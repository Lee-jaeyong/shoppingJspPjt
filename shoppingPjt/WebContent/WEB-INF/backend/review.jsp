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
				<strong>상품 후기 관리</strong>
				<hr>
				<div class="row">
					<div class="col-sm-1">
						<label for="sel1" style="margin-top: 5px; margin-left: 10px;">상품
							검색 :</label>
					</div>
					<div class="col-sm-2" id="categoryArea">
					</div>
					<div class="col-sm-2" id="smallCategoryArea">
						<select class="form-control">
							<option>소분류</option>
						</select>
					</div>
					<div class="col-sm-1"></div>
					<div class="col-sm-2">
						<select class="form-control" id="searchType">
							<option value="itemName">상품명</option>
							<option value="userName">작성자 명</option>
							<option value="userIdenty">아이디 명</option>
						</select>
					</div>
					<div class="col-sm-2">
						<div class="input-group mb-3">
							<input type="text" id="searchAdminInput" class="form-control">
							<div class="input-group-append">
								<button id="btnSearchReview" type="button" class="btn btn-success">검 색</button>
							</div>
						</div>
					</div>
					<div>
						<button id="refreshSearchReview" type="button" class="btn btn-primary">검색 초기화</button>
					</div>
				</div>
				<hr>
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-sm-10">
						<button id="deleteReivew" type="button" class="btn btn-outline-secondary">삭
							제</button>
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="sortType">
							<option value="reviewIdx" selected="selected">등록일 순</option>
							<option value="reviewStar">별점 높은 순</option>
						</select>
					</div>
				</div>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>선 택</th>
								<th>상품명</th>
								<th>후 기</th>
								<th>작성자</th>
								<th>아이디</th>
								<th>등록일</th>
								<th>별 점</th>
							</tr>
						</thead>
						<tbody id="reviewSection">
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-sm-5"></div>
					<div class="col-sm-3">
						<div class="btn-group" id="pageMoveBtn"></div>
					</div>
				</div>
				<div class="row" style="margin-top: 30px;">
					<div class="col-sm-12">
						<div class="jumbotron">
							<h3>도움말</h3>
							<p>- 상품 후기 보기 삭제가 가능합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" value="reviewIdx" id="searchTypeSend"/>
		<input type="hidden" value="" id="searchInputSend"/>
		<input type="hidden" value="0" id="categorySearch"/>
		<%@include file="./include/footer.jsp"%>
	</div>
	<%@include file="./include/scrollTop.html"%>
	<%@include file="./include/scriptArea.html"%>
	<script>
		$(document).ready(function() {
			$("#deleteReivew").click(function(){
				if(confirm("정말 리뷰 목록을 삭제하시겠습니까?"))
				{
					var deleteReviewList = '';
					$("input[name='reviewCheck']").each(function(){
						if($(this).is(":checked") == true) {
							deleteReviewList += $(this).val()+',';
						}
					});
					$.ajax({
						url : "./DeleteReview.ajax",
						data : {
							reviewIdx : deleteReviewList
						},
						success : function(data){
							alert(data);
							$("#refreshSearchReview").click();
						}
					});
				}
			});
			
			$("#refreshSearchReview").click(function(){
				$("#categorySearch").val('0');
				$("#searchInputSend").val('');
				$("#searchTypeSend").val('reviewIdx');
				$("#sortType").find("option:eq(0)").prop("selected", true);
				$("#searchType").find("option:eq(0)").prop("selected", true);
				$("#category").find("option:eq(0)").prop("selected", true);
				$("#smallCategory").find("option:eq(0)").prop("selected", true);
				$("#searchAdminInput").val('');
				loadReview(0);
			});
			
			$("#btnSearchReview").click(function(){
				$("#searchInputSend").val($("#searchAdminInput").val());
				$("#searchTypeSend").val($("#searchType").val());
				loadReview(0);
			});
			
			$("#sortType").change(function(){
				loadReview(0);
			});
		});

		function loadReview(page) {
			$.ajax({
						url : "./SelectReviewAll.ajax",
						data : {
							pageNum : page,
							searchCategory : $("#categorySearch").val(),
							searchInputSend : $("#searchInputSend").val(),
							searchTypeSend : $("#searchTypeSend").val(),
							sortType : $("#sortType").val()
						},
						dataType : "json",
						success : function(data) {
							var reviewList = data.result;
							var startBlock = parseInt(data.startBlock);
							var endBlock = parseInt(data.endBlock);
							var totalBlock = parseInt(data.totalBlock);
							var reviewSection = '';
							for (var i = 0; i < reviewList.length; i++) {
								reviewSection += '<tr>';
								reviewSection += '<td><input name="reviewCheck" type="checkbox" style="width:25px; height:25px;" value="'+reviewList[i].reviewIdx+'"/></td>';
								reviewSection += '<td><label class="btn btn-success btn-sm">'
										+ reviewList[i].itemName
										+ reviewList[i].reviewTitle
										+ '</label></td>';
								reviewSection += '<td><label class="btn btn-primary btn-sm">'
										+ reviewList[i].reviewContent
										+ '</label></td>';
								reviewSection += '<td>'
										+ reviewList[i].userName + '</td>';
								reviewSection += '<td>'
										+ reviewList[i].userIdenty + '</td>';
								reviewSection += '<td>'
										+ reviewList[i].reviewDate + '</td>';
								reviewSection += '<td>';
								for (var j = 0; j < parseInt(reviewList[i].reviewStar); j++)
									reviewSection += '<i class="mr-1 fas fa-heart"></i>';
								reviewSection += '</td>';
								reviewSection += '</tr>';
							}
							$("#reviewSection").html(reviewSection);
							var pageMoveBtn = '';
							if (startBlock == 0)
								pageMoveBtn += '<button type="button" class="btn btn-info" disabled><</button>';
							else
								pageMoveBtn += '<button type="button" class="btn btn-info"><</button>';
							for (var i = startBlock; i < endBlock; i++) {
								if (page == i)
									pageMoveBtn += '<button type="button" class="btn btn-info" disabled>'
											+ (i + 1) + '</button>';
								else
									pageMoveBtn += '<button type="button" class="btn btn-info">'
											+ (i + 1) + '</button>';
							}
							if (totalBlock == endBlock)
								pageMoveBtn += '<button type="button" class="btn btn-info" disabled>></button>';
							else
								pageMoveBtn += '<button type="button" class="btn btn-info">></button>';
							$("#pageMoveBtn").html(pageMoveBtn);
						}
					});
		}
		function categoryLoad() {
			$
					.ajax({
						url : "./SelectCategory.ajax",
						dataType : "json",
						success : function(data) {
							smallCategory = data.smallCategory;
							var categoryArea = '<select class="form-control" id="category" name="category" onchange="categoryUpdate(this)">';
							categoryArea += '<option selected="" value="">대분류</option>';
							for (var i = 0; i < data.category.length; i++) {
								categoryArea += '<option value='+data.category[i].categoryChkIdx+'>'
										+ data.category[i].categoryName
										+ '</option>';
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
			smallCategorySelect += '<option selected="" value="">소분류</option>';

			for (var i = 0; i < smallCategory.length; i++) {
				if (smallCategory[i].categoryHighIdx === select.value)
					smallCategorySelect += '<option value='+smallCategory[i].categoryChkIdx+'>'
							+ smallCategory[i].categoryName + '</option>';
			}
			smallCategorySelect += '</select>';
			$("#smallCategoryArea").html(smallCategorySelect);
		}

		function searchCategory(select){
			$("#categorySearch").val($(select).val());
			loadReview(0);
		}		
		
		window.onload = function(){
			categoryLoad();
			loadReview(0);
		}
	</script>
</body>

</html>
