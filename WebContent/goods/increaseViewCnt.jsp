<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao"/>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	
	goodsDao.updateViewCnt(no);
%>
<script>
	history.back();
</script>