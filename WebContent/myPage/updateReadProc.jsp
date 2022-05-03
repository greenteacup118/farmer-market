<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<%
	request.setCharacterEncoding("UTF-8");
	String uId = (String)session.getAttribute("uId_Session");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String type = request.getParameter("type");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	boolean result = false;
	
	if("c".equals(type)) {
		result = myPageDao.updateCmtOne(title, content, uId, no);
		response.sendRedirect("/myPage/goodsComments.jsp");
	}else if("q".equals(type)) {
		result = myPageDao.updateQnaOne(title, content, uId, no);
		response.sendRedirect("/myPage/goodsQnA.jsp");
	}
	
	if (!result) {
		%>
		<script>
			alert("다시 시도해주세요.");
			history.back();
		</script>
		<%
	}
	%>