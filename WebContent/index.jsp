<%@page import="pack_Goods.GoodsBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FarmerMarket</title>
<!-- favicon 설정 -->
<link rel="icon" type="image/x-icon" href="../images/favicon.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style/style_Common.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/ind/headerTmp.jsp" />

		<main id="index">
			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- ///////////////////////////////////////메인 이미지 슬라이드 시작////////////////////////////////////////////////// -->
			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<div id="mainSlide">

				<!-- Slideshow container -->
				<div class="slideshow-container">

					<!-- Full-width images with number and caption text -->
					<div class="mySlides fade">
						<div class="numbertext">1 / 3</div>
						<a href="#"><img src="/images/mainSlide/mainSlide_img1.png"
							style="width: 100%"></a>
						<div class="text"></div>
					</div>

					<div class="mySlides fade">
						<div class="numbertext">2 / 3</div>
						<a href="#"><img src="/images/mainSlide/mainSlide_img2.png"
							style="width: 100%"> </a>
						<div class="text"></div>
					</div>

					<div class="mySlides fade">
						<div class="numbertext">3 / 3</div>
						<a href="#"><img src="/images/mainSlide/mainSlide_img3.png"
							style="width: 100%"> </a>
						<div class="text"></div>
					</div>

					<!-- Next and previous buttons -->
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
						class="next" onclick="plusSlides(1)">&#10095;</a>
				</div>
				<br>

				<!-- The dots/circles -->
				<div style="text-align: center">
					<span class="dot" onclick="currentSlide(1)"></span> <span
						class="dot" onclick="currentSlide(2)"></span> <span class="dot"
						onclick="currentSlide(3)"></span>
				</div>
			</div>
			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- ///////////////////////////////////////메인 이미지 슬라이드 끝//////////////////////////////////////////////////// -->
			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- ///////////////////////////////////////////메인 상품리스트 시작////////////////////////////////////////////////// -->
			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<%
			//M : 육류 , S : 해산물 , V : 채소 , F : 과일
			String[] category = { "M", "S", "V", "F" };
			String[] title = { "육류", "해산물", "채소", "과일" };
			String[] subTitle = { " : 이 달의 핫딜", " : 이 달의 추천 품목" };
			String orderby = "";

			for (int i = 0; i < category.length; i++) {
				String target = category[i];

				for (int j = 0; j < 2; j++) {
					if (j == 0) {
				orderby = " order by goodsPrice ";

					} else {
				orderby = " order by goodsPrice DESC ";

					}

					//ArrayList 반복 시작
					List<GoodsBean> list = goodsDao.selectGoodsList(category[i], orderby);
			%>
			<!-- ///////////////////////////// 반복되는 부분 시작 /////////////////////////////-->
			<!-- ///////////////////////////// 반복되는 부분 시작 /////////////////////////////-->
			<!-- ///////////////////////////// 반복되는 부분 시작 /////////////////////////////-->

			<div class="mainList">
				<div class="goods_title">
					<a href="#"><%=title[i]%><%=subTitle[j]%></a>
				</div>
				<div class="goods_container dFlex">

					<%
					for (int k = 0; k < list.size(); k++) {
						GoodsBean gBean = list.get(k);
						// sql로 가져오는 필수 값 : 제품코드, 제품이미지, 제품이름, 제품소제목, 제품할인율
						String goodsCode = gBean.getGoodsCode();
						String goodsImg = gBean.getGoodsImg();
						String goodsName = gBean.getGoodsName();
						String goodsCatch = gBean.getGoodsCatch();
						int goodsPrice = gBean.getGoodsPrice();
						int eventRate = gBean.getEventRate();

						// 할인 금액
						int salePrice = goodsPrice - (goodsPrice * eventRate / 100);
					%>

					<div class="goods">
						<div class="goodsImg">
							<img src="/images<%=goodsImg%>" alt="상품이미지">
						</div>

						<div class="goodsBtn">
							<i class="fa fa-fw fa-shopping-cart"></i>
						</div>

						<div class="hidden">
							<input type="hidden" value="<%=goodsCode%>">
						</div>
						<div class="goodsName">
							[<%=title[i]%>]
							<%=goodsName%></div>
						<div class="goodsCatch"><%=goodsCatch%></div>
						<%
						if (eventRate != 0) {
						%>
						<div class="goodsPrice">
							<span class="salePer"><%=eventRate%>%</span> <span class="price"><%=salePrice%></span>
						</div>
						<div class="beforePrice"><%=goodsPrice%></div>
						<%
						} else if (eventRate == 0) {
						%>
						<div class="goodsPrice"><span class="price"><%=goodsPrice%></span></div>
						<%
						}
						%>
					</div>
					<!-- div#goods -->
					<%
					} // dao 반복문
					%>
					<!-- ///////////////////////////// 반복되는 부분 끝 /////////////////////////////-->
					<!-- ///////////////////////////// 반복되는 부분 끝 /////////////////////////////-->
					<!-- ///////////////////////////// 반복되는 부분 끝 /////////////////////////////-->


				</div>
				<!-- div#goods_container -->
			</div>
			<!-- div#mainList -->
			<%
			} //subtitle 반복문
			} // category 반복문
			%>


			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- ///////////////////////////////////////////메인 상품리스트 끝//////////////////////////////////////////////////// -->
			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		</main>

		<jsp:include page="/ind/footerTmp.jsp" />
	</div>
	<!--div#wrap-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>