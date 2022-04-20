<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao" />
<%
request.setCharacterEncoding("UTF-8");

String uId_Session = (String) session.getAttribute("uId_Session");
String goodsCode = request.getParameter("goodsCode");

if (uId_Session == null) {
	String url = "/member/login.jsp?to=/goods/goods_detail.jsp&goodsCode=" + goodsCode;
%>
<script>
		alert("로그인이 필요한 서비스입니다.");
		location.href = "<%=url%>";
</script>
<%
} else {
	boolean result = goodsDao.insertGoodsComments(request, uId_Session);
	String url = "/goods/goods_detail.jsp?goodsCode=" + goodsCode;
	if (!result) {%>
		<script>
			alert("오류가 발생했습니다. 다시 시도해주세요!");
			location.href = "<%=url%>";
		</script>
		<%
	} else {
		%>
		<script>
			location.href = "<%=url%>";
		</script>
	<%
		}
}
%>
