
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="pack_Member.MemberDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
String uPw = request.getParameter("uPw");

// ↓ 메인페이지에서 장바구니 담기 버튼 클릭시 비로그인 상태일때 받는 값
//------------------------------------------------------------
String to = request.getParameter("to");
String with = request.getParameter("goodsCode");

String url = "";

//상품코드 관련 페이지가 아니라면 어디로 갈건지만(to)
if(with != null){
	url = to + "?goodsCode=" + with;
} else if(with == null){
	url = "/index.jsp";
}

//------------------------------------------------------------

String msg = "아이디 또는 비밀번호를 확인해주세요.";

boolean result = memberDao.loginMember(uId, uPw);
if (result) {
	session.setAttribute("uId_Session", uId);

//만약 로그인 전에 가려했던 페이지가 있었다면?	
if (to != null) {
%>
<script>
	location.href = "<%=url%>";
</script>
<%
}

//로그인 목적으로 로그인 페이지에 들어왔던 거라면?
%>
<script>
	alert("<%=uId%>님 환영합니다.");
	location.href = "/index.jsp";
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