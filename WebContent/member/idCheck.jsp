<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="memberDao" class="pack_Member.MemberDao" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%
request.setCharacterEncoding("UTF-8");

//매개변수로 전달받은 name=uId을 uId 변수에 저장
String uId = request.getParameter("uId");

// true : 사용 가능, false : 사용 불가(중복)
boolean result = memberDao.checkId(uId);
%>

<title>아이디 중복확인</title>
<!-- favicon 설정 -->
<link rel="icon" type="image/x-icon" href="../images/favicon.png">
<link rel="stylesheet" href="/style/style_member.css">
</head>
<body>
	<div id="idCheck" class="dFlex">
		<%
		if (result) {
		%>
		<p>
			[<span><%=uId%></span>]는 사용가능합니다.
		</p>
		<input type="hidden" id="idChk" value="1">
		<%
		} else {
		%>
		<p>
			[<span><%=uId%></span>]는 이미 존재하는 ID입니다. <input type="hidden" id="idChk"
				value="2">
		</p>
		<%
		}
		%>
		<button type="button">닫기</button>
	</div>
	<!--div#idCheck-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_member.js"></script>
</body>
</html>