<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <jsp:useBean id="nvo" class="pack_infoCenter.BBSDAO"/>
  
 <%

/* if(type==null){ 
                 
}else{ */  //나중에 세션아이디 받으면 그걸로 두번안되게 할 예정
	
String select = nvo.BBSMulti(request);
	

// 어떤페이지로 가야되는지
/* String select = request.getParameter("select"); */
 
 if(select.equals("N")){
 response.sendRedirect("/infoCenter/notice.jsp");
 nvo.BBSMulti_n(request);
//request : 클라이언트가 서버한테 요청
//response : 서버가 클라이언트한테 보내는 정보
 }else if(select.equals("Q")){
response.sendRedirect("/infoCenter/qna.jsp");
nvo.BBSMulti_q(request);
}else{

%>   
 <script>
 history.back(); 
 </script>
<%}%> 
 

 
 
 
 
 
 