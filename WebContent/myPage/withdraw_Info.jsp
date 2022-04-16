<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String uId_Session = (String) session.getAttribute("uId_Session");
if(uId_Session == null) {
	response.sendRedirect("/member/login.jsp");
}
%>
<!-- Community 카피한 것 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원탈퇴</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_MyPage.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_MyPage.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- 마이페이지를 누르면 제일 먼저 orderList 화면이 나와야 함 -->
		<jsp:include page="/ind/headerTmp.jsp" />
		<!-- LNB템플릿 영역 -->

		<main id="main" class="dFlex">

			<div id="mainlnb" class="dFlex">
				<nav id="mainlnb_M">
					<h2>마이 마켓</h2>
					<ul>
						<li class="main_MLi"><a href="/myPage/orderList.jsp">주문
								내역</a></li>
						<li class="main_MLi"><a href="/myPage/wishList.jsp">찜한 상품</a></li>
						<li class="main_MLi"><a href="/myPage/addrUpdate.jsp">배송지
								관리</a></li>
						<li class="main_MLi"><a href="/myPage/goodsComments.jsp">상품
								후기</a></li>
						<li class="main_MLi"><a href="/myPage/goodsQnA.jsp">상품 문의</a></li>
						<li class="main_MLi"><a href="/myPage/update_Info.jsp">개인
								정보 수정</a></li>
						<li class="main_MLi checked"><a href="#">회원 탈퇴</a></li>
					</ul>
				</nav>
			</div>


			<div id="contentsArea">

				<div id="title_container" class="dFlex">
					<div id="title">
						<h2>회원 탈퇴</h2>
					</div>
					<div id="subtitle">
						<p></p>
					</div>
				</div>
				<hr class="sepLine">

				<div id="contents" class="memQuitDiv">

					<form id="memQuitFrm"
						action="/member/deleteProc.jsp">
						<p>아래 버튼을 클릭하시면 파머 마켓을 탈퇴합니다.</p>
						<button type="button" id="memQuitBtn">회원 탈퇴하기</button>
					</form>

				</div>

			</div>

		</main>

		<jsp:include page="/ind/footerTmp.jsp" />

	</div>
</body>
</html>