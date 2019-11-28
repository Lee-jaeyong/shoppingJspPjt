<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<script type="text/javascript">
	var smallCategory;
	$(function() {
		$("#btnUpdateStatus").click(function() {
			var chkIdx = "";
			$("input[name=itemIdx]:checked").each(function() {
				chkIdx += $(this).val() + ",";
			});
			$.ajax({
				url : "./UpdateItemStatusServlet",
				data : {
					chkIdx : chkIdx,
					status : $("input[name=itemStatus]:checked").val()
				},
				success : function(data) {
					if (data === 'true') {
						alert("판매상태 수정 완료");
						getItemList(0);
					} else
						alert("판매상태 수정 실패");
				}
			});
		});

		$("#btnExcelUpload").click(function() {
			location.href = "./adminExcelUpload.do";
		});

		$("#btnAllItem").click(
				function() {
					$("#searchItemType").val("");
					$("#searchItemTitle").val("");
					$("#searchItemSmallCategory").val("");
					$("#searchItemBefore").val("");
					$("#searchItemAfter").val("");
					$("#smallCategory > option[value='']").attr("selected",
							"true");
					$("#category > option[value='']").attr("selected", "true");
					$("#inputSearchItemType > option[value='itemName']").attr(
							"selected", "true");
					$("#datepicker1").val("");
					$("#datepicker2").val("");
					getItemList(0);
				});

		$("#btnSearchItem")
				.click(
						function() {
							if (($("#datepicker1").val() != '' || $(
									"#datepicker2").val() != '')
									&& !($("#datepicker1").val() != '' && $(
											"#datepicker2").val())) {
								alert("상품 등록일을 모두 입력해주세요.");
								return;
							}
							var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

							if (($("#datepicker1").val() != '' && $(
									"#datepicker2").val() != '')
									&& (!date_pattern.test($("#datepicker1")
											.val()) || !date_pattern.test($(
											"#datepicker2").val()))) {
								alert("등록일을 다시 입력해주세요.");
								return;
							}

							$("#searchItemType").val(
									$("#inputSearchItemType").val());
							$("#searchItemTitle").val(
									$("#inputSearchItemTitle").val());
							$("#searchItemSmallCategory").val(
									$("#smallCategory").val());
							$("#searchItemBefore").val($("#datepicker1").val());
							$("#searchItemAfter").val($("#datepicker2").val());
							getItemList(0);
						});

		$("#sortType,#showType").change(function() {
			getItemList($("#nowPageNum").val());
		});

		$("#datepicker1, #datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});

		$("#itemStockUpdate").click(function() {
			var _updateStockIdx = $("input[name=updateStockIdx]");
			var _updateStock = $("input[name=updateStock]");
			var updateStockIdx = "";
			var updateStock = "";
			for (var i = 0; i < _updateStockIdx.length; i++) {
				updateStockIdx += _updateStockIdx[i].value + ",";
				updateStock += _updateStock[i].value + ",";
				if (isNaN(_updateStock[i].value)) {
					alert("재고를 다시 입력해주세요.");
					return;
				}
			}
			$.ajax({
				url : "./UpdateStockServlet",
				data : {
					updateStockIdx : updateStockIdx,
					updateStock : updateStock
				},
				success : function(data) {
					alert("재고 수정 완료");
				}
			});
		});
	});

	function showItemOption(button) {
		$
				.ajax({
					url : "./SelectItemOptionServlet",
					data : {
						itemIdx : $(button).parents("td").prev().prev().prev()
								.prev().text()
					},
					dataType : "json",
					success : function(data) {
						var itemOption = data.options;
						var optionArea = "";
						for (var i = 0; i < itemOption.length; i++) {
							optionArea += '<div class="input-group mb-3">';
							optionArea += '<div class="input-group-prepend">';
							optionArea += '<input type="hidden" name="updateStockIdx" value="'+itemOption[i].opIdx+'"><span class="input-group-text">'
									+ itemOption[i].opColor
									+ "[ "
									+ itemOption[i].opSize + ' ]</span></div>';
							optionArea += '<input name="updateStock" type="text" class="form-control" value="'+itemOption[i].itemStock+'"></div>';
						}
						$("#itemOption").html(optionArea);
					}
				});
	}

	function categoryUpdate(select) {
		if (isNaN(select.value))
			return;

		var smallCategorySelect = '<select class="form-control" id="smallCategory">';
		smallCategorySelect += '<option selected="" value="">소분류</option>';

		for (var i = 0; i < smallCategory.length; i++) {
			if (smallCategory[i].categoryHighIdx === select.value)
				smallCategorySelect += '<option value='+smallCategory[i].categoryChkIdx+'>'
						+ smallCategory[i].categoryName + '</option>';
		}
		smallCategorySelect += '</select>';
		$("#smallCategoryArea").html(smallCategorySelect);
	}

	function categoryLoad() {
		$
				.ajax({
					url : "./SelectCategoryServlet",
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

	function getItemList(pageNum) {
		$("#nowPageNum").val(pageNum);
		$
				.ajax({
					url : "./SelectItemServlet",
					data : {
						pageNum : pageNum,
						showType : $("#showType").val(),
						sortType : $("#sortType").val(),
						searchItemType : $("#searchItemType").val(),
						searchItemTitle : $("#searchItemTitle").val(),
						searchItemSmallCategory : $("#searchItemSmallCategory")
								.val(),
						searchItemBefore : $("#searchItemBefore").val(),
						searchItemAfter : $("#searchItemAfter").val()
					},
					dataType : "json",
					success : function(data) {
						var items = data.result;
						var startBlock = parseInt(data.startBlock);
						var endBlock = parseInt(data.endBlock);
						var totalBlock = parseInt(data.totalBlock);
						var nowPageNum = parseInt($("#nowPageNum").val());
						var itemSection = "";
						var pageArea = "";

						for (var i = 0; i < items.length; i++) {
							var status = items[i].itemStatus == 1 ? "판매중"
									: "판매 중지";
							itemSection += "<tr>";
							itemSection += '<td><input type="checkBox" name="itemIdx" value="'+items[i].itemIdx+'" style="width:25px;height:25px;"/></td>';
							itemSection += '<td>' + items[i].itemIdx + '</td>';
							itemSection += '<td>' + items[i].itemCode + '</td>';
							itemSection += '<td>' + items[i].itemMainImg
									+ '</td>';
							itemSection += '<td>' + items[i].itemName + '</td>';
							itemSection += '<td><button onclick="showItemOption(this)" class="btn btn-primary" data-toggle="modal" data-target="#myModal">옵션/재고 보기</button></td>';
							itemSection += '<td>' + status + '</td>';
							itemSection += '<td>' + numberWithCommas(items[i].itemPrice)
									+ '₩</td>';
							itemSection += '<td>' + numberWithCommas(items[i].itemSalePrice)
									+ '₩</td>';
							itemSection += '<td><button type="button" name="showItem" class="btn btn-light" onclick="showItemInfo('+items[i].itemIdx+')">보 기</button></td>';
							itemSection += "<tr>";
						}
						$("#itemSection").html(itemSection);

						if (startBlock == 0)
							pageArea += '<button type="button" class="btn btn-info" disabled="disabled"><</button>';
						else
							pageArea += '<button type="button" class="btn btn-info"><</button>';

						for (var i = startBlock; i < endBlock; i++) {
							if (i == nowPageNum) {
								pageArea += '<button type="button" disabled="disabled" class="btn btn-success">'
										+ (i + 1) + '</button>';
							} else {
								pageArea += '<button type="button" onclick="getItemList('
										+ i
										+ ')" class="btn btn-info">'
										+ (i + 1) + '</button>';
							}
						}

						if (endBlock == totalBlock)
							pageArea += '<button type="button" class="btn btn-info" disabled="disabled">></button>';
						else
							pageArea += '<button type="button" class="btn btn-info">></button>';

						$("#pageArea").html(pageArea);
					}
				});
	}

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function showItemInfo(idx){
		$("#showItemInfoIdx").val(idx);
		$("#showItemInfo").attr("action","./adminAddItem.do").attr("method","post").submit();
	}
	
	window.onload = function() {
		getItemList(0);
		categoryLoad();
	}
</script>
<body id="page-top">
	<%@include file="./include/mainLogo.html"%>
	<div id="wrapper">
		<!-- Sidebar -->
		<%@include file="./include/sideBar.jsp"%>
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<h5>상품 검색</h5>
				<hr>
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="tdHead">검색 분류</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-12 col-lg-2 mb-3">
										<select class="form-control" id="inputSearchItemType">
											<option selected="" value="itemName">상품명</option>
											<option value="itemCode">상품코드</option>
										</select>
									</div>
									<div class="col-sm-12 col-lg-4">
										<input type="text" id="inputSearchItemTitle"
											class="form-control" id="usr">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tdHead">상품 분류</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-6 col-lg-3" id="categoryArea"></div>
									<div class="col-sm-6 col-lg-3" id="smallCategoryArea">
										<select class="form-control" id="smallCategory">
											<option selected="" value="">소분류</option>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="tdHead">상품 등록일</td>
							<td class="tdBody">
								<div class="row">
									<div class="col-sm-6 col-lg-3">
										<input type="text" class="form-control" id="datepicker1">
									</div>
									~
									<div class="col-sm-6 col-lg-3">
										<input type="text" class="form-control" id="datepicker2">
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-sm-3 col-lg-1 mb-4"></div>
					<div class="col-sm-3 col-lg-2 mb-4"></div>
					<div class="col-sm-3 col-lg-3 mb-4">
						<button id="btnSearchItem" type="button" class="btn btn-secondary">검
							색</button>
						<button id="btnAllItem" type="button" class="btn btn-secondary">전체
							보기</button>
						<button id="btnExcelUpload" type="button"
							class="btn btn-secondary">엑 셀 다운로드</button>
					</div>
				</div>
				<h5 style="margin-top: 100px;">상품 목록 리스트</h5>
				<hr>
				<div class="row">
					<div class="col-sm-3 col-lg-3 mb-4">
						<select class="form-control" id="sortType">
							<option selected="" value="itemDate">정 렬</option>
							<option value="itemDate">등록일 순</option>
							<option value="itemDate DESC">등록일 역순</option>
							<option value="itemPrice">판매 가격순</option>
							<option value="itemSalePrice">할인가 가격순</option>
						</select>
					</div>
					<div class="col-sm-3">
						<select class="form-control" id="showType">
							<option selected="" value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</select>
					</div>
					<div class="col-sm-4">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="itemStatus" value="1"
								checked="checked">판매 중
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="itemStatus" value="0">판매
								중지
							</label>
						</div>
						<button id="btnUpdateStatus" type="button" class="btn btn-success">적
							용</button>
					</div>
				</div>
			</div>
			<br>
			<!-- 주문 현황 차트 -->
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width: 50px;"></th>
							<th style="width: 50px;">번호</th>
							<th style="width: 100px;">상품 코드</th>
							<th style="width: 50px;">이미지</th>
							<th style="width: 100px;">상품명</th>
							<th style="width: 50px;">옵션/재고</th>
							<th style="width: 50px;">상 태</th>
							<th style="width: 50px;">판매가</th>
							<th style="width: 50px;">할인가</th>
							<th style="width: 50px;"></th>
						</tr>
					</thead>
					<tbody id="itemSection">
					</tbody>
				</table>
			</div>
			<div class="col-sm-3">
				<div class="btn-group" id="pageArea"></div>
			</div>

			<%@include file="./include/footer.jsp"%>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@include file="./include/scrollTop.html"%>

	<%@include file="./include/scriptArea.html"%>
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">옵션 및 재고</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" id="itemOption"></div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="itemStockUpdate" type="button" class="btn btn-danger"
						data-dismiss="modal">재고 수정</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">확
						인</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫
						기</button>
				</div>

			</div>
		</div>
	</div>
	<input type="hidden" id="nowPageNum" value="0" />
	<input type="hidden" id="searchItemType" value="" />
	<input type="hidden" id="searchItemTitle" value="" />
	<input type="hidden" id="searchItemSmallCategory" value="" />
	<input type="hidden" id="searchItemBefore" value="" />
	<input type="hidden" id="searchItemAfter" value="" />
	<form id="showItemInfo">
		<input type="hidden" id="showItemInfoIdx" name="showItemInfoIdx" value=""/>
	</form>
</body>
</html>
