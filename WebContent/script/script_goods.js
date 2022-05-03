/**
 * 
 */

$(function() {


	$(".goodsList").click(function() {

		let goodsCode = $(this).next().val();
		//alert(goodsCode);

		location.href = "/goods/goods_detail.jsp?goodsCode=" + goodsCode;
		//$("#codeFrm").submit();
	});


	// 금액 기호 표시
	$(".price").each(function(i, v) {
		let price = parseInt($(this).text());
		price = price.toLocaleString() + " 원";
		$(this).text(price);
	});



	// 금액 기호 표시
	$("span.orgPr").each(function(i, v) {
		let price = parseInt($(this).text());
		price = price.toLocaleString() + " 원";
		$(this).text(price);
	});
});

