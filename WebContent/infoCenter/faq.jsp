<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
					<ul>
						<li id="notice_lnb" class="main_MLi"><a
							href="/infoCenter/notice.jsp">공지사항</a></li>
						<li id="Q&A_lnb" class="main_MLi"><a
							href="/infoCenter/qna.jsp"> Q&A게시판</a></li>
						<li id="FAQ_lnb" class="main_MLi selected"><a
							href="/infoCenter/faq.jsp">FAQ게시판</a></li>
						<li id="inquire_lnb" class="main_MLi"><a
							href="/infoCenter/inquire.jsp">1:1문의</a></li>
					</ul>
					<form action="/infoCenter/qnq.jsp">
						<input type="hidden" value="member">
					</form>
				</nav>

			</div>

			<div id="contents">

				<h3>자주묻는 게시판</h3>

				<hr id="divisionline_main">

				<table id="FAQTbl">
					<tbody>
						<tr class="dropChk">
							<td class="Question"><span id="Q">Q.</span><span>상품을
									반품하고 싶어요 어떻게 하면 되나요?</span> <input id="dropBtn1" class="dropBtn"
								type="button" value="▼"></td>
                                    
						</tr>

						<tr id="cheked" class="False">
							<td><pre>■ 반품하기

1. 마이페이지 에서 주문목록 [반품신청] 클릭 > 반품 수량/반품사유 선택
2. 반품 상품의 [상품 회수 여부]선택
3. 판매자로 상품 도착 후 승인 > 반품완료

※ 반품비용을 제외한 환불예정금액은 반품접수 화면에서 확인 가능합니다.</pre></td>
						</tr>
						<tr class="dropChk">
							<td class="Question"><span id="Q">Q.</span><span>비밀번호가
									기억나지 않아요.</span> <input class="dropBtn" id="dropBtn2" type="button"
								value="▼"></td>
						</tr>

						<tr class="cheked">
							<td><pre>쿠팡의 회원 비밀번호는 암호화 저장되어 분실 시 찾아드릴 수 없습니다.
아래의 경로로 비밀번호를 재설정해 주시기 바랍니다.

■ 비밀번호 재설정하기
1. 쿠팡 로그인 화면에서  선택
2. 회원정보 확인: 이름, 아이디(이메일)입력
3. 비밀번호 찾는 방법 선택 (휴대폰 또는 이메일)
3-1. '휴대폰' 선택 시 등록된 휴대폰 번호로 인증완료 후, 새로운 비밀번호 설정
3-2. '이메일' 선택 시 이메일로 발송된 비밀번호 재설정 링크 선택하여 새로운 비밀번호 설정 (해당 링크는 1시간동안만 유효함)</pre>
							</td>
						</tr>

						<tr class="dropChk">
							<td class="Question"><span id="Q">Q.</span><span>반품
									신청을 철회하고 싶어요.</span> <input class="dropBtn" id="dropBtn3"
								type="button" value="▼"></td>
						</tr>

						<tr class="cheked">
							<td><pre>반품접수 후, 반품할 상품을 아직 보내지 않은 경우, 마이쿠팡에서 반품철회를 하실 수 있습니다.

■ 반품 철회하기[마이페이지>취소/반품/교환/환불내역]> 반품철회</pre></td>
						</tr>



					</tbody>
				</table>


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