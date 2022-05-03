<%@page import="pack_Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberDao" class="pack_Member.MemberDao" />
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao" />
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao"/>
<%
request.setCharacterEncoding("UTF-8");
String goodsCode = request.getParameter("goodsCode");

String uId = (String) session.getAttribute("uId_Session");
MemberBean member = memberDao.selectMemberOne(uId);
String addr = member.getuAddr();

goodsDao.insertBasket(uId, goodsCode, 1, addr);
boolean result = myPageDao.deleteWishList(goodsCode);

%>
<script>
	alert("장바구니에 상품을 담았습니다! 장바구니 목록에서 확인해주세요.");
	location.href="/myPage/wishList.jsp";
</script>
