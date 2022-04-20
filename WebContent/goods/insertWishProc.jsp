<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<%
request.setCharacterEncoding("UTF-8");

String uId = (String) session.getAttribute("uId_Session");
String goodsCode = request.getParameter("goodsCode");

boolean chk = myPageDao.checkWish(goodsCode);
if (!chk) {
%>
<script>
	alert("이미 찜한 상품입니다.");
	history.back();
</script>
<%
} else {
myPageDao.insertWishList(uId, goodsCode);
%>
<script>
	alert("찜한 상품은 마이페이지의 찜한 목록에서 확인 가능합니다.");
	history.back();
</script>
<%	
}
%>