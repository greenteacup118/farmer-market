<%@page import="pack_Goods.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId = (String) session.getAttribute("uId_Session");

String goodsCode = (String) request.getParameter("goodsCode");
GoodsBean gBean = goodsDao.selectGoodsOne(goodsCode);

//true : 사용 가능, false : 사용 불가(중복)
boolean result = goodsDao.checkBasket(goodsCode);

int eventRate = gBean.getEventRate();
int salePrice = gBean.getGoodsPrice() - gBean.getGoodsPrice() * eventRate / 100;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니 바로가기</title>
<link rel="stylesheet" href="/style/style_Common.css">
</head>
<body>
	<form action="/mainPage/goods_basketProc.jsp" id="basketFrm"
		method="get">
		<div id="popUp">
			<div id="title">장바구니 담기</div>
			<div>
				<div id="name" class="dFlex">
					<div id="nameLeft"><%=gBean.getGoodsName() + " (" + gBean.getGoodsWeight() + ")"%></div>
					<%
					if (eventRate > 0) {
					%>
					<div id="nameRight"><%=eventRate%>% 할인 중</div>
					<%
					}
					%>
				</div>
			</div>

			<div class="dFlex">
				<div id="price" class="price">
					<%=gBean.getGoodsPrice()%>
				</div>
				<div class="cntBtn">
					<button type="button" id="cntMinus">-</button>
					<input type="text" name="goodsCnt" value="1" readonly>
					<button type="button" id="cntPlus">+</button>
				</div>
			</div>

			<div id="total" class="dFlex">
				<div>합계</div>
				<%
				if (eventRate > 0) {
				%>
				<div id="totalPrice" class="price"><%=salePrice%></div>
				<%
				} else {
				%>
				<div id="totalPrice" class="price"><%=gBean.getGoodsPrice()%></div>
				<%
				}
				%>
			</div>

			<div id="btnArea" class="dFlex">
				<button type="button" id="cancelBtn">취소</button>
				<button type="button" id="basketBtn">장바구니 담기</button>
			</div>
			<div id="hidden">
				<input type="hidden" id="uId" name="uId" value="<%=uId%>"> <input
					type="hidden" id="basketChk" name="basketChk" value="<%=result%>">
				<input type="hidden" name="goodsCode" value="<%=goodsCode%>">
			</div>
		</div>
	</form>
	<!--div#popUp-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_basketPopUp.js"></script>
</body>
</html>