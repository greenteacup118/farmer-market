<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 세션 로그아웃 코드 작성
	session.invalidate();
// index.jsp로 redirect 코드 작성
	response.sendRedirect("/index.jsp");
%>