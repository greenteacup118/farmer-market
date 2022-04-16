<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="pack_Member.MemberDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("uId_Session");
String goodsCode = request.getParameter("goodsCode");
if (uId_Session == null) {
	String url = "/member/login.jsp?to=/mainPage/updateBasketProc.jsp&goodsCode=" + goodsCode ;
	%>
	<script>
		alert("로그인이 필요한 서비스입니다.");
		location.href = "<%=url %>";
	</script>
	<%
} else {
	// goodsCode를 goodsDao로 이동시켜서 장바구니 Bean에 담은 다음
	// 해당 Bean을 insert하고
	%>
	<script>
		alert("아직 작업 중...");
		location.href ="/index.jsp";
	</script>
	<%	
}
%>
