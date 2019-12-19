<%@page import="shopping.database.dto.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
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
				<div class="jumbotron">
					<h1>대표카테고리 관리</h1>
					<br />
					<p>
						- 대표카테고리는 최대 <strong>[3개]</strong> 까지 등록가능합니다.
					</p>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-7">
						<strong>등록된 대표 카테고리</strong>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-5">
						<button type="button" class="btn btn-secondary btn-block"
							id="btnAddRepresent">등 록</button>
					</div>
				</div>
				<hr>
				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>카테고리 이름</th>
								<th>이미지</th>
								<th>URL</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<CategoryDTO> list = (ArrayList) request.getAttribute("representList");
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><label class="btn btn-primary"><%=list.get(i).getRepresentName()%></label></td>
								<td><img src="${pageContext.request.contextPath}/uploadRepresentCategory/<%=list.get(i).getRepresentPath()%>"
									style="width: 150px; height: 150px;" /></td>
								<td><a target="_blank"
									href="./shop.do?category=<%=list.get(i).getSmallCategoryIdx()%>">./shop.do?category=<%=list.get(i).getSmallCategoryIdx()%></a></td>
								<td><button
										onclick="deleteRepresent(<%=list.get(i).getRepresentIdx()%>,'<%=list.get(i).getRepresentPath()%>')"
										type="button" class="btn btn-secondary">삭 제</button></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div class="row"></div>
			</div>
			<%@include file="./include/footer.jsp"%>
		</div>
		<%@include file="./include/scrollTop.html"%>
		<%@include file="./include/scriptArea.html"%>
	</div>
	<!-- The Modal -->
	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">대표 카테고리 등록</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="representForm">
						<div class="row">
							<div class="col-sm-12 col-lg-12" id="categoryArea"></div>
						</div>
						<div class="row mt-3">
							<div class="col-lg-6">
								<input type="file" id="representImg" name="representImg" />
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-lg-6">
								<img src="#" id="showRepresentImg"
									style="width: 300px; height: 300px;" />
							</div>
						</div>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="btnAddRepresentExecute"
						class="btn btn-secondary">등 록</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫 기</button>
				</div>

				<form id="deleteRepresentCategoryForm">
					<input type="hidden" name="representIdx" id="representIdx" /> <input
						type="hidden" name="representPath" id="representPath" />
				</form>
			</div>
		</div>
	</div>
	<input type="hidden" id="representCount"
		value="<%=request.getAttribute("count")%>">
	<script>
	$(document).ready(function () {
	    $("#btnAddRepresent").click(function () {
	    	if(parseInt($("#representCount").val()) >= 3)
	    		alert("대표 카테고리는 최대 3개까지만 등록 가능합니다.");
	    	else
    		{
				$(this).attr("data-toggle","modal").attr("data-target","#myModal");
        		categoryLoad();
    		}
    	});
	    
	    $("#representImg").change(function () {
	        readURL(this, 'showRepresentImg');
	    });
	    
	    $("#btnAddRepresentExecute").click(function () {
	    	if ($("#category").val() === '') 
	            alert("대분류를 선택해주세요.");
	         else if ($("#representImg").val().trim() === '') 
	            alert("이미지를 선택해주세요.");
	         else {
	        	$.ajax({
	        		url : "./SelectRepresentCategoryCheck.ajax",
	        		data : {
	        			representCategory : $("#category").val()
	        		},
	        		success : function(data){
						if(data === 'false')
							alert("이미 등록된 동일한 카테고리가 존재합니다.");
						else
						{
							if(confirm("정말 위 내용으로 대표 카테고리를 등록하시겠습니까?"))
					            $("#representForm")
					                .attr("action", "./addRepresentCategory.admin")
					                .attr("enctype", "multipart/form-data")
					                .attr("method", "post")
					                .submit();
						}
	        		}
	        	});
	        }
	    });
    });
	
	function categoryLoad() {
	    $.ajax({
	        url: "./SelectCategory.ajax",
	        dataType: "json",
	        success: function (data) {
	            smallCategory = data.smallCategory;
	            var categoryArea = '<select class="form-control" id="category" name="category">';
	            categoryArea += '<option selected value="">대분류</option>';
	            for (var i = 0; i < data.category.length; i++) {
	                categoryArea += '<option value=' + data.category[i].categoryChkIdx + '>' + data.category[i].categoryName + '</option>';
	            }
	            categoryArea += "</select>";
	            $("#categoryArea").html(categoryArea);
	        }
	    });
	}
	function deleteRepresent(idx, path) {
	    if (confirm("정말 대표 카테고리를 삭제하시겠습니까?")) {
	        $("#representIdx").val(idx);
	        $("#representPath").val(path);
	        $("#deleteRepresentCategoryForm")
	            .attr("method", "post")
	            .attr("action", "./deleteRepresentCategory.admin")
	            .submit();
	    }
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
		
	</script>
</body>

</html>
