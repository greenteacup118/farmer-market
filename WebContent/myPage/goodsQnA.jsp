<%@page import="pack_Goods.GoodsBean"%>
<%@page import="pack_MyPage.GoodsQnABean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId = (String) session.getAttribute("uId_Session");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품문의</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_MyPage.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_myPage.js"></script>
</head>
<body>
	<%
	// 만약 로그인이 안되어 있다면 로그인 페이지로 이동시키기
	if (uId == null) {
		String url = "/member/login.jsp?to=/myPage/goodsQnA.jsp";
	%>
	<script>
		alert("로그인이 필요한 서비스입니다.");
		location.href = "<%=url%>
		";
	</script>
	<%
}
%>
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
						<li class="main_MLi checked"><a href="#">상품 문의</a></li>
						<li class="main_MLi"><a href="/myPage/update_Info.jsp">개인
								정보 수정</a></li>
						<li class="main_MLi"><a href="/myPage/withdraw_Info.jsp">회원
								탈퇴</a></li>
					</ul>
				</nav>
			</div>
			<div id="contentsArea">

				<div id="title_container" class="dFlex">
					<div id="title">
						<h2>상품 문의</h2>
					</div>
					<div id="subtitle" class="QnA">
						<p>*상품에 대한 문의를 남기는 공간입니다.</p>
						<br>
						<p>
							*배송관련, 주문 관련 문의 및 요청사항은 파머마켓 내 <strong>1:1 문의</strong>에 남겨주세요.
						</p>
					</div>

				</div>
				<hr class="sepLine">
				<div id="contents">

					<div id="goodsQnA">
						<table id="QnATbl">
							<tbody>
								<tr>
									<td><strong>제목</strong></td>
									<td><strong>작성일</strong></td>
									<td><strong>답변상태</strong></td>
								</tr>
								<!-- ///////////////////////// 반복문 시작 ///////////////////////// -->
								<%
								List<GoodsQnABean> qList = goodsDao.selectMyGoodsQnaList(uId);

								if (qList.size() == 0) {
								%>
								<tr class="qnaTr">
									<td rowspan="3">작성하신 상품 문의가 없습니다.</td>
								</tr>
								<%
								} else {
								for (int i = 0; i < qList.size(); i++) {
									GoodsQnABean gBean = qList.get(i);
									String goodsCode = gBean.getGoodsCode();
									GoodsBean goods = goodsDao.selectGoodsOne(goodsCode);
									String goodsName = goods.getGoodsName();
								%>
								<tr class="qnaTr" id="bbsQnaTr">
									<td>[<%=goodsName%>] <%=gBean.getTitle_q()%> <input
										type="hidden" name="no" value="<%=gBean.getNo()%>"> <input
										type="hidden" name="type" value="q">
										<input type="hidden" name="write" value="n">
									</td>
									<td><%=gBean.getWriteTime_q()%></td>
									<td>답변예정</td>
								</tr>
								<%
								}
								}
								%>
								<!-- ///////////////////////// 반복문 끝 ///////////////////////// -->
							</tbody>
						</table>
					</div>


				</div>

			</div>
		</main>

		<jsp:include page="/ind/footerTmp.jsp" />

	</div>
</body>
</html>