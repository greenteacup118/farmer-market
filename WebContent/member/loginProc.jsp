
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="pack_Member.MemberDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
String uPw = request.getParameter("uPw");

String msg = "아이디 또는 비밀번호를 확인해주세요.";

boolean result = memberDao.loginMember(uId, uPw);
if (result) {
	session.setAttribute("idKey", uId);
%>
<script>
	alert("<%=uId%>님 환영합니다.");
	location.href="/index.jsp";
</script>
<%
} else {
 %>
 <script>
	alert("아이디 또는 비밀번호를 다시 확인해주세요");
	history.back();
</script>
 <%
 }
 %>