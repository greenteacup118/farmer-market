/**
 * 
 */

$(function() {

	//---------------------------------------------------------------------------
	//---------------------------myPageRead.jsp 시작--------------------------
	//---------------------------------------------------------------------------

	// 상품후기 게시판에서 게시물 클릭했을 때
	$("tr#bbsCmtTr").click(function() {
		let no = $(this).children().children().val();
		let type = $(this).children().children().next().val();
		let write = $(this).children().children().next().next().val();

		let url = "/myPage/myPageRead.jsp?no=" + no + "&type=" + type + "&write=" + write;
		location.href = url;
	});

	// 상품문의 게시판에서 게시물 클릭했을 때
	$("tr#bbsQnaTr").click(function() {
		let no = $(this).children().children().val();
		let type = $(this).children().children().next().val();
		let write = $(this).children().children().next().next().val();

		let url = "/myPage/myPageRead.jsp?no=" + no + "&type=" + type + "&write=" + write;
		location.href = url;
	});

	// 이전글 이동하기 클릭
	$("tr#beforeRead").click(function() {
		let no = $(this).children().next().children().next().val();
		let type = $(this).children().next().children().next().next().val();
		let write = $(this).children().next().children().next().next().next().val();

		let url = "/myPage/myPageRead.jsp?no=" + no + "&type=" + type + "&write=" + write;
		location.href = url;
	});

	// 다음글 이동하기 클릭
	$("tr#afterRead").click(function() {
		let no = $(this).children().next().children().next().val();
		let type = $(this).children().next().children().next().next().val();
		let write = $(this).children().next().children().next().next().next().val();

		let url = "/myPage/myPageRead.jsp?no=" + no + "&type=" + type + "&write=" + write;
		location.href = url;
	});

	//목록 버튼 클릭시
	$("button#toListBtn").click(function() {
		let type = $("div#title input#type").val();

		if (type == "c") {
			location.href = "/myPage/goodsComments.jsp";
		} else if (type == "q") {
			location.href = "/myPage/goodsQnA.jsp";
		}
	});

	//삭제 버튼 클릭시
	$("button#deleteBtn").click(function() {
		let chk = "작성하신 글을 삭제하시겠습니까?";

		if (confirm(chk)) {
			let type = $("div#title input#type").val();
			let no = $("div#title input#no").val();

			let url = "/myPage/deleteReadProc.jsp?no=" + no + "&type=" + type;
			location.href = url;
		}
	});

	//수정 버튼 클릭시
	$("button#updateBtn").click(function() {
		let type = $("div#title input#type").val();
		let no = $("div#title input#no").val();

		let url = "/myPage/myPageRead.jsp?no=" + no + "&type=" + type + "&write=y";
		location.href = url;
	});


	//등록 버튼 클릭시
	$("button#writeBtn").click(function() {
		let type = $("div#title input#type").val();
		let no = $("div#title input#no").val();
		
		let url = "/myPage/updateReadProc.jsp?no=" + no + "&type=" + type;
		$("form#goodsBbsFrm").attr("action", url);	
		$("form#goodsBbsFrm").submit();
	});
	//---------------------------------------------------------------------------
	//---------------------------myPageRead.jsp 끝--------------------------
	//---------------------------------------------------------------------------


	//---------------------------------------------------------------------------
	//---------------------------wishList.jsp 시작-------------------------------
	//---------------------------------------------------------------------------
	//삭제하기 버튼 클릭시
	$("#deleteWishBtn").click(function() {

		let goodsCode = $("input#goodsCode").val();

		let url = "/myPage/wishListDeleteProc.jsp?goodsCode=" + goodsCode;

		$("#deleteWishFrm").attr("action", url);
		$("#deleteWishFrm").submit();
	});

	//장바구니 담기 버튼 클릭시
	$("#sendBasketBtn").click(function() {
		let goodsCode = $("input#goodsCode").val();

		let url = "/myPage/wishToBasketProc.jsp?goodsCode=" + goodsCode;
		location.href = url;
	});

	//금액 표시하기
	$(".price").each(function(i, v) {
		let price = parseInt($(this).text().replace(/,/g, ''));
		price = price.toLocaleString() + "원";
		$(this).text(price);
	});
	//---------------------------------------------------------------------------
	//---------------------------wishList.jsp 끝-------------------------------
	//---------------------------------------------------------------------------

	//---------------------------------------------------------------------------
	//---------------------------update_info.jsp 시작--------------------------
	//---------------------------------------------------------------------------

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


	});


	// 주소 tr 숨기기 보여주기
	$("button.addrBtn").click(function() {
		/*///////////////////////////////////////////////////////////////*/
		/*//////////////주소검색 -> js파일 하단 참조 요망//////////////////*/
		/*///////////////////////////////////////////////////////////////*/

		$("tr.afterAddr").css("display", "table-row");
		$("tr.beforeAddr").css("display", "none");

	});

	// 회원정보 수정 버튼 클릭 시
	$("button#updateBtn").click(function() {
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
		let month = $("input.birthInput:nth-child(3)").val();
		let day = $("input.birthInput:nth-child(5)").val();

		$("input#birth").val(year + month + day);




		$("form#updateFrm").submit();
	});
	//---------------------------------------------------------------------------
	//---------------------------update_info.jsp 끝----------------------------
	//---------------------------------------------------------------------------

	// 회원탈퇴 버튼 클릭 시
	$("button#memQuitBtn").click(function() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			$("#memQuitFrm").submit();
		}
	});

	//---------------------------------------------------------------------------
	//---------------------------orderList.jsp 시작----------------------------
	//---------------------------------------------------------------------------
	$("select#yearSelect").change(function() {
		let value = $("select#yearSelect option:selected").val();
		location.href = "/myPage/orderList.jsp?where=" + value;
	});


	//---------------------------------------------------------------------------
	//---------------------------orderList.jsp 끝----------------------------
	//---------------------------------------------------------------------------



	//---------------------------------------------------------------------------
	//---------------------------addrUpdate.jsp 시작----------------------------
	//---------------------------------------------------------------------------

	//새배송지 추가 등록버튼 클릭
	$("form#addrFrm #addrInsBtn").click(function() {
		if ($("#addrFrm input#addrInput1").val() == "") {
			alert("검색버튼을 눌러 주소를 검색해주세요.");
			return;
		}

		if ($("#addrFrm input#addrInput2").val() == "") {
			alert("세부 주소를 입력해주세요.");
			return;
		}

		$("form#addrFrm").submit();
	});

	// action="modifyAddrProc"

	//삭제하기 버튼 클릭시
	$("#addrListFrm #deleteBtn").click(function() {
		$("#addrListFrm").attr("action", "/myPage/deleteAddrProc.jsp?proc=D");
		$("#addrListFrm").submit();
	});

	$(".addrTr input[type=checkbox]").click(function() {
		let check = $(this).parent().next().next().next().html();
		if (check != "") {
			alert("기본 주소지입니다. 기본 주소지는 개인 정보 수정에서 수정해주세요.")
			$(this).prop("checked", false);
		}
	});

	//---------------------------------------------------------------------------
	//---------------------------addrUpdate.jsp 끝----------------------------
	//---------------------------------------------------------------------------


});


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