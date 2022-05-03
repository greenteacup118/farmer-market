<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="pack_infoCenter.QnaVO"%>
<%@page import="java.util.List"%>
<jsp:useBean id="nvo" class="pack_infoCenter.BBSDAO"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/style/style_infoCenter.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_infoCenter.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
//List list = nvo.BBSRead2(); 

%>





	<div id="wrap">
		<jsp:include page="/ind/headerTmp.jsp" />

		<main id="main" class="dFlex">




			<div id="mainlnb" class="dFlex">



				<nav id="mainlnb_M">

					<h2>고객센터</h2>
					<ul>
						<li id="notice_lnb" class="main_MLi"><a
							href="/infoCenter/notice.jsp">공지사항</a></li>
						<li id="Q&A_lnb" class="main_MLi selected"><a
							href="/infoCenter/qna.jsp">Q&A게시판</a></li>
						<li id="FAQ_lnb" class="main_MLi"><a
							href="/infoCenter/faq.jsp">FAQ게시판</a></li>
						<li id="inquire_lnb" class="main_MLi"><a
							href="/infoCenter/inquire.jsp">1:1문의</a></li>
					</ul>

				</nav>

			</div>

			<div id="contents">

				<h3>Q&A게시판</h3>

				<hr id="divisionline_main">

				<table id="QnaTbl">
					<tbody>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일자</td>
							<td>조회수</td>
					<%
					String nowPage = request.getParameter("nowPage");
					if(nowPage==null){
						nowPage="1";
					}
					int nowblock=1;
					int numPerpage=5;
					int pageperblock=5;
					
													//20
					int totalCount=0;
					
					totalCount= nvo.Q_getCnt();
																				
				
					int totalPage=(int)Math.ceil((double)totalCount/numPerpage);
																			
					int Stratpage=(Integer.parseInt(nowPage)-1)/numPerpage*pageperblock+1;
					int endPage=Math.min(totalPage , Stratpage+pageperblock-1);
					
					nowblock =(Integer.parseInt(nowPage)-1)*numPerpage;
					
					List list_q = nvo.Qnalist(nowblock,numPerpage);
 					for( int i=0;i<list_q.size();i++) {
 						
 					QnaVO vo =(QnaVO)list_q.get(i);
 					%>
						<tr id="ibno_q">
							<td><%=vo.getibno_q()%></td>
							<td id="pagenext_q"><a href="#"><%=vo.getTitle_q() %></a></td>
							<td><%=vo.getWriter_q() %></td>
							<td><%=vo.getWriteTime_q() %></td>
							<td><%=vo.getview_cnt_q() %></td>
						</tr>
						<%} %>
					
								
					</tbody>
				</table>

				<input id="nowPage_q" type="hidden" value="<%=nowPage%>">

				<ul id="PageMove" class="dFlex">
				<%if(Stratpage!=1) {
				   int before = Stratpage-pageperblock;
				%>
					<li><a href="/infoCenter/qna.jsp?nowPage=<%=before%>">&lt;이전</a></li>
					
				<% }%>
				
					<%
					for(int j=Stratpage; j<=endPage; j++){
						String chk="";
						if(nowPage.equals(""+j)){
						chk=	"class=\"chk\"";
						}
					%>
					<li <%=chk%>><a href="/infoCenter/qna.jsp?nowPage=<%=j%>"><%=j%></a></li>
					
					<%} %>
					
					<%if(totalPage!=endPage){
						int next = endPage + 1;
						%>
					<li><a href="/infoCenter/qna.jsp?nowPage=<%=next%>">다음&gt;</a></li>
					<%} %>
				</ul>

				<div id="buttonArea">
				<button id="write">
					<a href="/infoCenter/writePage.jsp">글쓰기</a>
				</button>
				</div>

				<div id="searchArea">

					<select id="titleMenu">
						<option>제목</option>
						<option>글내용</option>
						<option>제목+글내용</option>
					</select> 
					<input type="text">


					<button type="button" id="searchBtn">
						<i class="fa fa-fw fa-search"></i>
					</button>

				</div>

			</div>



		</main>

		<footer id="footer">

			<hr id="divisionline_footer">
			<jsp:include page="/ind/footerTmp.jsp" />

		</footer>




	</div>
</body>
</html>