<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uId_session = (String)session.getAttribute("uId_Session");
%>
<jsp:useBean id="memberDao" class="pack_Member.MemberDao" />
<jsp:useBean id="mBean" class="pack_Member.MemberBean" />
<jsp:setProperty name="mBean" property="*"/>
<%

boolean result = memberDao.updateMember(mBean, uId_session);

if (result) {
%>
<script>
	alert("회원정보 수정을 완료하였습니다.");
	location.href = "/myPage/update_Info.jsp";
</script>
<%
} else {
%>
<script>
	alert("회원정보 수정에 실패하였습니다. 입력하지 않은 정보가 있는지 확인해주세요.");
	history.back();
</script>
<%
}
%>