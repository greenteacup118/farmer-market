<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/style/style_GoodsDetail.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script_goodsDetail.js"></script>
</head>
<body>
  <div id="wrap">
       
		<!-- 헤더템플릿 시작 -->
		<%@ include file="/ind/headerTmp.jsp" %>
		<!--  헤더템플릿 끝 -->
		
		<hr class="sepLine">
		
		
		
		<main id="main" class="dFlex">
		
		
			<!-- ###### 사진 및 가격 표시 ########### -->
			
			<div id="goods_wrap">
			
				<div id="goods_detail" class="dFlex">
				
					<div id="detailImg"><img src="/images/berry.jpg" alt="과일"></div>
					<div id="detail_info">
					
						<!-- ##### 가격테이블 ######-->
						<table>
							<tbody>
								<tr>
									<td colspan="2" class="tdLine">
										<h1>[농부목장] 수입산 크랜베리 300g</h1>
									</td>
								</tr>
								<tr>
									<td colspan="2" id="goods_catch" class="goods_txt tdLine">
										상큼하고 달콤한 크랜베리!
									</td>
								</tr>
								<tr>
									<td colspan="2" class="goods_price">6,500원</td>
								</tr>
								<tr>
									<td class="goods_txt tdLine">판매단위</td>
									<td class="tdLine">1팩</td>
								</tr>
								<tr>
									<td class="goods_txt">중량/용량</td>
									<td>300g내외</td>
								</tr>
								<tr>
									<td class="goods_txt">배송구분</td>
									<td>택배배송</td>
								</tr>
								<tr>
									<td class="goods_txt">포장타입</td>
									<td>냉장/스티로폼</td>
								</tr>
								<tr>
									<td class="goods_txt">구매수량</td>
									<td>
										<div class="cntBtn">
											<button type="button">-</button>
											<input type="text" value="1" readonly>
											<button type="button">+</button>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" id="totalPrice">
										총 상품금액 : <span class="goods_price">6,500원</span>
									</td>
								</tr>
								<tr>
									<td class="goods_btnArea">
										<a href="/myPage/wishList.jsp">
											<i class="fa fa-fw fa-heart"></i>
										</a>
									</td>
									<td class="goods_btnArea">
										<a href="/goods/goods_basket.jsp">
											<button type="button">장바구니 담기</button>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- div#detail_info -->
				</div>
				<!-- div#goods_detail -->
				
				<!-- #########큌메뉴########## -->
				<div id="goods_contents">
					<nav id="quickmenu">
						<ul class="dFlex">
							<li>상품설명</li>
							<li>고객센터</li>
							<li>후기</li>
							<li>문의</li>
						</ul>
					</nav>
					<!-- 페이지내 바로 이동 버튼 div#quickmenu -->
				
					
					<!--######## 상세설명 시작 ########## -->
						<div id="explain_goods">
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요<br>
						상세설명 내용을 입력해주세요
						</div>
						<!-- div#goods_detailInfo -->
						
						<hr id="topCen" class="sepLine">
						
						<!-- ####고객 센터 안내 ###### -->
						
						<div id="goods_center">
							<h1>고객행복센터</h1>
							<p>
								<span>궁금하신 점이나 서비스 이용에 불편하신 점이 있으신가요?</span><br><br>
								문제가 되는 부분을 사진으로 찍어 아래 중 편하신 방법으로 접수해 주시면 빠르게 도와드리겠습니다.
							</p>
							
							<div id="goods_inquiry" class="dFlex">
								<div class="inquiryway">
									<span>| 전화 문의 1644-1107</span>
									<br><br>
									<p>오전 7시~오후 7시(연중무휴)</p>
								</div>
								<div class="inquiryway">
									<span>| 카카오톡 문의</span>
									<br><br>
									<p>오전 7시~오후 7시(연중무휴)</p>
									<br><br>
									<p class="add_guide">
										카카오톡에서'FarmerMarket'검색 후<br>
										대화창에 문의 및 불편사항을<br>
										남겨주세요.
									</p>
								</div>
								<div class="inquiryway">
									<span>| 홈페이지 문의</span>
									<br><br>
									<p>
										24시간 접수가능<br>
										로그인>마이페이지>1:1문의
									</p>
									<br><br>
									<p class="add_guide">
										고객센터 운영 시간에 순차적으로<br>
										답변해드리겠습니다.
									</p>
								</div>
							</div>
							<!-- div#goods_inquiry -->
							
							<hr id="topRev" class="sepLine">
							
							<!--########  후기 게시판 #########-->
							<table id="review">
								<thead>
									<tr>
										<th colspan="5">
											<span>PRODUCT REVIEW</span>
											<select>
												<option>최근 등록일순</option>
												<option>조회많은순</option>
											</select>
										</th>
									</tr>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>4</td>
										<td>추천합니다</td>
										<td>최*빈</td>
										<td>2022-02-28</td>
										<td>152</td>
									</tr>
									<tr>
										<td>3</td>
										<td>신선해요</td>
										<td>김*영</td>
										<td>2022-01-15</td>
										<td>32</td>
									</tr>
									<tr>
										<td>2</td>
										<td>맛있어요</td>
										<td>송*호</td>
										<td>2021-09-05</td>
										<td>579</td>
									</tr>
									<tr>
										<td>1</td>
										<td>최고에요!</td>
										<td>조*정</td>
										<td>2021-07-12</td>
										<td>1469</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="5"><button type="button">후기쓰기</button></td>
									</tr>
									<tr>
										<td colspan="5">
											<button type="button">&lt;</button>
											<button type="button">1</button>
											<button type="button">&gt;</button>
										</td>
									</tr>
								</tfoot>
							</table>
							<!-- ########후기 테이블 끝 ######### -->
							
							<hr id="topQna" class="sepLine">
							
							<!-- ######### Q&A 테이블 시작 ######### -->
							<table id="qaTbl">
								<caption>
									<span>PRODUCT Q&amp;A</span>
								</caption>
								<thead>
									<tr>
										<td>제목</td>
										<td>작성자</td>
										<td>작성일</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>상품 상태에 관해 질문이 있습니다.</td>
										<td>이*유</td>
										<td>2022-03-23</td>
									</tr>
									<tr>
										<td>할인 기간에 대해서</td>
										<td>김*조</td>
										<td>2022-01-05</td>
									</tr>
									<tr>
										<td>환불</td>
										<td>허*수</td>
										<td>2021-08-27</td>
									</tr>
									<tr>
										<td>정기배송 신청 여부</td>
										<td>김*국</td>
										<td>2020-05-05</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="3"><button type="button">문의하기</button></td>
									</tr>
								</tfoot>
							</table>
							
						</div>
						<!-- 고객센터 안내, 후기, 문의게시판 div#goods_center -->
						
					</div>
					<!-- 상세설명 안내 시작 div#goods_contents -->
					
					
			</div>
			<!-- flex용 감싸기 div#goods_wrap -->
			
			
		</main>
		<!-- main#main -->
		
		<hr class="sepLine">
       
       <!-- 푸터템플릿 시작 -->
       <%@ include file="/ind/footerTmp.jsp" %>
       <!-- 푸터템플릿 끝 -->
        
   </div>
   <!-- div#wrap -->
</body>
</html>