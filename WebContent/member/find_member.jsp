<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String find = request.getParameter("find");
if (find == null)
	find = "id";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<!-- favicon 설정 -->
<link rel="icon" type="image/x-icon" href="../images/favicon.png">
<!-- fontawesome 설정 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style/style_member.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/ind/headerTmp.jsp" />
		<main id="login">
			<form id="loginFrm" method="post" action="/member/loginProc.jsp">
				<table>
					<tbody>
						<%
						if (find.equals("id")) {
						%>
						<tr id="title">
							<td>아이디 찾기</td>
						</tr>
						<tr>
							<td class="subTitle">이름</td>
						</tr>
						<tr>
							<td><input id="find_idInput" type="text" name="uName"
								placeholder="이름을 입력해주세요"></td>
						</tr>
						<tr>
							<td class="subTitle">휴대폰 번호</td>
						</tr>
						<tr>
							<td><input id="pwInput" type="password" name="uPhone"
								placeholder="휴대폰 번호를 입력해주세요">
						</tr>
						<%
						} else {
						%>
						<tr id="title">
							<td>비밀번호 찾기</td>
						</tr>
						<tr>
							<td class="subTitle">아이디</td>
						</tr>
						<tr>
							<td><input id="find_idInput" type="text" name="uName"
								placeholder="아이디를 입력해주세요"></td>
						</tr>
						<tr>
							<td class="subTitle">휴대폰 번호</td>
						</tr>
						<tr>
							<td><input id="pwInput" type="password" name="uPhone"
								placeholder="휴대폰 번호를 입력해주세요">
						</tr>
						<%
						}
						%>
						<tr>
							<td>
								<div class="dFlex  find_div">
									<ul id="findAccount" class="dFlex">
										<li class="findLi"><a
											href="/member/find_member.jsp?find=id">아이디 찾기</a></li>
										<li class="findLi">|</li>
										<li class="findLi"><a
											href="/member/find_member.jsp?find=pw">비밀번호 찾기</a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<button id="findBtn" type="button">인증번호 받기</button>
							</td>
						</tr>
						<tr>
							<td><a href="/member/member.jsp"><button id="memberBtn"
										type="button">회원가입</button></a></td>
						</tr>
					</tbody>
				</table>
			</form>
		</main>
		<jsp:include page="/ind/footerTmp.jsp" />
	</div>
	<!--div#wrap-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_member.js"></script>
</body>
</html>