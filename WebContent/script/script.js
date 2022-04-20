/*
* 
*/


/*///////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*///////////////////////////////////// index.jsp 시작 //////////////////////////////////////////////////////*/
/*///////////////////////////////////////////////////////////////////////////////////////////////////////////*/

/* ----------------------- 메인슬라이드 시작 ----------------------- */
let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
	showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
	showSlides(slideIndex = n);
}

function showSlides(n) {
	let i;
	let slides = document.getElementsByClassName("mySlides");
	let dots = document.getElementsByClassName("dot");
	if (n > slides.length) { slideIndex = 1 }
	if (n < 1) { slideIndex = slides.length }
	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" active", "");
	}
	slides[slideIndex - 1].style.display = "block";
	dots[slideIndex - 1].className += " active";
}
/* ----------------------- 메인슬라이드 끝 ----------------------- */

/* ----------------------- 상품 리스트 시작 ----------------------- */
$(function() {

	// 상품리스트의 장바구니 버튼 클릭
	$("div.goodsBtn").click(function() {
		//표현식을 통해 입력받은 상품코드
		let goodsCode = $(this).next().children().val();

		// 매개변수로 아이디 값 전달
		let root = "/mainPage/basketPopUp.jsp?goodsCode=" + goodsCode;

		let w = screen.width;
		let popWidth = 600;
		let leftPos = (w - popWidth) / 2;

		let h = screen.height;
		let popHeight = 300;
		let topPos = (h - popHeight) / 2;

		let prop = "width=" + popWidth + ", height=" + popHeight + ", left=" + leftPos + ", top=" + topPos;

		window.open(root, "basketPopUp", prop);
	});

	// 이미지 클릭 시
	$("div.goodsImg").click(function() {
		//표현식을 통해 입력받은 상품코드
		let goodsCode = $(this).next().next().children().val();

		location.href = "/mainPage/toGoodsDetailProc.jsp?goodsCode=" + goodsCode;
	});

	// 천단위 기호 붙여주기 - span.price
	$("div.goodsPrice span.price").each(function(i, v) {
		let price = parseInt($(this).text());
		price = price.toLocaleString();
		$(this).text(price);
	});

	// 천단위 기호 붙여주기 - span.beforePrice
	$("div.beforePrice").each(function(i, v) {
		let price = parseInt($(this).text());
		price = price.toLocaleString();
		$(this).text(price);
	});



	/* ----------------------- 상품 리스트 끝 ------------------------ */
	/* ----------------------- 장바구니 팝업창 시작 ------------------------ */

	// 장바구니 버튼 기능 시작
	$("#basketBtn").click(function() {
		let uSession = $("input#uId").val();
		let basketChk = $("input#basketChk").val();

		if (uSession == "null") {
			alert("로그인이 필요한 서비스입니다.");
			self.close();
		} else if (basketChk == "true") {
			$("#basketFrm").submit();
		} else {
			alert("이미 장바구니에담긴 상품입니다.");
			self.close();
		}
	});


	// 금액 기호 표시
	$(".price").each(function(i, v) {
		let price = parseInt($("td#totalPrice input").val().replace(/,/g, ''));
		price = price.toLocaleString() + "원";
		$(this).text(price);
	});
	
	$(".cntBtn button").click(function(){
		alert("11");
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
	
		alert("11");
	
		if (parseInt($(".cntBtn>input").val()) > 1) {
			let cnt = parseInt($(".cntBtn>input").val()) - 1;
			$(".cntBtn>input").val(cnt);

			let price = parseInt($("div#price").text().replace(/,/g, ''));
			$("div#totalPrice").text((price * cnt).toLocaleString() + "원");
		}
	});



});
/* ----------------------- 장바구니 팝업창 끝 ------------------------ */



/*///////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*//////////////////////////////////////////// index.jsp 끝 ///////////////////////////////////////////////*/
/*///////////////////////////////////////////////////////////////////////////////////////////////////////////*/