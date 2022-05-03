<%@page import="java.util.List"%>
<%@ page import="pack_MyPage.GoodsQnABean"%>
<%@ page import="pack_MyPage.GoodsCommentsBean"%>
<%@ page import="pack_Goods.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao" scope="request" />
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<%
request.setCharacterEncoding("UTF-8");

String uId = (String) session.getAttribute("uId_Session");

String goodsCode = (String) request.getParameter("goodsCode");
GoodsBean gBean = goodsDao.selectGoodsOne(goodsCode);

// 장바구니 중복여부 -> true : 사용 가능, false : 사용 불가(중복)
boolean result = goodsDao.checkBasket(goodsCode);
// 찜한목록 중복여부 -> true : 사용 가능, false : 사용 불가(중복)
boolean wishListResult = myPageDao.checkWish(goodsCode);

char category = goodsCode.charAt(0);
String cate = "";
if (category == 'M') {
	cate = "육류";
} else if (category == 'S') {
	cate = "해산물";
} else if (category == 'V') {
	cate = "채소";
} else if (category == 'F') {
	cate = "과일";
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/style/style_Template.css">
<link rel="stylesheet" href="/style/style_GoodsDetail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_goodsDetail.js"></script>
</head>
<body>
	<div id="wrap">

		<!-- 헤더템플릿 시작 -->
		<%@ include file="/ind/headerTmp.jsp"%>
		<!--  헤더템플릿 끝 -->

		<hr class="sepLine">



		<main id="main" class="dFlex">


			<!-- ###### 사진 및 가격 표시 ########### -->

			<div id="goods_wrap">

				<div id="goods_detail" class="dFlex">

					<div id="detailImg">
						<img src="/images<%=gBean.getGoodsImg()%>"
							alt="<%=gBean.getGoodsName()%>">
					</div>

					<form action="/goods/goods_basketProc.jsp" id="basketFrm"
						method="get">
						<div id="detail_info">

							<!-- ##### 가격테이블 ######-->
							<table>
								<tbody>
									<tr>
										<td id="hiddenTd"><input type="hidden"
											value="<%=goodsCode%>"></td>
									</tr>
									<tr>
										<td colspan="2" class="tdLine">
											<h1>
												[<%=cate%>]
												<%=gBean.getGoodsName()%>
												<%=gBean.getGoodsWeight()%>
												(<%=gBean.getPackType()%>)
											</h1>
										</td>
									</tr>
									<tr>
										<td colspan="2" id="goods_catch" class="goods_txt tdLine">
											<%=gBean.getGoodsCatch()%>
										</td>
									</tr>
									<%
									int goodsPrice = gBean.getGoodsPrice();
									int eventRate = gBean.getEventRate();

									int salePrice = goodsPrice - goodsPrice * eventRate / 100;
									if (eventRate > 0) {
									%>
									<tr>
										<td colspan="2" class="goods_price price hidPrice"><%=goodsPrice%></td>
									</tr>

									<tr>
										<td colspan="2" class="hPrice salePrice"><%=salePrice%></td>
									</tr>
									<%
									} else {
									%>
									<tr>
										<td colspan="2" class="goods_price price"><%=goodsPrice%></td>
									</tr>
									<%
									}
									%>
									<tr>
										<td class="goods_txt tdLine">판매단위</td>
										<td class="tdLine"><%=gBean.getUnitType()%></td>
									</tr>
									<tr>
										<td class="goods_txt">중량/용량</td>
										<td><%=gBean.getGoodsWeight()%></td>
									</tr>
									<tr>
										<td class="goods_txt">배송구분</td>
										<td><%=gBean.getDeliType()%></td>
									</tr>
									<tr>
										<td class="goods_txt">포장타입</td>
										<td><%=gBean.getPackType()%></td>
									</tr>
									<tr>
										<td class="goods_txt">구매수량</td>
										<td>
											<div class="cntBtn">
												<button type="button" id="cntMinus">-</button>
												<input type="text" name="goodsCnt" value="1" readonly>
												<button type="button" id="cntPlus">+</button>
											</div>
										</td>
									</tr>
									<tr>
										<%
										if (eventRate > 0) {
										%>
										<td colspan="2" id="totalPrice">총 상품금액 : <span
											class="salePrice"></span> <input type="hidden"
											value="<%=salePrice%>" />
										</td>
										<%
										} else {
										%>
										<td colspan="2" id="totalPrice">총 상품금액 : <span
											class="goods_price price"></span> <input type="hidden"
											value="<%=gBean.getGoodsPrice()%>" />
										</td>
										<%
										}
										%>
									</tr>
									<tr>
										<td class="goods_btnArea">
											<button id="wishListBtn" type="button">
												<i class="fa fa-fw fa-heart"></i>
											</button>
										</td>
										<td class="goods_btnArea"><a href="#" id="basketA">
												<button id="basketBtn" type="button">장바구니 담기</button> <input
												type="hidden" value="<%=uId%>" name="uId_Session"> <input
												type="hidden" value="<%=result%>"> <input
												type="hidden" value="<%=wishListResult%>">
										</a></td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" value="<%=eventRate%>">
						</div>
						<!-- div#detail_info -->
						<input type="hidden" name="goodsCode" value="<%=goodsCode%>">
					</form>

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
						<img src="/images<%=gBean.getContentImg1()%>" alt="" /> <img
							src="/images<%=gBean.getContentImg2()%>" alt="" /> <img
							src="/images<%=gBean.getContentImg3()%>" alt="" />
					</div>
					<!-- div#goods_detailInfo -->

					<hr id="topCen" class="sepLine">

					<!-- ####고객 센터 안내 ###### -->

					<div id="goods_center">
						<h1>고객행복센터</h1>
						<p>
							<span>궁금하신 점이나 서비스 이용에 불편하신 점이 있으신가요?</span><br> <br>
							문제가 되는 부분을 사진으로 찍어 아래 중 편하신 방법으로 접수해 주시면 빠르게 도와드리겠습니다.
						</p>

						<div id="goods_inquiry" class="dFlex">
							<div class="inquiryway">
								<span>| 전화 문의 1644-1107</span> <br> <br>
								<p>오전 7시~오후 7시(연중무휴)</p>
							</div>
							<div class="inquiryway">
								<span>| 카카오톡 문의</span> <br> <br>
								<p>오전 7시~오후 7시(연중무휴)</p>
								<br> <br>
								<p class="add_guide">
									카카오톡에서'FarmerMarket'검색 후<br> 대화창에 문의 및 불편사항을<br>
									남겨주세요.
								</p>
							</div>
							<div class="inquiryway">
								<span>| 홈페이지 문의</span> <br> <br>
								<p>
									24시간 접수가능<br> 로그인>마이페이지>1:1문의
								</p>
								<br> <br>
								<p class="add_guide">
									고객센터 운영 시간에 순차적으로<br> 답변해드리겠습니다.
								</p>
							</div>
						</div>
						<!-- div#goods_inquiry -->

						<hr id="topRev" class="sepLine">

						<!--########  후기 게시판 #########-->
						<table id="review">
							<thead>
								<tr>
									<th colspan="4" class="reviewHead"><span>PRODUCT
											REVIEW</span> <br> <br>
										<p>- 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당
											게시판으로 이동될 수 있습니다.</p>
										<p>
											- 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이페이지 내 <span>1:1문의</span>에
											남겨주세요.
										</p></th>

								<th class="reviewHead"></th>
								</tr>
								<tr>
									<th class="thTit">번호</th>
									<th class="thTit">제목</th>
									<th class="thTit">작성자</th>
									<th class="thTit">작성일</th>
									<th class="thTit">조회</th>
								</tr>
							</thead>
							<tbody>
								<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								<!-- //////////////////////////////////////////후기게시판 반복 시작////////////////////////////////////////////// -->
								<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								<%
								List<GoodsCommentsBean> list = goodsDao.selectGoodsCmtList(goodsCode);

								if (list.size() == 0) {
								%>
								<tr>
									<td id="notFoundTd" colspan="5">아직 작성된 후기가 없습니다.</td>
								</tr>
								<%
								} else {
								for (int i = 0; i < list.size(); i++) {
									GoodsCommentsBean cBean = list.get(i);
									String fileName = cBean.getFileRName_c();
								%>
								<tr class="hiddenRivewTitle">
									<td><%=cBean.getNo()%></td>
									<td><%=cBean.getTitle_c()%></td>
									<td><%=cBean.getuId()%></td>
									<td><%=cBean.getWriteTime_c()%></td>
									<td id="vCnt"><%=cBean.getView_cnt_c()%></td>
								</tr>
								<tr class="hiddenTr">
									<td colspan="5" class="hiddenRivew">
										<div>
											<input type="text" readonly value="<%=cBean.getTitle_c()%>">
										</div> <%
 if (fileName != null) {
 %>
										<div class="img">
											<img src="/fileUpload/<%=fileName%>" alt="후기 이미지" />
										</div> <%
 }
 %>
										<div>
											<textarea wrap="hard" readonly><%=cBean.getContetns_c()%></textarea>
										</div>
									</td>
								</tr>
								<%
								}
								}
								%>
								<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								<!-- //////////////////////////////////////////후기게시판 반복 끝//////////////////////////////////////////////// -->
								<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							</tbody>
							<tfoot>
								<tr>
									<td colspan="5" id="reviewBtnArea"><button type="button"
											id="reviewBtn">후기쓰기</button></td>
								</tr>
								<tr>
									<td colspan="5">
										<div class="pageBtn">
											<button type="button">&lt;</button>
											<button type="button">1</button>
											<button type="button">&gt;</button>
										</div>
									</td>
								</tr>
								<tr id="goodsCommentTr">
									<td id="goodsComment" data-position="1"><jsp:include
											page="/goods/goodsComment.jsp">
											<jsp:param name="goodsCode" value="<%=goodsCode%>" />
										</jsp:include></td>
								</tr>
							</tfoot>
						</table>
						<!-- ########후기 테이블 끝 ######### -->




						<hr id="topQna" class="sepLine">



						<!-- ######### Q&A 테이블 시작 ######### -->
						<table id="qaTbl">
							<thead>
								<tr>
									<th colspan="4"><span>PRODUCT Q&amp;A</span> <br> <br>
										<p>- 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당
											게시판으로 이동될 수 있습니다.</p>
										<p>
											- 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <span>1:1문의</span>에
											남겨주세요.
										</p></th>
								</tr>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<!-- /////////////////////////////////////// 반복문 시작 /////////////////////////////////////// -->
								<%
								List<GoodsQnABean> qList = goodsDao.selectGoodsQnaList(goodsCode);

								if (qList.size() == 0) {
								%>
								<tr>
									<td id="notFoundTd" colspan="4">아직 작성된 문의가 없습니다.</td>
								</tr>
								<%
								} else {
								for (int i = 0; i < qList.size(); i++) {
									GoodsQnABean qBean = qList.get(i);
									String fileName = qBean.getFileRName_q();
								%>
								<tr class="hiddenRivewTitle">
									<td><%=qBean.getNo()%></td>
									<td><%=qBean.getTitle_q()%></td>
									<td><%=qBean.getuId()%></td>
									<td><%=qBean.getWriteTime_q()%></td>
								</tr>
								<tr class="hiddenTr">
									<td colspan="4" class="hiddenRivew">
										<div class="customerQ">
											<h1>
												Q.
												<%=qBean.getTitle_q()%></h1>
											<%
											if (fileName != null) {
											%>
											<div class="img">
												<img src="/fileUpload/<%=fileName%>" alt="후기 이미지" />
											</div>
											<%
											}
											%>
											<textarea wrap="hard" readonly><%=qBean.getContetns_q()%></textarea>
										</div>
										<div class="managerA">
											<h1>A. 답변 준비중입니다.</h1>
											<p>
												안녕하세요. FarmerMarket 입니다 <br> 질문주신 내용을 바탕으로 답변을 준비중에
												있습니다. <br> 빠른 시일 안에 답변드리도록 하겠습니다.
											</p>
										</div>
									</td>
								</tr>
								<%
								}
								}
								%>
								<!-- /////////////////////////////////////// 반복문 끝 /////////////////////////////////////// -->
							</tbody>
							<tfoot>
								<tr>
									<td colspan="4"><button id="goodsQna" type="button">문의하기</button></td>
								</tr>
								<tr>
									<td id="goodsQna" data-position="0"><jsp:include
											page="/goods/goodsQna.jsp">
											<jsp:param name="goodsCode" value="<%=goodsCode%>" />
										</jsp:include></td>
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
		<%@ include file="/ind/footerTmp.jsp"%>
		<!-- 푸터템플릿 끝 -->

	</div>
	<!-- div#wrap -->
</body>
</html>