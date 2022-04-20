<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao"/>
<jsp:useBean id="memberDao" class="pack_Member.MemberDao" />
<jsp:useBean id="mBean" class="pack_Member.MemberBean"/>
<jsp:setProperty name="mBean" property="*"/>
<%

boolean result = memberDao.insertMember(mBean);

// 배송지 관리 테이블에 정보 저장
String addr = mBean.getuAddr();
String id = mBean.getuId();
String name = mBean.getuName();
myPageDao.insertAddr(id, name ,addr);

if (result) {
%>
<script>
	alert("회원가입을 완료하였습니다. 환영합니다!");
	location.href = "/member/login.jsp";
</script>
<%
} else {
%>
<script>
	alert("회원가입에 실패하였습니다. 다시 시도해주세요.");
	history.back();
</script>
<%
}
%>