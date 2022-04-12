/**
 * 
 */

$(function() {
	//---------------------------------------------------------------------------
	//---------------------------login.jsp 시작----------------------------------
	//---------------------------------------------------------------------------

	// 로그인 버튼 클릭
	$(window).keydown(function() {
		let code = event.keyCode;
		if (code == 13) return false;
	});

	$(window).keydown(function() {
		let code = event.keyCode;
		if (code == 13) return $("form#loginFrm").submit();
	});

	$("main#login button#loginBtn").click(function() {
		//공백 제거하기
		let id = $("input#login_idInput").val().trim();
		$("input#login_idInput").val(id);

		let pw = $("input#pwInput").val().trim();
		$("input#pwInput").val(pw);

		if ($("input#login_idInput").val() == "") {
			alert("아이디를 입력해주세요.");
			$("input#id").focus();
			return;
		} else if ($("input#pwInput").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("input#pass").focus();
			return;
		}
		$("form#loginFrm").submit();
	});


	//---------------------------------------------------------------------------
	//---------------------------login.jsp 끝------------------------------------
	//---------------------------------------------------------------------------


	//---------------------------------------------------------------------------
	//---------------------------member.jsp 시작------------------------------
	//---------------------------------------------------------------------------
	// 아이디 입력에 따른 유효성 검사
	$("input#idInput").click(function() {
		$("tr#afterId").css("display", "table-row");
	});

	$("input#idInput").keyup(function() {
		// 공백 제거 값 다시 넣기
		let data = $("input#idInput").val().trim();
		$("input#idInput").val(data);

		let regExp = /[a-z|A-Z|0-9]/g;
		let rExpRes = regExp.test(data);

		if (!rExpRes) {
			alert("영문과 숫자로만 입력해주세요.");
			$("input#idInput").val("");
			$("input#idInput").focus();
			return;
		}

		if (data.length >= 6 && rExpRes) {
			$("tr#afterId td div:nth-child(1)").css("color", "green");
			$("input#idRes").val("true");
		} else {
			$("tr#afterId td div:nth-child(1)").css("color", "red");
			$("input#idRes").val("false");
		}
	});

	/*///////////////////////////////////////////////////////////////*/
	/*////////////////////아이디 중복확인 작성 위치////////////////////*/
	/*///////////////////////////////////////////////////////////////*/
	$("button#idBtn").click(function() {
		// 사용자가 입력한 아이디
		let data = $("input#idInput").val();

		if (data.length < 6) {
			alert("아이디는 6자 이상 입력해주세요.");
			$("input#idInput").val("");
			$("input#idInput").focus();
			return
		}

		// 매개변수로 아이디 값 전달
		let root = "/member/idCheck.jsp?uId=" + data;

		let w = screen.width;
		let popWidth = 400;
		let leftPos = (w - popWidth) / 2;

		let h = screen.height;
		let popHeight = 200;
		let topPos = (h - popHeight) / 2;

		let prop = "width=" + popWidth + ", height=" + popHeight + ", left=" + leftPos + ", top=" + topPos;

		window.open(root, "idChkTorF", prop);

	});

	// 비밀번호 입력에 따른 유효성 검사
	$("input#pwInput").click(function() {
		$("tr#afterPw").css("display", "table-row");
	});

	$("input#pwInput").keyup(function() {
		let data = $("input#pwInput").val();
		let regExpEng = /[a-z|A-Z]/g;
		let regExpNum = /[0-9]/g;
		let regExpEtc = /[ ]/g;
		let regExpSpe = /[!@#$%^&*()_+=`~,./;:?<>"-]/g;

		let rExpResEng = regExpEng.test(data);
		let rExpResNum = regExpNum.test(data);
		let rExpResEtc = regExpEtc.test(data);
		let rExpResSpe = regExpSpe.test(data);

		let resChk1 = false;
		let resChk2 = false;

		if (data.length >= 10) {
			$("tr#afterPw td div:nth-child(1)").css("color", "green");
			resChk1 = true;
		} else {
			$("tr#afterPw td div:nth-child(1)").css("color", "red");
			resChk1 = false;
		}

		if ((rExpResEng == true && rExpResNum == true && rExpResEtc == false)
			|| (rExpResEng == true && rExpResSpe == true && rExpResEtc == false)
			|| (rExpResSpe == true && rExpResNum == true && rExpResEtc == false)) {
			$("tr#afterPw td div:nth-child(2)").css("color", "green");
			resChk2 = true;
		} else {
			$("tr#afterPw td div:nth-child(2)").css("color", "red");
			resChk2 = false;
		}

		if (resChk1 == true && resChk2 == true) {
			$("input#pwRes").val("true");
		} else {
			$("input#pwRes").val("false");
		}

		let pwInput = $("input#pwInput").val();
		let pwChkInput = $("input#pwChkInput").val();

		if (pwChkInput != "" && pwInput == pwChkInput) {
			$("tr#afterPwChk td div:nth-child(1)").css("color", "green");
			$("input#pwChkRes").val("true");
		} else {
			$("tr#afterPwChk  td div:nth-child(1)").css("color", "red");
			$("input#pwChkRes").val("false");
		}
	});


	// 비밀번호 내용 보이게 하기
	$("button.pwBtn").click(function() {
		$("input#pwInput").attr("type", "text");
		$("button.pwBtn i").attr("class", "fa fa-eye");
	});

	$("button.pwChkBtn").click(function() {
		$("input#pwChkInput").attr("type", "text");
		$("button.pwChkBtn i").attr("class", "fa fa-eye");
	});


	// 비밀번호 확인
	$("input#pwChkInput").click(function() {
		$("tr#afterPwChk").css("display", "table-row");
	});

	$("input#pwChkInput").keyup(function() {
		let pwInput = $("input#pwInput").val();
		let pwChkInput = $("input#pwChkInput").val();

		if (pwChkInput != "" && pwInput == pwChkInput) {
			$("tr#afterPwChk td div:nth-child(1)").css("color", "green");
			$("input#pwChkRes").val("true");
		} else {
			$("tr#afterPwChk  td div:nth-child(1)").css("color", "red");
			$("input#pwChkRes").val("false");
		}
	});

	//이름 유효성 검사
	$("input#nameInput").keyup(function() {
		let nameInput = $("input#nameInput").val().trim();
		let regExp = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z|0-9|. -]/g;
		let rExpRes = regExp.test(nameInput);

		if (rExpRes) {
			alert("이름은 한글, 공백, 영어(대소문자), 숫자, 마침표만 입력 가능합니다.");
			$("input#nameInput").val("");
			$("input#nameInput").focus();
			return;
		}

		if (nameInput != "") {
			$("input#nameRes").val("true");
		} else {
			$("input#nameRes").val("false");
		}
	});

	// 이메일 유효성 검사
	$("input#emailInput").keyup(function() {
		let emailInput = $("input#emailInput").val().trim();

		/*///////////////////////////////////////////////////////////////*/
		/*////////////////////이메일 중복확인 작성 위치////////////////////*/
		/*///////////////////////////////////////////////////////////////*/

		if (emailInput != "") {
			$("input#emailRes").val("true");
		} else {
			$("input#emailRes").val("false");
		}
	});

	//휴대폰 유효성 검사
	$("button#phoneBtn").click(function() {
		$("tr#afterPhone").css("display", "table-row");
		let phoneInput = $("input#phoneInput").val().trim();

		let regExp = /[0-9]/g;
		let rExpRes = regExp.test(phoneInput);

		if (rExpRes == true && phoneInput.length == 11) {
			$("input#phoneRes").val("true");
			$("tr#afterPhone td div:nth-child(1)").text("휴대폰 인증이 완료되었습니다.");
			$("tr#afterPhone td div:nth-child(1)").css("color", "green");
		} else if (rExpRes == false) {
			$("input#phoneRes").val("false");
			$("tr#afterPhone td div:nth-child(1)").text("숫자만 입력해주세요.");
			$("tr#afterPhone td div:nth-child(1)").css("color", "red");
		} else if (phoneInput.length != 11) {
			$("input#phoneRes").val("false");
			$("tr#afterPhone td div:nth-child(1)").text("휴대폰 11자리를 올바르게 입력하세요.");
			$("tr#afterPhone td div:nth-child(1)").css("color", "red");
		}
	});

	// 주소 tr 숨기기 보여주기
	$("button.addrBtn").click(function() {
		/*///////////////////////////////////////////////////////////////*/
		/*//////////////주소검색 -> js파일 하단 참조 요망//////////////////*/
		/*///////////////////////////////////////////////////////////////*/

		$("tr.afterAddr").css("display", "table-row");
		$("tr.beforeAddr").css("display", "none");

	});

	/* 이용약관동의 전체 선택 체크시 하위 체크박스 체크하기 */
	$("input#chkAll").click(function() {
		let boolChk = $(this).prop("checked");

		$("tr.oneAgree input").prop("checked", boolChk);
	});


	// 이용약관 동의 역방향 전체 적용
	$("tr.oneAgree input[type=checkbox]").click(function() {
		let chk0 = $("table#agreeTbl tr.oneAgree input").eq(0).prop("checked");
		let chk1 = $("table#agreeTbl tr.oneAgree input").eq(1).prop("checked");
		let chk2 = $("table#agreeTbl tr.oneAgree input").eq(2).prop("checked");
		let chk3 = $("table#agreeTbl tr.oneAgree input").eq(3).prop("checked");
		let chk4 = $("table#agreeTbl tr.oneAgree input").eq(4).prop("checked");

		if (chk0 && chk1 && chk2 && chk3 && chk4) {
			$("input#chkAll").prop("checked", true);
		} else {
			$("input#chkAll").prop("checked", false);
		}
	});

	// 약관 보기 버튼 클릭
	$("button#agreeBtn").click(function() {
		$("div#joinAgreement").css({ "display": "block" });
	});

	//가입하기 버튼 클릭
	$("#btnArea button#memberBtn").click(function() {

		// 주소 1과 2를 input#addr에 value로 넣기
		let addrInput1 = $("input#addrInput1").val();
		let addrInput2 = $("input#addrInput2").val();

		$("input#addr").val(addrInput1 + addrInput2);

		let addrInput = $("input#addr").val();

		if (addrInput != "") {
			$("input#addrRes").val("true");
		} else {
			$("input#addrRes").val("false");
		}
		// year, month, day의 값을 input#birth에 넣기
		let year = $("input.birthInput:nth-child(1)").val();
		let month = $("input.birthInput:nth-child(2)").val();
		let day = $("input.birthInput:nth-child(3)").val();

		$("input#birth").val(year + month + day);


		if ($("input#idRes").val() == "false") {
			alert("아이디를 다시 입력해주세요.");
			$("input#idInput").focus();
			return;
		}

		if ($("input#idChkRes").val() == "false") {
			alert("아이디 중복확인을 해주세요.");
			$("input#idInput").focus();
			return;
		}

		if ($("input#pwRes").val() == "false") {
			alert("비밀번호를 다시 입력해주세요.");
			$("input#pwInput").focus();
			return;
		}

		if ($("input#pwChkRes").val() == "false") {
			alert("비밀번호 확인을 다시 입력해주세요.");
			$("input#pwChkInput").focus();
			return;
		}

		if ($("input#nameRes").val() == "false") {
			alert("이름을 다시 입력해주세요.");
			$("input#nameInput").focus();
			return;
		}

		if ($("input#emailRes").val() == "false") {
			alert("이메일을 다시 입력해주세요.");
			$("input#emailInput").focus();
			return;
		}

		if ($("input#phoneRes").val() == "false") {
			alert("휴대폰 번호를 다시 입력해주세요.");
			$("input#phoneInput").focus();
			return;
		}

		if ($("input#addrRes").val() == "false") {
			alert("주소를 다시 입력해주세요.");
			$("input#addrInput1").focus();
			return;
		}

		let chk0 = $("table#agreeTbl tr.oneAgree input").eq(0).prop("checked");
		let chk1 = $("table#agreeTbl tr.oneAgree input").eq(1).prop("checked");
		let chk4 = $("table#agreeTbl tr.oneAgree input").eq(4).prop("checked");

		if (!chk0 || !chk1 || !chk4) {
			alert("이용약관동의에 체크해주세요.");
			return;
		}

		/*///////////////////////////////////////////////////////////////*/
		/*//////////회원가입 버튼 action, submit 작성위치////////////////*/
		/*///////////////////////////////////////////////////////////////*/
		$("form#memberFrm").submit();

	});

	//---------------------------------------------------------------------------
	//---------------------------member.jsp 끝--------------------------------
	//---------------------------------------------------------------------------

	//---------------------------------------------------------------------------
	//---------------------------joinAgreement.jsp 시작-----------------------
	//---------------------------------------------------------------------------

	// 약관 보기 버튼 클릭
	$("button.button").click(function() {
		$("div#joinAgreement").css({ "display": "none" });
	});
	//---------------------------------------------------------------------------
	//---------------------------joinAgreement.jsp 끝-------------------------
	//---------------------------------------------------------------------------




	//---------------------------------------------------------------------------
	//---------------------------idCheck.jsp 시작-------------------------------
	//---------------------------------------------------------------------------
	$("div#idCheck button").ready(function() {
		let idChk = $("div#idCheck input#idChk").val();
		$("input#idChkTorF", opener.document).val(idChk);

		if (idChk == 1) {
			//사용 가능
			$("tr#afterId td div:nth-child(2)", opener.document).css("color", "green");
			$("input#idChkRes", opener.document).val("true");
		} else if (idChk == 2) {
			//사용 불가능
			$("tr#afterId td div:nth-child(2)", open.document).css("color", "red");
			$("input#idChkRes", opener.document).val("false");
		}
	});

	$("div#idCheck button").click(function() {
		self.close();
	});

});

//---------------------------------------------------------------------------
//---------------------------idCheck.jsp 끝--------------------------------
//---------------------------------------------------------------------------


/*/////////////////////////////////////////////////////////////////////////////////////////*/
/*/////////////////////////////kakao 주소검색 API 사용 시작///////////////////////////////*/
/*/////////////////////////////////////////////////////////////////////////////////////////*/
function findAddr() {
	new daum.Postcode({
		oncomplete: function(data) {

			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var jiBunAddr = data.jibunAddress;
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('addrInput1').value = data.zonecode;
			if (roadAddr !== '') {
				document.getElementById("addrInput1").value = roadAddr;
			} else if (jiBunAddr !== "") {
				document.getElementById("addrInput1").value = jiBunAddr;
			}

		}
	}).open();
}
/*/////////////////////////////////////////////////////////////////////////////////////////*/
/*/////////////////////////////kakao 주소검색 API 사용 끝///////////////////////////////*/
/*/////////////////////////////////////////////////////////////////////////////////////////*/