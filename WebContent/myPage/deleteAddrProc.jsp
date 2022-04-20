<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId = (String) session.getAttribute("uId_Session");

String proc = request.getParameter("proc");

if ("D".equals(proc)) {
	String[] no = request.getParameterValues("no");
	if (no == null) {
		no = new String[] {};
	}
	for (int i = 0; i < no.length; i++) {
		myPageDao.deleteAddr(uId, no[i]);
	}
	
	%>
		<script>
			alert("삭제가 완료되었습니다.");
		</script>
	<%
} else {
	
}

response.sendRedirect("/myPage/addrUpdate.jsp");
%>