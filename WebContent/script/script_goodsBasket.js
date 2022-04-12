/**
 * 
 */


$(function(){
	
	
	/*////////////// 수량 조절 버튼 ///////////////////*/

	// 구매수량 버튼 조절
	$("#cntP").click(function(){
		if(parseInt($(".cntBtn>input").val()) < 99) {
			let cnt = parseInt($(".cntBtn>input").val())+1;
			$(".cntBtn>input").val(cnt);
		}
	});
	
	$("#cntM").click(function(){
		if(parseInt($(".cntBtn>input").val()) > 1) {	
			let cnt = parseInt($(".cntBtn>input").val())-1;
			$(".cntBtn>input").val(cnt);
		}
	});	
	
	
	
	
	
	
	
	
	
	
});

