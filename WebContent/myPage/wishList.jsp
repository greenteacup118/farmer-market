<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찜한 상품</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_MyPage.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_MyPage.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- 마이페이지를 누르면 제일 먼저 orderList 화면이 나와야 함 -->
		<jsp:include page="/ind/headerTmp.jsp" />
		<!-- LNB템플릿 영역 -->

		<main id="main" class="dFlex">

			<div id="mainlnb" class="dFlex">
				<nav id="mainlnb_M">
					<h2>마이 마켓</h2>
					<ul>
						<li class="main_MLi"><a href="/myPage/orderList.jsp">주문
								내역</a></li>
						<li class="main_MLi checked"><a href="#">찜한 상품</a></li>
						<li class="main_MLi"><a href="/myPage/addrUpdate.jsp">배송지
								관리</a></li>
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
						<h2>찜한 상품</h2>
					</div>
					<div id="subtitle">
						<p>*찜한 상품은 최대 100개까지 저장됩니다.</p>
					</div>

				</div>


				<hr class="sepLine">
				<div id="contents">


					<div id="wishListArea">
						<table id="wishListTbl">
							<tbody>
								<tr>
									<td><strong>이미지</strong></td>
									<td><strong>상품명</strong></td>
									<td><strong>가격</strong></td>
									<td><strong>장바구니 담기</strong></td>
									<td><strong>삭제</strong></td>
								</tr>
								<tr>
									<td><div id="images">이미지</div></td>
									<td>상품명</td>
									<td>1,000</td>
									<td> <button>담기</button></td>
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



			</div>




		</main>

		<jsp:include page="/ind/footerTmp.jsp" />

	</div>
</body>
</html>