<%@page import="pack_infoCenter.NoticeVO"%>
<%@page import="pack_infoCenter.QnaVO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="nvo" class="pack_infoCenter.NoticeVO"/>
<jsp:useBean id="qvo" class="pack_infoCenter.QnaVO"/>

<jsp:useBean id="BMgr" class="pack_infoCenter.BBSDAO" />


<%
request.setCharacterEncoding("UTF-8");
int ibno_n=Integer.parseInt(request.getParameter("ibno_n"));
out.print("ibno_n");
NoticeVO bean1 = BMgr.bean1(ibno_n);



String title_n  = bean1.getTitle_n();
String contetns_n = bean1.getContents_n();
String writer_n = bean1.getWriter_n();
String writeTime_n =bean1.getwriteTime_n();
Long fileSize_n   = bean1.getfileSize_n();
String fileRName_n = bean1.getfileRName_n();



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
    					
    					<table id="BBSread">
					<tbody>


				
			
                          <tr>   
							<td>작성자</td>
							<td id="uId">
							<input name="writer_read" type="text" readonly="readonly" value="<%=writer_n%> ">
							</td>                          
							<td>작성날짜</td>
							<td id="uId">
							<input name="writerTime" type="text" readonly="readonly" value="<%=writeTime_n%>">
							</td>       		
							
							
                         
                          </tr>
						
						<tr>
							<td >글제목</td>
							
							<td colspan="3"><input name="title"  type="text" readonly="readonly" value="<%=title_n%>"></td>
						</tr>
						<tr>
							<td id="mainwrite" >글내용</td>
							<td id="contents"  colspan="3" ><textarea rows="150" name="contents" readonly="readonly"><%=contetns_n%></textarea></td>
						</tr>
           
						<tr>
							<td>파일</td>
							<td id="file" colspan="3"  ><input name="file" type="file" value="<%=fileRName_n%>"  ></td>
						</tr>
					</tbody>

				</table>
 					
    				<input id="nowPage_read" type="hidden" value="<%=request.getParameter("nowPage")%>">
    				
    					<div id="btnArea_read">
						<button type="button" id="indexBtn">목록</button>
					
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