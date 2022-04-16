<%@page import="java.util.Set"%>
<%@page import="pack_Goods.BasketBean"%>
<%@page import="pack_Member.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="pack_Goods.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uId_Session = (String)session.getAttribute("uId_Session");
%>

<jsp:useBean id="gBean" class="pack_Goods.GoodsDao" />
<jsp:useBean id="deliInfo" class="pack_Member.MemberDao" />


<%
request.setCharacterEncoding("UTF-8");


MemberBean uDeli = deliInfo.selectMemberOne(uId_Session);
String userDel = uDeli.getuAddr();
List<BasketBean> basketList = gBean.basketInfo(uId_Session);
// uId에 해당하는 데이터 반환
%>



<%

int toGoodsPrice = 0;


String goodsImg = null;
int goodsPrice = 0;
String goodsName = null;
String goodsWeight = null;
double eventRate = 0;
int eventPrice = 0;
int goodsCnt = 0;
int deliPrice = 3000;
%>


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
		
		<form action="/index.jsp" id=basketFrm>
			<main id="main">
				
				<h1>장바구니</h1>
				
				<!-- 장바구니 시작 -->
				<div id="contents">
				
					<div class="contents_modify">
						
						<table>
							<tbody>
								<tr>
									<td><input id="chkAll1" type="checkbox"></td>
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
			
							<%
							for(int i=0; i<basketList.size(); i++) {
								//System.out.println(i);
								BasketBean basketBean = basketList.get(i);
								
								
								String goodsCode = basketBean.getGoodsCode();
								goodsCnt = basketBean.getGoodsCnt();
								
								GoodsBean bean = gBean.basketTbl(goodsCode);
								
								
									goodsImg = bean.getGoodsImg();
									goodsPrice = bean.getGoodsPrice();
									goodsName = bean.getGoodsName();
									goodsWeight = bean.getGoodsWeight();
									eventRate = bean.getEventRate();
							
									// 최종 정보 확인용 계산
									toGoodsPrice += goodsPrice*goodsCnt;
									if(eventRate > 0) {								
										eventPrice += goodsPrice*goodsCnt*(eventRate/100);
									}
							
							
							
							%>
							<table class="myBasket">
								<tbody>
									<tr class="basketChk">
										<td><input type="checkbox"></td>
										<td class="gImg">
											<a href="#"><img src="/images<%=goodsImg %>" alt="<%=goodsName%>"></a>
											<input type="hidden" value="<%=goodsCode%>" name="goodsCode" >
										</td> 
										<!-- 이미지 클릭시 상품상세 페이지 이동 -->
										<td class="gName">
											<a href="#"><%=goodsName + " " + goodsWeight %></a>
										</td>
										<td>
											<div class="cntBtn">
												<button type="button" class="cntM">-</button>
												<input type="text" value="<%=goodsCnt %>" readonly>
												<button type="button" class="cntP">+</button>
											</div>
										</td>
										<td id="priceArea">
											<p class="price"><%=goodsPrice*goodsCnt %></p>
											<input type="hidden" value="<%=goodsPrice%>">
										<%if(eventRate>0) { %>
											<input type="hidden" value="<%=eventRate%>">
										<%} %>
										</td>
									</tr>
								</tbody>
							</table>
							<%} %>
							<!-- 하단 전체선택 / 선택삭제 버튼 영역 -->
							<div class="contents_modify">
								<table>
									<tbody>
										<tr>
											<td><input id="chkAll2" type="checkbox"></td>
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
								<p><%=userDel %></p>
							</div>
							<!-- div#basket_addr -->
							
							
							<!-- 가격 확인용 테이블 -->
							<div id="basket_pirce">
								<table>
									<tbody>
										<tr>
											<td>상품금액</td>
											<td id="toPrice" class="price"><%=toGoodsPrice%></td>
										</tr>
										<tr>
											<td>상품할인금액</td>
											<td id="ePrice" class="price"><%=eventPrice %></td>
										</tr>
										<tr>
											<td>배송비</td>
											<td id="deliPrice" class="price"><%=deliPrice %></td>
										</tr>
											
										<tr>
											<td>결제예정금액</td>
											<%int totalPrice = toGoodsPrice-eventPrice+3000; %>
											<td id="lastPrice" class="price"><%=totalPrice %></td>
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
		</form>
       
       <!-- 푸터템플릿 시작 -->
       <%@ include file="/ind/footerTmp.jsp" %>
        <!-- 푸터템플릿 끝 -->
        
   </div>
   <!-- div#wrap -->
</body>
</html>