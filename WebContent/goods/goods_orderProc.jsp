<%@page import="java.util.Arrays"%>
<%@page import="pack_Goods.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="order" class="pack_Goods.GoodsDao" />
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao"/>
<%
String uId_Session = (String)session.getAttribute("uId_Session"); 
request.setCharacterEncoding("UTF-8");

String[] goodsCodes = request.getParameterValues("goodsCode[]");
String[] goodsCnts = request.getParameterValues("goodsCnt");


if (goodsCodes.length == 0) {
	%>
		<script>
			alert("주문하실 상품을 선택해주세요.");
			history.back();
		</script>	
	<%
} else {
			
	for (int i = 0; i < goodsCodes.length; i++) {
		String goodsCode = goodsCodes[i];
		GoodsBean gBean = order.selectGoodsOne(goodsCode);

		int goodsPrice = gBean.getGoodsPrice();
		int eventRate = gBean.getEventRate();

		int cnt = Integer.parseInt(goodsCnts[i]);

		myPageDao.insertOrderList(uId_Session, goodsCode, cnt, goodsPrice, eventRate);
		//주문완료 후 장바구니 목록 삭제
		order.orderCom(uId_Session, goodsCode);
	}


	response.sendRedirect("/goods/goods_basket.jsp");
}
%>