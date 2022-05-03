<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="pack_Goods.BasketBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String uId_Session = (String)session.getAttribute("uId_Session"); 
%>

<jsp:useBean id="delBasket" class="pack_Goods.GoodsDao" />
<%
request.setCharacterEncoding("UTF-8");

	
String[] goodsCode = request.getParameterValues("goodsCode[]");

if(goodsCode==null || goodsCode.length<=0){		 %>
	
<script>
	alert("선택하신 상품이 없습니다.");
	window.history.back();
</script>

<%
return;
}

for(int i=0; i<goodsCode.length; i++) {
	delBasket.deleteBasket(uId_Session, goodsCode[i]);
}

%>

<script>
	alert("선택하신 상품이 삭제되었습니다");
</script>

<%
response.sendRedirect("/goods/goods_basket.jsp");
%>