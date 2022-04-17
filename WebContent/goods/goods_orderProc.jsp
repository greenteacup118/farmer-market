<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String uId_Session = (String)session.getAttribute("uId_Session"); 
%>

<jsp:useBean id="order" class="pack_Goods.GoodsDao" />
<%
request.setCharacterEncoding("UTF-8");

	
order.orderCom(uId_Session);

%>

<%
response.sendRedirect("/index.jsp");
%>