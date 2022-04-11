/**
 * 
 */

$(function(){
	
	// 새로고침시 가장 위로 이동
	window.onbeforeunload = function() {
		window.scrollTo(0, 0);
	}
	
		// 퀵메뉴 선택시 이동 기능
	$("#quickmenu li:first-child").click(function(){
		// 절대위치 계산
		const divId =document.getElementById('goods_contents');
		const clientRect = divId.getBoundingClientRect();
		const relativeTop = clientRect.top;
		
		const scrolledTopLength =window.pageYOffset; 
		const absoluteTop = scrolledTopLength + relativeTop;
		//alert(absoluteTop);
		// 이동효과
		window.scrollTo({
			left: 0,
			top: absoluteTop-30,
			behavior: 'smooth'
		});
		// 선택시 css 변경
		$("#quickmenu li:first-child").css({
			"background-color":"#fff",
			"border-bottom":"none",
			"color":"#741880"
		});
		$("#quickmenu li:not(:first-child)").css({
			"background-color":"#fafafa",
			"border":"1px solid #eee",
			"color":"rgba(102,102,102)"			
		});
	});
});

$(function(){
	$("#quickmenu li:nth-child(2)").click(function(){
		const divId =document.getElementById('topCen');
		const clientRect = divId.getBoundingClientRect();
		const relativeTop = clientRect.top;
		
		const scrolledTopLength =window.pageYOffset; 
		const absoluteTop = scrolledTopLength + relativeTop;
		//alert(absoluteTop);
		window.scrollTo({
			left: 0,
			top: absoluteTop-30,
			behavior: 'smooth'
		});
		$("#quickmenu li:nth-child(2)").css({
			"background-color":"#fff",
			"border-bottom":"none",
			"color":"#741880"
		});
		$("#quickmenu li:not(:nth-child(2))").css({
			"background-color":"#fafafa",
			"border":"1px solid #eee",
			"color":"rgba(102,102,102)"
		});
	});
});

$(function(){
	$("#quickmenu li:nth-child(3)").click(function(){
		const divId =document.getElementById('topRev');
		const clientRect = divId.getBoundingClientRect();
		const relativeTop = clientRect.top;
		
		const scrolledTopLength =window.pageYOffset; 
		const absoluteTop = scrolledTopLength + relativeTop;
		//alert(absoluteTop);
		window.scrollTo({
			left: 0,
			top: absoluteTop-30,
			behavior: 'smooth'
		});
		$("#quickmenu li:nth-child(3)").css({
			"background-color":"#fff",
			"border-bottom":"none",
			"color":"#741880"
		});
		$("#quickmenu li:not(:nth-child(3))").css({
			"background-color":"#fafafa",
			"border":"1px solid #eee",
			"color":"rgba(102,102,102)"
		});
	});
});

$(function(){
	$("#quickmenu li:nth-child(4)").click(function(){
		const divId =document.getElementById('topQna');
		const clientRect = divId.getBoundingClientRect();
		const relativeTop = clientRect.top;
		
		const scrolledTopLength =window.pageYOffset; 
		const absoluteTop = scrolledTopLength + relativeTop;
		//alert(absoluteTop);
		window.scrollTo({
			left: 0,
			top: absoluteTop-30,
			behavior: 'smooth'
		});
		$("#quickmenu li:nth-child(4)").css({
			"background-color":"#fff",
			"border-bottom":"none",
			"color":"#741880"
		});
		$("#quickmenu li:not(:nth-child(4))").css({
			"background-color":"#fafafa",
			"border":"1px solid #eee",
			"color":"rgba(102,102,102)"
		});
	});
});
