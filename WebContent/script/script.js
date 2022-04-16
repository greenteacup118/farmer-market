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

		location.href = "/mainPage/updateBasketProc.jsp?goodsCode=" + goodsCode;

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
	
});

/* ----------------------- 상품 리스트 끝 ------------------------ */

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*//////////////////////////////////////////// index.jsp 끝 ///////////////////////////////////////////////*/
/*///////////////////////////////////////////////////////////////////////////////////////////////////////////*/