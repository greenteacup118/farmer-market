/**
 * 
 */

$(function() {
	/* ----------------------- 장바구니 팝업창 시작 ------------------------ */

	// 장바구니 버튼 기능 시작
	$("#basketBtn").click(function() {
		let uSession = $("input#uId").val();
		let basketChk = $("input#basketChk").val();


		if (uSession == "null") {
			alert("로그인이 필요한 서비스입니다. 먼저 로그인해주세요.");
			self.close();
		} else if (basketChk == "true") {
			if(confirm("장바구니에 담으시겠습니까?")) {
				$("#basketFrm").submit();
			}
		} else {
			alert("이미 장바구니에담긴 상품입니다.");
			self.close();
		}
	});

	//취소버튼 클릭
	$("#cancelBtn").click(function() {
		self.close();
	});

	// 금액 기호 표시
	$(".price").each(function(i, v) {
		let price = parseInt($(this).text());
		price = price.toLocaleString() + "원";
		$(this).text(price);
	});


	// 구매수량 버튼 조절
	$("#cntPlus").click(function() {

		if (parseInt($(".cntBtn>input").val()) < 99) {
			let cnt = parseInt($(".cntBtn>input").val()) + 1;
			$(".cntBtn>input").val(cnt);

			let price = parseInt($("div#price").text().replace(/,/g, ''));
			$("div#totalPrice").text((price * cnt).toLocaleString() + "원");
		}
	});

	$("#cntMinus").click(function() {

		if (parseInt($(".cntBtn>input").val()) > 1) {
			let cnt = parseInt($(".cntBtn>input").val()) - 1;
			$(".cntBtn>input").val(cnt);

			let price = parseInt($("div#price").text().replace(/,/g, ''));
			$("div#totalPrice").text((price * cnt).toLocaleString() + "원");
		}
	});



});

/* ----------------------- 장바구니 팝업창 끝 ------------------------ */