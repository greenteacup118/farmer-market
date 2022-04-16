<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uId_Session = (String) session.getAttribute("uId_Session");
%>
<jsp:useBean id="mDao" class="pack_Member.MemberDao"/>
<%
	 boolean result = mDao.deleteMember(uId_Session);
	 if(result) {
		 session.invalidate();
%>
	<script>
		alert("회원탈퇴가 완료되었습니다.");
		location.href="/index.jsp";
	</script>
<%
	 } else {
%>
	<script>
		alert("회원탈퇴에 실패하였습니다.");
		history.back();
	</script>
<%} %>