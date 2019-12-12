<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.html"%>
<script type="text/javascript">
	const ctx = window.location.pathname.substring(0, window.location.pathname
			.indexOf("/", 2));
	var smallCategory;
	var checkShowImg = -1;
	$(function() {
		$("#btnChangeMainImg").click(
				function() {
					alert("메인이미지 변경 완료");
					$("#changeImgForm").attr("action",
							"./adminItemMainImgUpdate.admin").submit();
				});

		$("#inputChangeMainImg").change(function() {
			readURL(this, 'changeMainImg');
		});

		$("#showStatus").change(function() {
			$("#searchItemStatus").val($(this).val());
			getItemList(0);
		});

		$("#selectShowImg").change(function() {
			if ($(this).val() === 'false')
				$(".showImg").attr("class", "hideImg");
			else
				$(".hideImg").attr("class", "showImg");
			checkShowImg *= -1;
		});

		$("#btnAllChkTrue").click(function() {
			$("input[name=excelData]").prop("checked", true);
		});

		$("#btnAllChkFalse").click(function() {
			$("input[name=excelData]").prop("checked", false);
		});

		$("#btnUpdateStatus").click(function() {
			var chkIdx = "";
			$("input[name=itemIdx]:checked").each(function() {
				chkIdx += $(this).val() + ",";
			});
			if (chkIdx === '') {
				alert("판매 상태를 변경할 항목을 체크해주세요.");
				return;
			}
			$.ajax({
				url : "./UpdateItemStatus.ajax",
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

		$("#btnExcelUpload").click(
				function() {
					var chk = "";
					var chkText = "";
					$("input[name=excelData]:checked").each(function() {
						chk += $(this).val() + ",";
						chkText += $(this).next().text().trim() + ",";
					})
					if (chk == '')
						alert("문서화할 항목을 선택해주세요.");
					else
						location.href = "./adminExcelUpload.admin?query=" + chk
								+ "&header=" + chkText;
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
				url : "./UpdateStock.ajax",
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

	function mainImgUpdate(button) {
		$(button).parents("td").prev().prev().text();
		var imgPath = $(button).prev().prev().attr("src");
		var originImg = imgPath.toString().lastIndexOf("/") + ".jpg";
		$("#beforeMainImg").attr("src", imgPath);
		$("#inputChangeMainImgIdx").val(
				$(button).parents("td").prev().prev().text());
		$("#originMainImg").val(originImg);
	}

	function showItemOption(button) {
		$
				.ajax({
					url : "./SelectItemOption.ajax",
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

	function getItemList(pageNum) {
		$("#nowPageNum").val(pageNum);
		$
				.ajax({
					url : "./SelectItem.ajax",
					data : {
						pageNum : pageNum,
						showType : $("#showType").val(),
						sortType : $("#sortType").val(),
						searchItemType : $("#searchItemType").val(),
						searchItemTitle : $("#searchItemTitle").val(),
						searchItemSmallCategory : $("#searchItemSmallCategory")
								.val(),
						searchItemBefore : $("#searchItemBefore").val(),
						searchItemAfter : $("#searchItemAfter").val(),
						searchItemStatus : $("#searchItemStatus").val()
					},
					dataType : "json",
					success : function(data) {
						var items = data.result;
						if (items.length == 0) {
							var itemSection = "<tr><td class='text-success' colspan='10'><strong>* 상품이 존재하지 않습니다.</strong></td></tr>";
							$("#itemSection").html(itemSection);
						} else {
							var startBlock = parseInt(data.startBlock);
							var endBlock = parseInt(data.endBlock);
							var totalBlock = parseInt(data.totalBlock);
							var nowPageNum = parseInt($("#nowPageNum").val());
							var itemSection = "";
							var pageArea = "";
							var showImgClass = "showImg";
							if (checkShowImg == -1)
								showImgClass = "hideImg";

							for (var i = 0; i < items.length; i++) {
								var status = items[i].itemStatus == 1 ? "<label class='btn btn-primary btn-sm'>판매중</label>"
										: items[i].itemStatus == -1 ? "<label class='btn btn-danger btn-sm'>삭제 보류</label>"
												: "<label class='btn btn-warning btn-sm'>판매 중지</label>";
								itemSection += "<tr>";
								itemSection += '<td><input type="checkBox" name="itemIdx" value="'+items[i].itemIdx+'" style="width:25px;height:25px;"/></td>';
								itemSection += '<td>' + items[i].itemIdx
										+ '</td>';
								itemSection += '<td>' + items[i].itemCode
										+ '</td>';
								itemSection += '<td class="'+showImgClass+'"><img src="'+ctx+'/uploadImage/'+items[i].itemMainImg+'" style="width: 100px; height: 100px;"><br><button class="btn btn-info" onclick="mainImgUpdate(this)" data-toggle="modal" data-target="#updateModal">이미지 변경</button></td>';
								itemSection += '<td><strong>'
										+ items[i].itemName + '</strong></td>';
								itemSection += '<td><button onclick="showItemOption(this)" class="btn btn-outline-success" data-toggle="modal" data-target="#myModal">옵션/재고 보기</button></td>';
								itemSection += '<td>' + status + '</td>';
								itemSection += '<td><strong>'
										+ numberWithCommas(items[i].itemPrice)
										+ '₩</strong></td>';
								itemSection += '<td><strong>'
										+ numberWithCommas(items[i].itemSalePrice)
										+ '₩</strong></td>';
								itemSection += '<td><button type="button" name="showItem" class="btn btn-secondary" onclick="showItemInfo('
										+ items[i].itemIdx
										+ ')">보 기</button></td>';
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
					}
				});
	}

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function showItemInfo(idx) {
		$("#showItemInfoIdx").val(idx);
		$("#showItemInfo").attr("action", "./adminAddItem.admin").attr("method",
				"post").submit();
	}

	// 이미지 미리보기
	function readURL(input, area) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById(area).src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		}
	}

	window.onload = function() {
		getItemList(0);
		categoryLoad();
	}
</script>
<style>
.showImg {
	
}

.hideImg {
	display: none;
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
				<hr>
				<strong>상품 검색</strong>
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
										<input type="text" class="form-control" readonly="readonly" id="datepicker1">
									</div>
									~
									<div class="col-sm-6 col-lg-3">
										<input type="text" class="form-control" readonly="readonly" id="datepicker2">
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
					</div>
				</div>
				<hr>
				<button id="btnExcelUpload" type="button"
					class="btn btn-secondary ml-4 mr-5">엑 셀 다운로드</button>
				<div class="btn-group-vertical mr-5">
					<button id="btnAllChkTrue" type="button"
						class="btn btn-outline-dark">전체 선택</button>
					<button id="btnAllChkFalse" type="button"
						class="btn btn-outline-dark">전체 해제</button>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemIdx" name="excelData"><span>고유번호</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemCode" name="excelData"><span>상품코드</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemName" name="excelData"><span>상품명</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemOption" name="excelData"><span>옵션
							및 재고</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemStatus" name="excelData"><span>상태</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemPrice" name="excelData"><span>판매가</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemSalePrice" name="excelData"><span>할인가</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemManufacturer" name="excelData"><span>제조사</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemOrigin" name="excelData"><span>원산지</span>
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input" value="itemDate" name="excelData"><span>등록일</span>
					</label>
				</div>
				<hr>
				<h5 style="margin-top: 100px;">상품 목록 리스트</h5>
				<hr>
				<div class="row">
					<div class="col-lg-2 mb-4">
						<select class="form-control" id="sortType">
							<option selected="" value="itemDate">정 렬</option>
							<option value="itemDate">등록일 순</option>
							<option value="itemDate DESC">등록일 역순</option>
							<option value="itemPrice">판매 가격순</option>
							<option value="itemSalePrice">할인가 가격순</option>
						</select>
					</div>
					<div class="col-lg-2 mb-4">
						<select class="form-control" id="showType">
							<option selected="" value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</select>
					</div>
					<div class="col-lg-2 mb-4">
						<select class="form-control" id="showStatus">
							<option selected value="-1">전체 보기</option>
							<option value="1">판매 중 보기</option>
							<option value="0">판매 중지 보기</option>
						</select>
					</div>
					<div class="col-lg-2 mb-4">
						<select class="form-control" id="selectShowImg">
							<option selected="" value="false">이미지 숨기기</option>
							<option value="true">이미지 보기</option>
						</select>
					</div>
					<div class="col-lg-4 mb-4">
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
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width: 50px;"></th>
							<th style="width: 50px;">번호</th>
							<th style="width: 100px;">상품 코드</th>
							<th style="width: 50px;" class="hideImg">이미지</th>
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
			<div class="row mt-2">
				<div class="col-lg-5"></div>
				<div class="col-lg-3 mb-5">
					<div class="btn-group" id="pageArea"></div>
				</div>
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
	<!-- The Modal -->
	<div class="modal fade" id="updateModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">메인 이미지 변경</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6">
							<span class="text-danger">* 변경 전 이미지</span> <img src=""
								id="beforeMainImg" style="width: 200px; height: 200px;" />
						</div>
						<div class="col-lg-6">
							<form id="changeImgForm" method="post"
								enctype="multipart/form-data">
								<div class="input-group mb-3">
									<input id="inputChangeMainImg" name="inputChangeMainImg"
										type="file" class="form-control">
								</div>
								<input type="hidden" id="inputChangeMainImgIdx"
									name="inputChangeMainImgIdx" value="" /> <input type="hidden"
									id="originMainImg" name="originMainImg" value="" />
							</form>
							* 변경 후 이미지 <img
								src="${pageContext.request.contextPath}/uploadImage/img.png"
								id="changeMainImg" style="width: 200px; height: 150px;">
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="btnChangeMainImg" type="button" class="btn btn-danger"
						data-dismiss="modal">변 경</button>
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
	<input type="hidden" id="searchItemStatus" value="-1" />
	<form id="showItemInfo">
		<input type="hidden" id="showItemInfoIdx" name="showItemInfoIdx"
			value="" />
	</form>
</body>
</html>
