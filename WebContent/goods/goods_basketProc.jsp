<%@page import="pack_Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uId_Session = (String)session.getAttribute("uId_Session");
%>

<jsp:useBean id="gBean" class="pack_Goods.GoodsDao" />
<jsp:useBean id="deliInfo" class="pack_Member.MemberDao" />


<%
request.setCharacterEncoding("UTF-8");

String goodsCode = (String)request.getParameter("goodsCode");
int goodsCnt = Integer.parseInt(request.getParameter("goodsCnt"));
MemberBean uDeli = deliInfo.selectMemberOne(uId_Session);
String userDel = uDeli.getuAddr();

//System.out.println(goodsCode + "/" +goodsCnt + "/" + uId_Session + "/"  + userDel);
// 주소값 반환

gBean.insertBasket(uId_Session, goodsCode, goodsCnt, userDel);
// insert문 실행
response.sendRedirect("/goods/goods_basket.jsp");
%>
