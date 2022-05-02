<%@page import="com.mysql.cj.Session"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
request.setAttribute("select", "N");

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터</title>
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
						<li id="notice_lnb" class="main_MLi"><a
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

				<h3>게시판 글쓰기</h3>

       <form id="frmW" action="/infoCenter/datainsert.jsp"  method="post" enctype="multipart/form-data">
            
				<hr id="divisionline_main">
						<select name="select">
							<option selected="selected" >게시판 선택</option>
							<option  value="N">공지사항</option>
							<option  value="Q">Q&A게시판</option>
							<option  value="F">FAQ게시판</option>

						</select>

		
             
				<table id="BBSwrite">
					<tbody>


				
			
                          <tr>   
							<td>작성자</td>
							<td id="uId">
							<input type="hidden"name="ibno" value="">
							<input name="writer" type="text" value="<%=uId%>">
							
							</td>                          
                         
                          </tr>
						
						<tr>
							<td>글제목</td>
							
							<td ><input name="title" type="text"></td>
						</tr>
						<tr>
							<td id="mainwrite">글내용</td>
							<td id="contents"><textarea rows="150" name="contents" ></textarea></td>
						</tr>
           
						<tr>
							<td>파일</td>
							<td id="file"><input name="file" type="file"></td>
						</tr>
					</tbody>

				</table>

				<div id="btnArea">

						<button type="button" id="cancelBtn">취소</button>

						<button type="submit" id="saveBtn">저장하기</button>
			
				</div>

                </form>




			</div>



		</main>

		<footer id="footer">

			<hr id="divisionline_footer">
			<jsp:include page="/ind/footerTmp.jsp" />
		</footer>





	</div>
</body>
</html>