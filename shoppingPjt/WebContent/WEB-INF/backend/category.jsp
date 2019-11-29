<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<script type="text/javascript">
	$(function() {
		$("button[name=updateStatusCategory]").click(function() {
			var status = 0;
			if ($(this).prev().val() === '0/')
				status = 1;
			$.ajax({
				url : "./updateCategoryStatusServlet",
				data : {
					categoryNumber : $(this).parents().prev().prev().val(),
					status : status,
					type : "true"
				},
				success : function(data) {
					if (data === 'true')
						location.href = './adminCategoryManage.do';
					else
						alert("카테고리 판매 상태 수정 실패");
				}
			});
		});

		$("button[name=updateCategory]").click(function() {
			$(this).parents().prev().attr("disabled", false);
			$(this).next().show();
			$(this).hide();
			$(this).prev().hide();
			$(this).prev().prev().hide();
			$(this).next().next().hide();
		});

		$("button[name=smallCategoryUpdate]").click(function() {
			$(this).next().show();
			$(this).parents().next().next().attr("disabled", false);
			$(this).hide();
		});

		$("button[name=smallCategoryUpdateExecute]").click(function() {
			if ($(this).parents().next().next().val().trim() === '') {
				alert("카테고리 명을 입력해주세요");
				return;
			}
			$.ajax({
				url : "./updateCategoryServlet",
				data : {
					categoryType : false,
					categoryNumber : $(this).parents().next().val(),
					categoryUpdateName : $(this).parents().next().next().val()
				},
				success : function(data) {
					location.href = './adminCategoryManage.do';
				}
			});
		});

		$("button[name=updateCategoryExecute]").click(function() {
			if ($(this).parents().prev().val().trim() === '') {
				alert("카테고리 명을 입력해주세요");
				return;
			}
			$.ajax({
				url : "./updateCategoryServlet",
				data : {
					categoryType : true,
					categoryNumber : $(this).parents().prev().prev().val(),
					categoryUpdateName : $(this).parents().prev().val()
				},
				success : function(data) {
					location.href = './adminCategoryManage.do';
				}
			});
		});

		$("#updateStatusCategoryBtn")
				.click(
						function() {
							var array = "";
							$("input[name=categoryStatus]:checked").each(
									function() {
										array += $(this).val() + ",";
									});
							$("input[name='smallCategoryStatus']:checked")
									.val()
							$
									.ajax({
										url : "./updateCategoryStatusServlet",
										data : {
											data : array,
											status : $(
													"input[name='smallCategoryStatus']:checked")
													.val(),
											type : "false"
										},
										success : function(data) {
											if (data === 'true') {
												alert("판매 상태 변경 완료");
												location.href = './adminCategoryManage.do';
											} else
												alert("판매 상태 변경 실패");
										}
									});
						});

		$("#addCategoryBtn").click(function() {
			if ($("#inputCategoryName").val().trim() === '') {
				alert("카테고리 명을 입력해주세요");
				return;
			}
			$.ajax({
				url : "./AddCategoryServlet",
				data : {
					categoryName : $("#inputCategoryName").val(),
					categoryType : $("#categoryType").val()
				},
				success : function(data) {
					if (data === 'true') {
						categoryLoad();
						location.href = './adminCategoryManage.do';
					} else
						alert("카테고리 추가 실패");
				}
			});
		});
		$("button[name=smallCategoryAddBtn]").click(
				function() {
					$("#categoryType").val(
							$(this).parents().prev().prev().val());
					$("#addCategoryType").html(
							"<h4>(" + $("#categoryType").val()
									+ ")* 소 카테고리 추가</h4>");
					$("#spanAddCategory").html("소 카테고리 명");
				});
		$("#btnCategoryAdd").click(function() {
			$("#addCategoryType").html("<h4>* 대 카테고리 추가</h4>");
			$("#spanAddCategory").html("대 카테고리 명");
			$("#categoryType").val("");
			$("#inputCategoryName").val("");
		});
	});
	function categoryLoad() {
		$
				.ajax({
					url : "./SelectCategoryServlet",
					dataType : "json",
					success : function(data) {
						var html = '';
						for (var i = 0; i < data.category.length; i++) {
							var status = '<button class="btn btn-outline-danger btn-sm">판매 중지</button>';
							if (data.category[i].categoryStatus == 0)
								status = '<button class="btn btn-outline-primary">판매 중</button>';
							html += '<li class="mb-2">';
							html += '<div class="input-group mb-3 col-lg-12">';
							html += '<input type="hidden" value="'+data.category[i].categoryChkIdx+'" /> <input type="text" class="form-control" value="'+data.category[i].categoryName+'" disabled="disabled">';
							html += '<div class="input-group-append">';
							html += '<button name="smallCategoryAddBtn" class="input-group-text">+</button>';
							html += '<button name="updateCategory" class="btn btn-success">수 정</button>';
							html += '<button name="updateCategoryExecute" class="btn btn-success" style="display:none">수정 완료</button>';
							html += status;
							html += '<input type="hidden" value='+data.category[i].categoryStatus+'/>';
							html += '<button name="updateStatusCategory" class="btn btn-info">판매 상태 수정</button>';
							html += '</div></div><ul>';
							for (var j = 0; j < data.smallCategory.length; j++) {
								if (data.category[i].categoryChkIdx == data.smallCategory[j].categoryHighIdx) {
									html += '<div class="input-group mb-3 col-lg-6 input-group-sm">';
									html += '<div class="input-group-prepend">';
									html += '<button name="smallCategoryUpdate" class="input-group-text"> 수 정 </button>';
									html += '<button name="smallCategoryUpdateExecute" class="input-group-text" style="display:none"> 수정 완료 </button>';
									html += '</div><input type="checkbox" name="categoryStatus" class="form-check-input" value="'+data.smallCategory[j].categoryChkIdx+'" style="width:17px; height:20px;">';
									html += '<input type="text" class="form-control" value='+data.smallCategory[j].categoryName+' disabled="disabled">';
									var smallCategoryStatus = '<label class="form-control btn btn-warning btn-sm">판매 중지</label>';
									if (data.smallCategory[j].categoryStatus == 1)
										smallCategoryStatus = '<label class="form-control btn btn-primary btn-sm">판매 중</label>';
									html += smallCategoryStatus;
									html += '</div>';
								}
							}
							html += '</ul></li><br />';
						}
						$("#mainCategoryArea").html(html);
					}
				});
	}
	window.onload = categoryLoad();
</script>
<style>
ul {
	list-style: none;
}
</style>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<div class="jumbotron">
					<h1>카테고리(분류)관리 시 유의 사항</h1>
					<br />
					<p>- 카테고리는 <strong>[삭제가 불가능]</strong>하며 등록시 신중하게 등록해주시기 바랍니다.</p>
					<p>
						- <strong>(소)카테고리 판매 상태</strong> 변경시 체크 버튼을 클릭 후 <strong>[소 분류 판매 상태 변경]을 클릭</strong>해주시기 바랍니다.
					</p>
				</div>
				<hr>
				<strong>분류 관리</strong>
				<hr>
				<div class="row">
					<div class="col-lg-6">
						* 상품 분류 설정
						<div class="jumbotron">
							<button id="btnCategoryAdd" type="button"
								class="btn btn-info mb-3">대 카테고리 추가</button>
							<div class="form-check-inline ml-5">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="smallCategoryStatus"
									checked="checked" value="1">판매 중
								</label>
							</div>
							<div class="form-check-inline disabled">
								<label class="form-check-label"> <input type="radio"
									class="form-check-input" name="smallCategoryStatus" value="0">판매
									중지
								</label>
							</div>
							<button type="button" id="updateStatusCategoryBtn"
								class="btn btn-info mb-3">소 분류 판매 상태 변경</button>
							<div id="categoryArea" class="jumbotron bg-light">
								<ul id="mainCategoryArea">
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div id="addCategoryType">
							<h4>*대 카테고리 추가</h4>
						</div>
						<hr />
						<div class="jumbotron">
							<div class="jumbotron bg-light">
								<div class="row">
									<div class="input-group mb-3 col-lg-8">
										<div class="input-group-prepend">
											<span id="spanAddCategory" class="input-group-text">대
												카테고리 명</span>
										</div>
										<input type="hidden" id="categoryType" value="" /> <input
											id="inputCategoryName" type="text" class="form-control">
									</div>
									<div class="col-lg-3">
										<button id="addCategoryBtn" type="button"
											class="btn btn-success">저 장</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="./include/footer.jsp"%>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@include file="./include/scrollTop.html"%>

	<%@include file="./include/scriptArea.html"%>

</body>

</html>
