<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pack_Goods.GoodsDao"%>
<%@page import="pack_Goods.GoodsBean"%>
<%@page import="pack_MyPage.OrderListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao" scope="request" />
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
<title>구매 내역</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_MyPage.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_myPage.js"></script>
</head>
<body>
	<%
	if (uId == null) {
	%>
	<script>
		alert("로그인 이후에 사용 가능한 서비스입니다.");
		location.href = "/member/login.jsp";
	</script>
	<%
	}
	%>
	<div id="wrap">
		<!-- 마이페이지를 누르면 제일 먼저 orderList 화면이 나와야 함 -->
		<jsp:include page="/ind/headerTmp.jsp" />

		<main id="main" class="dFlex">

			<div id="mainlnb" class="dFlex">
				<nav id="mainlnb_M">
					<h2>마이 마켓</h2>
					<ul>
						<li class="main_MLi checked"><a href="#">주문 내역</a></li>
						<li class="main_MLi"><a href="/myPage/wishList.jsp">찜한 상품</a></li>
						<li class="main_MLi"><a href="/myPage/addrUpdate.jsp">배송지
								관리</a></li>
						<li class="main_MLi"><a href="/myPage/goodsComments.jsp">상품
								후기</a></li>
						<li class="main_MLi"><a href="/myPage/goodsQnA.jsp">상품 문의</a></li>
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
						<h2>주문 내역</h2>
					</div>
					<div id="subtitle">
						<p>*지난 3년간의 주문 내역 조회가 가능합니다.</p>
					</div>
					<div id="select">
						<select name="where" id="yearSelect">
							<option value="">전체 기간</option>
							<option value="2022">2022년</option>
							<option value="2021">2021년</option>
							<option value="2020’">2020년</option>
						</select>
					</div>
				</div>


				<hr class="sepLine">
				<div id="contents">

					<div id="orderListArea">
						<table id="orderListTbl">
							<tbody>
								<tr>
									<td><strong>상품명</strong></td>
									<td><strong>주문일자</strong></td>
									<td><strong>구매수량 / 결제금액</strong></td>
								</tr>
								<%
								String where = request.getParameter("where");
								if (where == null) {
									where = "";
								}

								List<OrderListBean> list = myPageDao.selectOrderList(uId, where);
								if (list.size() == 0) {
								%>
								<tr>
									<td colspan="3" id="notFound">해당 기간(<%=where %>년)에 대해 검색된 주문내역이 없습니다.</td>
								</tr>
								<%
								} else {
								for (int i = 0; i < list.size(); i++) {
									OrderListBean oBean = list.get(i);
									GoodsBean gBean = goodsDao.selectGoodsOne(oBean.getGoodsCode());
								%>
								<tr>
									<td><div id="images">
											<%=gBean.getGoodsName() + (gBean.getDeliType() + ", " + gBean.getGoodsWeight()) + "  (단위 :"+gBean.getUnitType()+")"%>
										</div></td>
									<td><%=oBean.getBuyTime()%></td>
									<td><%=+ oBean.getGoodsCnt()
									+ "개 / " + gBean.getGoodsPrice() * oBean.getGoodsCnt()%>원</td>
								</tr>
								<%
								}
								}
								%>
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