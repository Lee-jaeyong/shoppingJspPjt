<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<script type="text/javascript">
	$(function() {
		$("button[name=updateCategory]").click(function(){
			$(this).parents().prev().attr("disabled",false);
			$(this).next().show();
			$(this).hide();
			$(this).prev().hide();
			$(this).prev().prev().hide();
		});
		
		$("button[name=smallCategoryUpdate]").click(function(){
			$(this).next().show();
			$(this).parents().next().next().attr("disabled",false);
			$(this).hide();
		});
		
		$("button[name=smallCategoryUpdateExecute]").click(function() {
			if($(this).parents().next().next().val() === '')
			{
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
			if($(this).parents().prev().val() === '')
			{
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

		$("button[name=dropCategory]").click(function() {
			$.ajax({
				url : "./deleteCategoryServlet",
				data : {
					data : $(this).parents().prev().prev().val(),
					type : 'false'
				},
				success : function(data) {
					location.href = './adminCategoryManage.do';
				}
			});
		});

		$("#deleteCategoryBtn").click(function() {
			var array = "";
			$("input[name=categoryStatus]:checked").each(function() {
				array += $(this).val() + ",";
			});
			$.ajax({
				url : "./deleteCategoryServlet",
				data : {
					data : array,
					type : 'true'
				},
				success : function(data) {
					location.href = './adminCategoryManage.do';
				}
			});
		});

		$("#addCategoryBtn").click(function() {
			if($("#inputCategoryName").val() === '')
			{
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
							html += '<li class="mb-2">';
							html += '<div class="input-group mb-3 col-lg-8">';
							html += '<input type="hidden" value="'+data.category[i].categoryChkIdx+'" /> <input type="text" class="form-control" value="'+data.category[i].categoryName+'" disabled="disabled">';
							html += '<div class="input-group-append">';
							html += '<button name="smallCategoryAddBtn" class="input-group-text">+</button>';
							html += '<button name="dropCategory" class="input-group-text">삭 제</button>';
							html += '<button name="updateCategory" class="input-group-text">수 정</button>';
							html += '<button name="updateCategoryExecute" class="input-group-text" style="display:none">수정 완료</button>';
							html += '</div></div><ul>';
							for (var j = 0; j < data.smallCategory.length; j++) {
								if (data.category[i].categoryChkIdx == data.smallCategory[j].categoryHighIdx) {
									html += '<div class="input-group mb-3 col-lg-6 input-group-sm">';
									html += '<div class="input-group-prepend">';
									html += '<button name="smallCategoryUpdate" class="input-group-text"> 수 정 </button>';
									html += '<button name="smallCategoryUpdateExecute" class="input-group-text" style="display:none"> 수정 완료 </button>';
									html += '</div><input type="checkbox" name="categoryStatus" class="form-check-input" value="'+data.smallCategory[j].categoryChkIdx+'">';
									html += '<input type="text" class="form-control" value='+data.smallCategory[j].categoryName+' disabled="disabled">';
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
				<!-- Breadcrumbs-->
				<h5>분류 관리</h5>
				<hr>
				<div class="row">
					<div class="col-lg-6">
						* 상품 분류 설정
						<div class="jumbotron">
							<button id="btnCategoryAdd" type="button"
								class="btn btn-info mb-3">대 카테고리 추가</button>
							<button id="btnCategoryAdd" type="button"
								class="btn btn-info mb-3">판매 상태 변경</button>
							<button type="button" id="deleteCategoryBtn"
								class="btn btn-info mb-3">삭 제</button>
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
