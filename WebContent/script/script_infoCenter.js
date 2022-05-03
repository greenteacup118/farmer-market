/**
 * 
/**
 * 
 */
$(function() {

	$("#main #mainlnb_M>ul>li.main_MLi").click(function() {

		$("#main #mainlnb_M>ul>li.main_MLi").removeClass("selected");
		$(this).addClass("selected");

	});


	// dropBtn을 클릭하엿을떄             
	$("#main #contents table#FAQTbl input.dropBtn").click(function() {


		// alert(type(chk));
		let chk = $("#main #contents table#FAQTbl #cheked").prop("class");
		// chk는 지금 이것의 TF을 체크하는 속성을 더한다

		//	for (let i = 0; i < x.length; i++) {
		// tr 갯수만큼 반복한다.

		if (chk == "False") {
			//만약에 chk가 True가아니라면 실행한다
			$("#main #contents table#FAQTbl #cheked").css("display", "none");
			$(this).parent().parent().next().css("display", "block");
			// input button^td^tr side tr을 실행한다
			$("#main #contents table#FAQTbl #cheked").removeClass("False");
			//	#cheked 에 FAlse클래스를 삭제		
			$(this).val("▲")



		} else {
			$(this).parent().parent().next().css("display", "none");
			$("#main #contents table#FAQTbl #cheked").addClass("False");
			$(this).val("▼");
			
		}
 
	});
			
			 $("button#saveBtn").click(function(){
            let a = $("select[name=select]").val()


               if(a=="게시판 선택"){
                    alert("게시판을 선택해주세요");
                  
                }
	
	 });
				$("#noticeTbl tr#ibno_n").click(function(){

					let ibno_n = $(this).children().eq(0).text()
					let nowPage=$("input#nowPage").val();
					let url = "/infoCenter/readPage_n.jsp?ibno_n="+ibno_n+"&nowPage="+nowPage;
				
					$("#pagenext>a").attr("href",url);
				})

					$("div#btnArea_read>button#indexBtn").click(function(){
					let nowPage = $("input#nowPage_read").val();
					let url = "/infoCenter/notice.jsp?nowPage="+nowPage;
					
					location.href = url;
				})
	
			$("#QnaTbl tr#ibno_q").click(function(){

					let ibno_q = $(this).children().eq(0).text()
					let nowPage=$("input#nowPage_q").val();
					let url = "/infoCenter/readPage_q.jsp?ibno_q="+ibno_q+"&nowPage="+nowPage;
				
					$("#pagenext_q>a").attr("href",url);
				})
			
						$("div#btnArea_read_q>button#indexBtn_q").click(function(){
					let nowPage = $("input#nowPage_read_q").val();
					let url = "/infoCenter/qna.jsp?nowPage="+nowPage;
					
					location.href = url;
			
			});
			$("button#updateBtn").click(function(){
				let ibno_q= $("input#BBSNum").val()
				let nowPage = $("input#nowPage_read_q").val();
				alert(nowPage);
				let url = "/infoCenter/update.jsp?ibno_q="+ibno_q+"&nowPage="+nowPage;
				location.href= url;
				
				""
			})
			
			
			
			
			
});/**
 * 
 *//**
 * 
 */
