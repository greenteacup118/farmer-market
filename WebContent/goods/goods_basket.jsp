<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/style/style_GoodsBasket.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script_goodsBasket.js"></script>
</head>
<body>
  <div id="wrap">
       
		<!-- 헤더템플릿 시작 --> 
		<%@ include file="/ind/headerTmp.jsp" %>
		<!-- 헤더템플릿 끝 -->
		
		<main id="main">
			
			<h1>장바구니</h1>
			
			<!-- 장바구니 시작 -->
			<div id="contents">
			
				<div class="contents_modify">
					<table>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td><span>전체선택</span></td>
								<td><span>|</span></td>
								<td><button type="button">선택삭제</button></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 전체선택, 선택삭제 div.contents_modify -->
				
				
				<!-- 장바구니에 담은 물품 확인 시작 -->
				<div id="basket_main" class="dFlex">
					<div id="basket_select">
						<table class="myBasket">
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<a href="#"><img src="/images/meat.jpg" alt="육류"></a>
									</td> 
									<!-- 이미지 클릭시 상품상세 페이지 이동 -->
									<td>
										<a href="#">[도축대장] 호주산 소고기 600g</a>
									</td>
									<td>
										<div class="cntBtn">
											<button type="button">-</button>
											<input type="text" value="1" readonly>
											<button type="button">+</button>
										</div>
									</td>
									<td>25,590원</td>
								</tr>
							</tbody>
						</table>
							<table class="myBasket">
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>
										<a href="#"><img src="/images/berry.jpg" alt="과일"></a>
									</td> 
									<!-- 이미지 클릭시 상품상세 페이지 이동 -->
									<td>
										<a href="#">[농부목장] 수입산 크랜베리 300g</a>
									</td>
									<td>
										<div class="cntBtn">
											<button type="button" id="cntM">-</button>
											<input type="text" value="1" readonly>
											<button type="button" id="cntP">+</button>
										</div>
									</td>
									<td>6,500원</td>
								</tr>
							</tbody>
						</table>
						<!-- css확인용 테이블 생성 -->
						
						<!-- 하단 전체선택 / 선택삭제 버튼 영역 -->
						<div class="contents_modify">
							<table>
								<tbody>
									<tr>
										<td><input type="checkbox"></td>
										<td>전체선택</td>
										<td>|</td>
										<td><button type="button">선택삭제</button></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- div.contents_modify -->
						
					</div>
					<!-- div#basket_select -->
					
					<!-- 장바구니 담은 물품 확인 끝 -->
					
					<!-- 배송지 및 가격 확인 시작 -->
					<div id="basket_info">
					
						<!-- 배송지 확인영역 -->
						<div id="basket_addr">
							<p>배송지</p>
							<p>서울 000구 000동 1234-12</p>
						</div>
						<!-- div#basket_addr -->
						
						
						<!-- 가격 확인용 테이블 -->
						<div id="basket_pirce">
							<table>
								<tbody>
									<tr>
										<td>상품금액</td>
										<td>10,160원</td>
									</tr>
									<tr>
										<td>상품할인금액</td>
										<td>0원</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>3000원</td>
									</tr>
									<tr>
										<td>결제예정금액</td>
										<td>13,160원</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- div#basket_price -->
						
						<!-- 주문버튼 영역 -->
						<div id="basket_purchase">
							<button type="button">주문하기</button>
						</div>
						<!-- div#basket_purchase -->
						
					</div>
					<!-- div#basket_info -->
					
					
					
				</div>
				<!-- div#basket_main -->
				
			
				
			
			
			</div>
			<!-- div#contents -->
			
			
			
		</main>
		<!-- main#main -->
       
       <!-- 푸터템플릿 시작 -->
       <%@ include file="/ind/footerTmp.jsp" %>
        <!-- 푸터템플릿 끝 -->
        
   </div>
   <!-- div#wrap -->
</body>
</html>