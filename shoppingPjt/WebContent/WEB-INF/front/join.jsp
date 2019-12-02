<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./include/head.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var userNameCheck = RegExp(/^[가-힣a-zA-Z]+$/);
	var userIdCheck = RegExp(/^[a-z0-9_-]{5,20}$/);
	var userPwCheck = RegExp(/^[A-Za-z0-9]{8,13}$/);
	var userEmailCheck = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/);
	var isNumCheck = RegExp(/[^0-9]$/);
	var userBirthCheck = RegExp(/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/);

	$(document).ready(function() {

		if ($("#joinReCheck").val() == 1) {
			alert("회원가입 오류입니다.");
		}

		$("#searchAddress").click(function() {
			goPopup();
		});

		$("#inputName").blur(function() {

			if ($("#inputName").val() == "") {
				$("#nameMsg").text("필수 정보입니다.");
			} else if (!userNameCheck.test($("#inputName").val())) {
				$("#nameMsg").text("한글,영문자만 사용 가능합니다.");
			} else {
				$("#nameMsg").text("");
			}
		});

		$("#inputId").blur(function() {

			if ($("#inputId").val() == "") {
				$("#idMsg").text("필수 정보입니다.");
			} else if (!userIdCheck.test($("#inputId").val())) {
				$("#idMsg").text("5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
			} else {
				$.ajax({
					url : "./userIdDupChk.aj",
					data : {
						inputId : $("#inputId").val()
					},
					success : function(re) {
						if (re > 0)
							$("#idMsg").text("이미 사용중인 아이디 입니다.");
						else
							$("#idMsg").text("사용가능한 아이디 입니다.");
					},
					error : function(request, status, error) {
						alert("에러");
					}

				});
			}
		});

		$("#inputPw").blur(function() {
			if ($("#inputPw").val() == "") {
				$("#pwMsg").text("필수 정보입니다.");
			} else if (!userPwCheck.test($("#inputPw").val())) {
				$("#pwMsg").text("8~13자의 영문 소문자, 숫자만 사용 가능합니다.");
			} else {
				$("#pwMsg").text("");
			}
		});

		$("#inputPwChk").blur(function() {
			if ($("#inputPwChk").val() == "") {
				$("#pwChkMsg").text("필수 정보입니다.");
			} else if ($("#inputPw").val() != $("#inputPwChk").val()) {
				$("#pwChkMsg").text("비밀번호가 일치하지 않습니다.");
			} else {
				$("#pwChkMsg").text("");
			}
		});

		$("#inputEmail").blur(function() {
			if ($("#inputEmail").val() == "") {
				$("#emailMsg").text("필수 정보입니다.");
			} else if (!userEmailCheck.test($("#inputEmail").val())) {
				$("#emailMsg").text("이메일 형식으로 입력해주세요.");
			} else {
				$("#emailMsg").text("");
			}
		});

		$("#inputBirth").blur(function() {
			if ($("#inputBirth").val() == "") {
				$("#birthMsg").text("필수 정보입니다.");
			} else if (!userBirthCheck.test($("#inputBirth").val())) {
				$("#birthMsg").text("생년월일을 확인해 주세요.");
			} else {
				$("#birthMsg").text("");
			}
		});

		$("#inputBirth").keyup(function() {
			if (isNumCheck.test($("#inputBirth").val())) {
				$("#inputBirth").val("");
			}
		});

		$("#inputSex").keyup(function() {
			if (isNumCheck.test($("#inputSex").val())) {
				$("#inputSex").val("");
			}
		});

		$("#inputPh2").keyup(function() {
			if (isNumCheck.test($("#inputPh2").val())) {
				$("#inputPh2").val("");
			}
		});

		$("#inputPh3").keyup(function() {
			if (isNumCheck.test($("#inputPh3").val())) {
				$("#inputPh3").val("");
			}
		});

		$("#inputSex").blur(function() {
			if ($("#inputSex").val() == "") {
				$("#sexMsg").text("필수 정보입니다.");
			} else if ($("#inputSex").val() < 1 || $("#inputSex").val() > 4) {
				$("#sexMsg").text("다시 확인해 주세요.");
			} else {
				$("#sexMsg").text("");
			}
		});

		$("#OkJoin").click(function() {
			inputCheck()
		});

	});

	function inputCheck() {
		if (!userNameCheck.test($("#inputName").val())) {
			if ($("#inputName").val() == "")
				$("#nameMsg").text("필수 정보입니다.");
			else
				$("#nameMsg").text("한글,영문자만 사용 가능합니다.");
			$("#inputName").focus();
		} else if (!userIdCheck.test($("#inputId").val())) {
			if ($("#inputId").val() == "")
				$("#idMsg").text("필수 정보입니다.");
			else
				$("#idMsg").text("5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
			$("#inputId").focus();
		} else if (!userPwCheck.test($("#inputPw").val())) {
			if ($("#inputPw").val() == "")
				$("#pwMsg").text("필수 정보입니다.");
			else
				$("#pwMsg").text("8~13자의 영문자, 숫자만 사용 가능합니다.");
			$("#inputPw").focus();
		} else if ($("#inputPw").val() != $("#inputPwChk").val()) {
			$("#pwChkMsg").text("비밀번호가 일치하지 않습니다.");
			$("#inputPwChk").focus();
		} else if (!userEmailCheck.test($("#inputEmail").val())) {
			if ($("#inputEmail").val() == "")
				$("#emailMsg").text("필수 정보입니다.");
			else
				$("#emailMsg").text("이메일 형식으로 입력해주세요.");
			$("#inputEmail").focus();
		} else if ($("#inputPh2").val() == "" || $("#inputPh3").val() == ""
				|| $("#inputPh2").val().length < 3
				|| $("#inputPh3").val().length < 4) {
			$("#phoneMsg").text("전화번호를 확인해 주세요.");
			$("#inputPh2").focus();
		} else if (!userBirthCheck.test($("#inputBirth").val())) {
			if ($("#inputBirth").val() == "")
				$("#birthMsg").text("필수 정보입니다.");
			else
				$("#birthMsg").text("생년월일을 확인해 주세요.");
			$("#inputBirth").focus();
		} else if ($("#inputSex").val() < 1 || $("#inputSex").val() > 4) {
			if ($("#inputSex").val() == "")
				$("#sexMsg").text("필수 정보입니다.");
			else
				$("#sexMsg").text("다시 확인해 주세요.");
			$("#inputSex").focus();
		} else if ($("#inputAddress").val() == ""
				|| $("#detailAddress").val() == "") {
			$("#addressMsg").text("주소를 입력해 주세요");
			$("#detailAddress").focus();
		} else {
			$("#joinForm").attr("action", "joinSubmit.do").attr("method",
					"post").submit();
		}
	}
</script>
<script language="javascript">
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("./userAddress.do", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		$("#inputAddress").val(roadFullAddr);
		$("input[name=searchAddress]").val(roadFullAddr);
	}
</script>
<body>
	<%
		if (request.getQueryString() != null && request.getQueryString().equals("error")) {
	%>
	<script>
		alert("회원가입 오류입니다.");
	</script>
	<%
		}
	%>
	<div class="site-wrap">
		<%@include file="./include/header.jsp"%>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="#">JOIN US</a>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<form id="joinForm">
					<div class="row">
						<div class="col-md-12 mb-12 mb-md-0">
							<h2 class="h3 mb-3 text-black">회원가입</h2>
							<div class="p-3 p-lg-5 border">

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_fname" class="text-black">이름 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="inputName" name="inputName">
										<div id="nameMsg"></div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_fname" class="text-black">아이디 <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="inputId" name="inputId">
										<div id="idMsg"></div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_fname" class="text-black">비밀번호 <span
											class="text-danger">*</span></label> <input type="password"
											class="form-control" id="inputPw" name="inputPw">
										<div id="pwMsg"></div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_fname" class="text-black">비밀번호 확인 <span
											class="text-danger">*</span></label> <input type="password"
											class="form-control" id="inputPwChk" name="inputPwChk">
										<div id="pwChkMsg"></div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_companyname" class="text-black">이메일 <span
											class="text-danger">*</span>
										</label> <input type="email" class="form-control" id="inputEmail"
											name="inputEmail" placeholder="abcd1234@email.com">
										<div id="emailMsg"></div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-4">
										<label for="c_companyname" class="text-black">전화번호<span
											class="text-danger">*</span></label> <select id="inputPh1"
											name="inputPh1" class="form-control">
											<option value="010">010</option>
											<option value="070">070</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>

									</div>
									<div class="col-md-4">
										<label for="c_fname" class="text-black">&nbsp;</label> <input
											type="text" class="form-control" id="inputPh2"
											name="inputPh2" maxlength="4">
									</div>
									<div class="col-md-4">
										<label for="c_fname" class="text-black">&nbsp;</label> <input
											type="text" class="form-control" id="inputPh3"
											name="inputPh3" maxlength="4">
									</div>
									<div class="col-md-12" id="phoneMsg"></div>
								</div>



								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_companyname" class="text-black">생년월일 <span
											class="text-danger">*</span>
										</label>
										<div class="row">
											<div class="col-md-4">
												<input type="text" class="form-control" id="inputBirth"
													name="inputBirth" placeholder="주민번호 앞6자리" maxlength="6">
											</div>
											<h2>
												<strong>-</strong>
											</h2>
											<div class="col-md-1">
												<input type="text" class="form-control" id="inputSex"
													name="inputSex" maxlength="1">
												<!--숫자한자리-->
											</div>
											<h2>
												<strong>●●●●●●</strong>
											</h2>

										</div>
										<div class="row">
											<div class="col-md-4" id="birthMsg"></div>
											<div class="col-md-8" id="sexMsg"></div>
										</div>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-12">
										<label for="c_address" class="text-black">주소 <span
											class="text-danger">*</span></label>
										<div class="row">
											<div class="col-md-2">
												<input type="button"
													class="btn btn-primary btn-lg btn-block" id="searchAddress"
													value="주소찾기" />
											</div>
											<div class="col-md-10">
												<input type="text" class="form-control" id="inputAddress" placeholder="주 소" disabled="disabled"/>
												<input type="hidden" name="searchAddress">
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<input type="text" class="form-control" id="detailAddress"
										name="inputAddress" placeholder="상세주소">
								</div>
								<div id="addressMsg" class="col-md-12"></div>
								<br> <input type="button"
									class="btn btn-primary btn-lg btn-block" id="OkJoin"
									value="회원가입" />

							</div>
						</div>

					</div>
				</form>
			</div>
		</div>

		<%@include file="./include/footer.jsp"%>
	</div>

	<%@include file="./include/scriptArea.html"%>

</body>
</html>