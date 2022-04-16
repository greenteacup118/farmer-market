<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배송지 관리</title>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_MyPage.css">
<!---------------------------카카오 주소검색 API 시작  ---------------------------------------->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!---------------------------카카오 주소검색 API 끝  ------------------------------------------>
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_MyPage.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- 마이페이지를 누르면 제일 먼저 orderList 화면이 나와야 함 -->
		<jsp:include page="/ind/headerTmp.jsp" />


		<main id="main" class="dFlex">

			<div id="mainlnb" class="dFlex">
				<nav id="mainlnb_M">
					<h2>마이 마켓</h2>
					<ul>
						<li class="main_MLi"><a href="/myPage/orderList.jsp">주문
								내역</a></li>
						<li class="main_MLi"><a href="/myPage/wishList.jsp">찜한 상품</a></li>
						<li class="main_MLi checked"><a href="#">배송지 관리</a></li>
						<li class="main_MLi"><a href="/myPage/goodsComments.jsp">상품
								후기</a></li>
						<li class="main_MLi"><a href="/myPage/goodsQnA.jsp">상품 문의</a></li>
						<li class="main_MLi"><a href="/myPage/update_Info.jsp">개인
								정보 수정</a></li>
						<li class="main_MLi"><a href="/myPage/withdraw_Info.jsp">회원
								탈퇴</a></li>
					</ul>
				</nav>
			</div>

			<div id="contentsArea">

				<div id="title_container" class="dFlex">
					<div id="title">
						<h2>배송지 관리</h2>
					</div>
					<div id="subtitle">
						<p>*배송지에 따라 상품정보 및 배송유형이 달라질 수 있습니다.</p>
					</div>

				</div>


				<hr class="sepLine">

				<div id="contents">
					<div id="addr"></div>
					<form method="post" id="memberFrm" action="/member/memberProc.jsp">
						<table>
							<tbody>
								<tr class="beforeAddr">

									<td rowspan="2" class="beforeAddrTd">
										<button class="addrBtn" type="button" onclick="findAddr()">
											<i class="fa fa-fw fa-search"></i>새 배송지 추가
										</button>
									</td>

								</tr>
								<!-- 주소검색 버튼 클릭 후 -->
								<tr class="afterAddr">
									<td></td>
									<td><input id="addrInput1" type="text" readonly></td>
									<td>
										<button class="addrBtn" type="button" onclick="findAddr()">
											<i class="fa fa-fw fa-search"></i> 재검색
										</button>
									</td>
								</tr>
								<tr class="afterAddr">
									<td></td>

									<td><input id="addrInput2" type="text"
										placeholder="나머지 주소를 입력해주세요"> <input type="hidden"
										id="addr" name="uAddr"></td>
									<td>
										<button class="addrBtn" type="button">등록</button>
									</td>
								</tr>
								<tr class="afterAddr">
									<td>&nbsp;</td>
									<td>
										<div>배송지에 따라 상품 정보가 달라질 수 있습니다.</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr class="sepLine2">
					<!------------------- 주소 끝 ------------------->
				</div>



				<div id="addrList">
					<table id="addrTbl" >
						<tbody>
							<tr>
								<td><strong>선택</strong></td>
								<td><strong>주소</strong></td>
								<td><strong>받으실 분</strong></td>
								<td><strong>삭제</strong></td>
							</tr>
							<tr>
								<td><i class="fa fa-check"></i></td>
								<td>서울특별시 강남구 테헨란로 133, 18층(역삼동)</td>
								<td>마켓컬리</td>
								<td>
									<button type = "button">
										<i class="fa fa-check"></i>
									</button>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>



			</div>




		</main>

		<jsp:include page="/ind/footerTmp.jsp" />

	</div>
</body>
</html>