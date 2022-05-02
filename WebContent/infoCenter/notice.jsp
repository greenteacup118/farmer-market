<%@page import="java.util.List"%>
<%@page import="pack_infoCenter.NoticeVO"%>
<%@page import="pack_infoCenter.BBSDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="nvo" class="pack_infoCenter.BBSDAO" />
<%
request.setCharacterEncoding("UTF-8");

// List list = nvo.BBSRead1();
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style/style_infoCenter.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_infoCenter.js"></script>
</head>
<body>



	<div id="wrap">


		<jsp:include page="/ind/headerTmp.jsp" />




		<main id="main" class="dFlex">




			<div id="mainlnb" class="dFlex">

				<nav id="mainlnb_M">

					<h2>고객센터</h2>
					<ul id="nextPage">
						<li id="notice_lnb" class="main_MLi selected"><a
							href="/infoCenter/notice.jsp">공지사항</a></li>
						<li id="Q&A_lnb" class="main_MLi"><a
							href="/infoCenter/qna.jsp"> Q&A게시판</a></li>
						<li id="FAQ_lnb" class="main_MLi"><a
							href="/infoCenter/faq.jsp">FAQ게시판</a></li>
						<li id="inquire_lnb" class="main_MLi"><a
							href="/infoCenter/inquire.jsp">1:1문의</a></li>
					</ul>

				</nav>

			</div>

			<div id="contents">

				<h3>공지사항</h3>

				<hr id="divisionline_main">

				<table id="noticeTbl">
					<tbody>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일자</td>
							<td>조회수</td>
						</tr>

						<%
						String nowPage = request.getParameter("nowPage");
						if (nowPage == null) {
							nowPage = "1";
						}
						int nowBlock = 1;
						int numPerPage = 5;
						int pagePerBlock = 5;

						int Start = 0;
						int end = 5;

						int totalRecord = 0;
						int totalPage = 0;
						int totalBlock = 0;

						int listSize = 0;

						totalRecord = nvo.getCnt();

						totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
						nowBlock = (Integer.parseInt(nowPage) - 1) * numPerPage;

						int pageStart = (Integer.parseInt(nowPage) - 1) / pagePerBlock * pagePerBlock + 1;
						int pageEnd = Math.min(totalPage, pageStart + pagePerBlock - 1);
						%>


						<%
						List list = nvo.pageNum(nowBlock, numPerPage); //한꾸러미당 5개
						for (int i = 0; i < list.size(); i++) {
							NoticeVO vo = (NoticeVO) list.get(i);
						%>
						<tr id="ibno_n">
							<td><%=vo.getibno_n()%></td>
							<td id="pagenext"><a href="#"><%=vo.getTitle_n()%></a></td>
							<td><%=vo.getWriter_n()%></td>
							<td><%=vo.getwriteTime_n()%></td>
							<td><%=vo.getview_cnt_n()%></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>

				<input id="nowPage" type="hidden" value="<%=nowPage%>">

				<ul id="PageMove" class="dFlex">

					<%
					if (pageStart != 1) {
						int before = pageStart - 1;
					%>
					<li><a href="/infoCenter/notice.jsp?nowPage=<%=before%>">&lt;이전</a></li>
					<%
					}
					%>


					<%
					for (int j = pageStart; j <= pageEnd; j++) {
						String chk = "";
						if (nowPage.equals("" + j)) {
							chk = "class=\"chk\"";
						}
					%>
					<li <%=chk%>><a href="/infoCenter/notice.jsp?nowPage=<%=j%>"><%=j%></a></li>
					<%
					}

					if (totalPage != pageEnd) {
					int next = pageEnd + 1;
					%>
					<li><a href="/infoCenter/notice.jsp?nowPage=<%=next%>">다음&gt;</a></li>
					<%
					}
					%>



				</ul>




				<div id="buttonArea">
					<button id="write">
						<a href="/infoCenter/writePage.jsp">글쓰기</a>
					</button>
				</div>

				<div id="searchArea">

					<select id="">
						<option>제목</option>
						<option>글내용</option>
						<option>제목+글내용</option>
					</select> <input type="text">


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