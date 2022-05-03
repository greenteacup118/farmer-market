<%@page import="pack_Goods.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
request.setCharacterEncoding("UTF-8");

// request로 받은 goodsCode값을 가지고 forward, goodsDetail.jsp 로 이동
RequestDispatcher dispatcher = request.getRequestDispatcher("/goods/goods_detail.jsp");
dispatcher.forward(request, response);
%>
