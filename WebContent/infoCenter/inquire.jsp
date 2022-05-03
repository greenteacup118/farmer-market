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
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_infoCenter.js"></script>
</head>
<body>



	<div id="wrap">
		<jsp:include page="/ind/headerTmp.jsp" />



	

		

		<form id="frm">
			<main id="main" class="dFlex">


				<div id="mainlnb" class="dFlex">

					<nav id="mainlnb_M">

						<h2>고객센터</h2>
						<ul>
							<li id="notice_lnb" class="main_MLi"><a
								href="/infoCenter/notice.jsp">공지사항</a></li>
							<li id="Q&A_lnb" class="main_MLi"><a
								href="/infoCenter/qna.jsp"> Q&A게시판</a></li>
							<li id="FAQ_lnb" class="main_MLi"><a
								href="/infoCenter/faq.jsp">FAQ게시판</a></li>
							<li id="inquire_lnb" class="main_MLi selected"><a
								href="/infoCenter/inquire.jsp">1:1문의</a></li>
						</ul>

					</nav>

				</div>

				<div id="contents">

					<h3>1:1문의하기</h3>

					<hr id="divisionline_main">

					<table id="inquireTbl">
						<tbody>
							<tr>
								<td>상품선택</td>
								<td><select id="selectinquire_g">
										<!--g=>goods -->
										<option>주문한 상품 없음</option>
										<option>미국산 소고기200g</option>
										<option>국산 이천쌀 맛味 10kg</option>
										<option>노르웨이산 연어150g</option>
								</select></td>
							</tr>
							<tr>
								<td>문의유형</td>
								<td><select class="selectinquire">
										<option>선택하세요</option>
										<option>취소 결제문의</option>
										<option>배송 문의</option>
										<option>상품 품질 문의</option>
										<option>오류/기타문의</option>
								</select> <select class="selectinquire">
										<option>선택하세요</option>
										<option>결제 내역확인</option>
										<option>결제방법</option>
										<option>취소/환불</option>

								</select></td>
							</tr>
							<tr>
								<td>문의내용</td>
								<td id="inquireText"><textarea></textarea></td>
							</tr>
							<tr>
								<td>파일 첨부</td>
								<td><input type="file"></td>
							</tr>
							<tr>
						</tbody>
					</table>

					<div id="inquire">
						<button type="reset">취소</button>
						<button type="submit">문의</button>
					</div>

				</div>
			</main>

		</form>

		<footer id="footer">

			<hr id="divisionline_footer">

		</footer>

		<jsp:include page="/ind/footerTmp.jsp" />

	</div>
</body>
</html>