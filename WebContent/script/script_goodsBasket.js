/**
 * 
 */


$(function(){
	
	
	
	
	//상품이미지 클릭시 페이지 이동
	
	
	
	/*////////////// 수량 조절 버튼 ///////////////////*/

	// 구매수량 버튼 조절
	$(".cntP").click(function(){
		if(parseInt($(this).prev().val()) < 99) {
			let cnt = parseInt($(this).prev().val())+1;
			$(this).prev().val(cnt);
		}
	});
	
	$(".cntM").click(function(){
		if(parseInt($(this).next().val()) > 0) {	
			let cnt = parseInt($(this).next().val())-1;
			$(this).next().val(cnt);
		} else {
			let cnt = 0;
			$(this).next().val(cnt);
		}
	});	
	
	
	// 상품 총합 가격 계산(수량 추가 버튼 클릭시)
	$(".cntP").click(function(){
		let eventP = $(this).parent().parent().parent().parent().parent().next().val();
		//alert(eventP);
		let Cnt = parseInt($(this).prev().val());
		let Price = "";
		let tPrice = "";
		if(eventP > 0) {
			Price = parseInt($(this).parent().parent().next().children().next().next().val());
			tPrice = Cnt*Price;
			let etPrice = eventP/100;
			etPrice = tPrice-(tPrice*etPrice);
			tPrice = tPrice.toLocaleString() + " 원";
			etPrice = etPrice.toLocaleString() + " 원";
			$(this).parent().parent().next().children().first().text(tPrice);
			$(this).parent().parent().next().children().next().text(etPrice);
		} else {
			Price = parseInt($(this).parent().parent().next().children().next().val());
			tPrice = Cnt*Price;
			tPrice = tPrice.toLocaleString() + " 원";
			$(this).parent().parent().next().children().first().text(tPrice);
		}




		let la1 = "";
		// 상품금액 계산
		if(Cnt <=99) {	
			let pr = $("#toPrice").text();
			let totalPrice = ""; 
			for(let x of pr) {	// 숫자일경우 totalPrice에 x값 추가
				if(!isNaN(x)) totalPrice += x;
			}
			//alert(totalPrice);
			totalPrice = parseInt(totalPrice);
			totalPrice += Price;
			la1 = totalPrice;
			totalPrice = totalPrice.toLocaleString() + " 원";
			$("#toPrice").text(totalPrice);
		}
		
		
		
		
		// 상품할인금액 계산
		let eventRate = $(this).parent().parent().parent().parent().parent().next().val();
		if(isNaN(eventRate)) eventRate = 0;		
		//alert(eventRate);
		let eventPrice = Price*(eventRate/100);
		//alert(eventPrice);
		let ep = $("#ePrice").text();
		let ePrice = ""; 
			for(let y of ep) {	
				if(!isNaN(y)) ePrice += y;
			}
		ePrice = parseInt(ePrice);
		ePrice += eventPrice;
		let la2 = ePrice;
		ePrice = ePrice.toLocaleString() + " 원";
		$("#ePrice").text(ePrice);
		//alert(ePrice);
		
		
		
				
		// 결제예정금액 계산
		let deliPrice = 3000;
		let lp = $("#lastPrice").text();
		let lastPrice = ""; 
		for(let z of lp) {	
				if(!isNaN(z)) lastPrice += z;
			}		
		lastPrice = parseInt(lastPrice);
		lastPrice = la1 + la2 + deliPrice;
		//alert(lastPrice);
		deliPrice = deliPrice.toLocaleString() + " 원";
		$("#deliPrice").text(deliPrice);
		lastPrice = lastPrice.toLocaleString() + " 원";
		$("#lastPrice").text(lastPrice);
		
		
		
		
		// 최대 수량 도달시 버튼 비활성화
		if (Cnt>0)	{				
			$(this).prev().prev().prop("disabled", false);
		} else {
			$(this).prop("disabled", true); 		
		}
		
		if (Cnt==99) {$(this).prop("disabled", true);}
	});
	
	
	
	
	// 상품 총합 가격 계산(수량 감소 버튼 클릭시)	
	$(".cntM").click(function(){
		let eventP = $(this).parent().parent().parent().parent().parent().next().val();
		//alert(eventP);
		let Cnt = parseInt($(this).next().val());
		let Price = "";
		let tPrice = "";
		if(eventP > 0) {
			Price = parseInt($(this).parent().parent().next().children().next().next().val());
			tPrice = Cnt*Price;
			let etPrice = eventP/100;
			etPrice = tPrice-(tPrice*etPrice);
			tPrice = tPrice.toLocaleString() + " 원";
			etPrice = etPrice.toLocaleString() + " 원";
			$(this).parent().parent().next().children().first().text(tPrice);
			$(this).parent().parent().next().children().next().text(etPrice);
		} else {
			Price = parseInt($(this).parent().parent().next().children().next().val());
			tPrice = Cnt*Price;
			tPrice = tPrice.toLocaleString() + " 원";
			$(this).parent().parent().next().children().first().text(tPrice);
		}
		
		
		
		let la1 = "";
		// 상품금액 계산
		if(Cnt >=0) {	
			let pr = $("#toPrice").text();
			let totalPrice = ""; 
			for(let x of pr) {	// 숫자일경우 totalPrice에 x값 추가
				if(!isNaN(x)) totalPrice += x;
			}
			//alert(totalPrice);
			totalPrice = parseInt(totalPrice);
			totalPrice -= Price;
			la1 = totalPrice;
			totalPrice = totalPrice.toLocaleString() + " 원";
			$("#toPrice").text(totalPrice);
		}
		
		
		
		
		// 상품할인금액 계산
		let eventRate = $(this).parent().parent().parent().parent().parent().next().val();
		if(isNaN(eventRate)) eventRate = 0;		
		//alert(eventRate);
		let eventPrice = Price*(eventRate/100);
		//alert(eventPrice);
		let ep = $("#ePrice").text();
		let ePrice = ""; 
			for(let y of ep) {	
				if(!isNaN(y)) ePrice += y;
			}
		ePrice = parseInt(ePrice);
		ePrice -= eventPrice;
		let la2 = ePrice;
		ePrice = ePrice.toLocaleString() + " 원";
		$("#ePrice").text(ePrice);
		//alert(ePrice);		
		
		
		
		
		// 결제예정금액 계산
		let deliPrice = 0;
		let lp = $("#lastPrice").text();
		let lastPrice = ""; 
		for(let z of lp) {	
				if(!isNaN(z)) lastPrice += z;
			}		
		lastPrice = parseInt(lastPrice);
		lastPrice = la1 + la2;
		//alert(lastPrice);		
		if(lastPrice==0) {
			deliPrice= 0;
			deliPrice = deliPrice.toLocaleString() + " 원";
			$("#deliPrice").text(deliPrice);
		} else {
			deliPrice = 3000;
			lastPrice += deliPrice;
			deliPrice = deliPrice.toLocaleString() + " 원";
			$("#deliPrice").text(deliPrice);
		};
		lastPrice = lastPrice.toLocaleString() + " 원";
		$("#lastPrice").text(lastPrice);
		
		
		
		
		// 최대 수량 도달시 버튼 비활성화
		if (Cnt<99)	{				
			$(this).next().next().prop("disabled", false);
		} else {
			$(this).prop("disabled", true); 		
		}
		if (Cnt==0)	{
			$(this).prop("disabled", true);
			$(this).parent().parent().next().children().first().css({
				"text-decoration":"none",
				"color":"#000"
				});
			$(this).parent().parent().next().children().next().css("display","none");
		} 						
	});
	
	
	
	
	// 금액 기호 표시
	$(".price").each(function(i, v) { 
		let price = parseInt($(this).text());
		price = price.toLocaleString() +" 원";
		$(this).text(price);
	});
	
	
	
	
	// 사진 제목 클릭시 상품페이지 이동
	$(".gImg").click(function(){
		let goodsCode = $(this).children().next().val();
		//alert(goodsCode);
		location.href="/goods/goods_detail.jsp?goodsCode="+goodsCode;
	});
	
	$(".gName").click(function(){
		let goodsCode = $(this).prev().children().next().val();
		//alert(goodsCode);
		location.href="/goods/goods_detail.jsp?goodsCode="+goodsCode;
	});
	
	
	
	
	
	
	
	
	
	
	
	
	// 장바구니 전체선택 버튼
	
	$("#chkAll1").click(function(){
		let boolChk = $(this).prop("checked");
		
		$(".basketChk input").prop("checked", boolChk);
		$("#chkAll2").prop("checked", boolChk);
	});
	
	
	$("#chkAll2").click(function(){
		let boolChk = $(this).prop("checked");
		
		$(".basketChk input").prop("checked", boolChk);
		$("#chkAll1").prop("checked", boolChk);
	});
	
	// 장바구니 전체선택 역방향 전체 적용
	$(".basketChk input[type=checkbox]").click(function(){
		let chk = $(this).prop("checked");
		
		if (chk) {
			$("input.chkAll").prop("checked", true);
		} else {
			$("input.chkAll").prop("checked", false);
		}
	});

	
	// 주문하기 버튼 선택시 실행
	$("#basket_purchase").click(function(){
		alert("주문이 완료되었습니다.");
		$("#basketFrm").submit();
	});
	
	
	// 선택삭제 버튼 선택시 실행
	$(".selClickBtn").click(function(){
		//alert("OK!");
		
		let chk = confirm("선택하신 물품을 삭제하시겠습니까?")
		
		if(chk) {
			$("#basketFrm").attr("action","/goods/goods_basketDelete.jsp");
			$("#basketFrm").submit();			
		}
		
	});
	

	
	
	
	
});

