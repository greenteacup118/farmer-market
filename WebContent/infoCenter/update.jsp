<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <jsp:useBean id="Uao" class="pack_infoCenter.BBSDAO"/>
  
<%
request.setCharacterEncoding("UTF-8");
int ibno_q=Integer.parseInt(request.getParameter("ibno_q"));
String numPage = request.getParameter("numPage");              
boolean update= false;
Uao.bean2(ibno_q);

 request.setAttribute("update", false);
 response.sendRedirect("/infoCenter/readPage_q.jsp?ibno_q="+ibno_q+"&numPage="+numPage);
  

%>    

