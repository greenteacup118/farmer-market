
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

		//}


	});

	/*	$("#main #contents table#FAQTbl input#dropBtn").click(function() {
// alert(type(chk));
let chkTF = $("#main #contents table#FAQTbl tr").hasClass("False");      
if(!chkTF){
 
  $("#main #contents table#FAQTbl .False").css("display", "none");
$("#main #contents table#FAQTbl .cheked").addClass("False");
 $("#main #contents table#FAQTbl input#dropBtn").val("▼")  
}
	 


});*/










});/**
 * 
 *//**
 * 
 */