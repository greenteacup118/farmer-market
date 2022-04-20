<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uId_session = (String) session.getAttribute("uId_Session");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>headerTmp</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style/style_ind.css">
</head>
<body>
	<div id="header">
		<!-------------- header상단 : 회원가입, 로그인, 고객센터 -------------->
		<div id="header-top">
			<ul id="headerUl" class="dFlex">

				<!------------------------------------------------------->
				<!-- 로그인 이후에는 마이페이지, 로그아웃, 고객센터로 변경 -->
				<!------------------------------------------------------->

				<!-- 회원가입 이동 -->
				<%
				if (uId_session == null) {
					// 비로그인 상태일 때
				%>
				<li class="mainLi"><a href="/member/member.jsp">회원가입</a></li>
				<li class="mainLi">|</li>
				<!-- 로그인 페이지 이동 -->
				<li class="mainLi"><a href="/member/login.jsp">로그인</a></li>
				<%
				} else {
				// 로그인 상태일 때
				%>
				<li class="mainLi"><a href="/myPage/orderList.jsp">마이페이지</a></li>
				<li class="mainLi">|</li>
				<!-- 로그인 페이지 이동 -->
				<li class="mainLi"><a href="/member/logout.jsp">로그아웃</a></li>
				<%
				}
				%>
				<li class="mainLi">|</li>
				<!-- 고객센터 이동 -->
				<li class="mainLi"><a href="/infoCenter/notice.jsp"> 고객센터 ▼</a>
					<!-- 고객센터 hover 시 나타나는 hidden div -->
					<div id="header-hiddenDiv">
						<ul>
							<li><a href="/infoCenter/notice.jsp">공지 게시판</a></li>
							<li><a href="/infoCenter/qna.jsp">Q&A 게시판</a></li>
							<li><a href="/infoCenter/faq.jsp">FAQ 게시판</a></li>
							<li><a href="/infoCenter/review.jsp">후기 게시판</a></li>
							<li><a href="/infoCenter/inquire.jsp">1:1 문의</a></li>
						</ul>
					</div> <!-- div#header-hiddenDiv --></li>
			</ul>
			<!-- ul#headerUl .dFlex-->
		</div>
		<!--------------------- div#header-top  --------------------->

		<!--------------------- header 로고 위치 --------------------->
		<div id="header-Logo">
			<!-- Image로 로고 삽입 -->
			<a href="/index.jsp"><img src="../images/header-Logo.png"
				alt="Farmer Market" /></a>
		</div>
		<!--------------------- div#header-Logo --------------------->

		<!--------- header하단 : LNB, 검색기능, 찜목록, 장바구니 --------->
		<div id="header-bot" class="dFlex">
			<div id="header-GNB">
				<ul id="gnbUl" class="dFlex">
					<li class="gnbLi"><a href="/goods/goods_vegitable.jsp">채소</a></li>
					<li class="gnbLi"><a href="/goods/goods_fruit.jsp">과일</a></li>
					<li class="gnbLi"><a href="/goods/goods_seafood.jsp">해산물</a></li>
					<li class="gnbLi"><a href="/goods/goods_meet.jsp">육류</a></li>
				</ul>
			</div>

			<!-- 검색 텍스트 입력 -->
			<div id="header-util" class="dFlex">
				<div id="searchDiv">
					<form method="get" action="/goods/goods_search.jsp">
						<input type="text" id="searchInput" name="search"
							placeholder="검색어를 입력해주세요.">
						<button type="submit" id="searchBtn">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</form>
				</div>
				<!-- div#searchDiv -->

				<!-- 찜목록, 장바구니 바로가기 아이콘 -->
				<div id="shortCut" class="dFlex">
					<div id="wishList">
						<a href="/myPage/wishList.jsp"> <i class="fa fa-fw fa-heart"></i></a>
					</div>
					<!-- 찜목록 -->
					<div id="basket">
						<a href="/goods/goods_basket.jsp"><i
							class="fa fa-fw fa-shopping-cart"></i></a>
					</div>
					<!-- 장바구니 -->
				</div>
				<!-- div#shortCut.dFlex -->
			</div>
			<!-- div#header-util -->
		</div>
		<!--------------------- div#header-bot .dFLEX --------------------->
	</div>
	<!-- div#header -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_ind.js"></script>
</body>
</html>