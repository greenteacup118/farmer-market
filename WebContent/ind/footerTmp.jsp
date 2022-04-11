<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>footerTmp</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style/style_ind.css">
</head>
<body>
	<div id="footer">
		<div id="footer-content" class="dFlex">
			<!-------------- footer 왼쪽 : 고객센터 -------------->
			<div id="footer-left">
				<table>
					<tbody>
						<tr>
							<td id="td-title" colspan="2">고객행복센터</td>
						</tr>
						<tr>
							<td id="callNum">1644-1106</td>
							<td><div class="div-bold">365고객센터</div>
								<div>오전 7시 - 오후 7시</div></td>
						</tr>

						<tr>
							<td><div class="button"><a href="#">카카오톡 문의</a></div></td>
							<td>
								<div class="div-bold">365고객센터</div>
								<div>오전 7시 - 오후 7시</div>
							</td>
						</tr>

						<tr>
							<td>
								<div class="button">
									<a href="/infoCenter/inquire.jsp">1:1 문의</a>
								</div>
							</td>
							<td>
								<div class="div-bold">24시간 접수 가능</div>
								<div>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</div>
							</td>
						</tr>

						<tr>
							<td><div class="button"><a href="#">대량주문 문의</a></div></td>
							<td><div>비회원의 경우 메일로 문의 바랍니다.</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- div#footer-left -->
			<!-------------- footer 오른쪽 : 회사소개 -------------->
			<div id="footer-right">
				<div id="footer-List">
					<ul id="footerUl" class="dFlex">
						<li class="footerLi"><a href="#">회사소개</a></li>
						<li class="footerLi"><a href="#">회사소개영상</a></li>
						<li class="footerLi"><a href="#">인재채용</a></li>
						<li class="footerLi"><a href="#">이용약관</a></li>
						<li class="footerLi"><a href="#">개인정보처리방침</a></li>
						<li class="footerLi"><a href="#">이용안내</a></li>
					</ul>
				</div>
				<!-- div#footer-List -->
				<div id="footer-explain">
					<ul id="explainUl">
						<li class="explainLi">법인명 (상호):주식회사 FarmerMarket</li>
						<li class="explainLi">사업자등록번호:123-12-12345</li>
						<li class="explainLi">통신판매업:제 2022-서울신촌-22410 호</li>
						<li class="explainLi">입점문의:입점문의 | 마케팅제휴:farmer@market.com</li>
						<li class="explainLi">채용문의:farmer@market.com</li>
						<li class="explainLi">팩스:123-1234-1234/이메일:farmer@market.com</li>
						<li class="explainLi">대량주문문의:farmer@market.com</li>
					</ul>
				</div>
				<!-- div#footer-explain -->
				<div id="SNS">
					<a href="#">
						<img src="../images/sns/facebook.png" alt="snsIcon" />
					</a>
					<a href="#">
						<img src="../images/sns/instagram.png" alt="snsIcon" /> 
					</a>
					<a href="#">
						<img src="../images/sns/kakaotalk.png" alt="snsIcon" />
					</a>
					<a href="#">
						<img src="../images/sns/naverblog.png" alt="snsIcon" />
					</a>
					<a href="#">
						<img src="../images/sns/twitter.png" alt="snsIcon" />
					</a>
					<a href="#">
						<img src="../images/sns/youtube.png" alt="snsIcon" />
					</a>
				</div>
				<!-- div#SNS -->
			</div>
			<!-- div#footer-right -->
		</div>
		<!-- div#footer-content -->
	</div>
	<!-- div#footer -->

	<div id="footer-copyright" class="dFlex">
		<p>Farmer Market에서 판매되는 상품 중에는 입점한 개별 판매자가 판매하는 마켓플레이스 상품이 포함되어
			있습니다.</p>
		<p>마켓플레이스 상품의 경우 통신판매중개자로서 통신판매의 당사자가 아닙니다. Farmer Market은 해당 상품의
			주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.</p>
		<div>&copy;Farmer Market CORP.ALL RIGHTS RESERVED</div>
	</div>
	<!-- div#footer-copyright -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_ind.js"></script>
</body>
</html>