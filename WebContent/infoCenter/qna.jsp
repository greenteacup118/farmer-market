<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




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






	<div id="wrap">
		<header id="headerTmp">

			<div id="headMenu">
				<ul class="dFlex">
					<li><a href="#">로그아웃</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
			<a href="/infoCenter/notice.jsp"><img
				src="/images/headerLogo.png" alt="헤더로고" /></a>

			<nav id="headLNB">

				<ul class="dFlex">
					<li>LNB카테고리</li>
					<li>|</li>
					<li>육류</li>
					<li>|</li>
					<li>채소</li>
					<li>|</li>
					<li>생선</li>

				</ul>

			</nav>




		</header>

		<!--      <div id="headerLMB">
      
     
     
     </div>
    -->
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

				<hr class="divisionline">

				<table>
					<tbody>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일자</td>
							<td>조회수</td>
						<tr>
							<td>1</td>
							<td><a href="#">배송지등록을 어떻게 해요?</a></td>
							<td>문혁민</td>
							<td>04-10</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>



				<ul id="PageMove" class="dFlex">
					<li><a href="#">〈</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">〉</a></li>
				</ul>

				<button id="write">
					<a href="/infoCenter/writePage.jsp">글쓰기</a>
				</button>

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

			<hr class="divisionline">

		</footer>




	</div>
</body>
</html>