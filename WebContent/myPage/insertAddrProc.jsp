<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao"/>
<%
request.setCharacterEncoding("UTF-8");
String uId = (String)session.getAttribute("uId_Session");


String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");

String addr = addr1 + " " + addr2;

String name = "";

String name1 = request.getParameter("name1");
String name2 = request.getParameter("name2");

if(!name1.equals("")) {
	name = name1;
} else if(!name2.equals("")) {
	name = name2;
} else {
	%>
		<script>
			alert("입력 사항을 다시 확인해주세요");
			location.href="/myPage/addrUpdate.jsp";
		</script>
	<%
}

boolean result = myPageDao.insertAddr(uId, name, addr);
response.sendRedirect("/myPage/addrUpdate.jsp");
%>
