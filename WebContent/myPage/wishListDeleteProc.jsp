<%@page import="com.mysql.cj.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId = (String) session.getAttribute("uId_Session");

String goodsCode = request.getParameter("goodsCode");

if (goodsCode != null) {
		if (myPageDao.deleteWishList(goodsCode)) { %>
			<script>
			alert("삭제가 완료되었습니다.");
		  </script>
<%      } else { %>
			<script>
			alert("삭제 도중에 에러가 발생하였습니다.");
		  </script>
 <%   }	
		}
	
response.sendRedirect("/myPage/wishList.jsp");
%>	

