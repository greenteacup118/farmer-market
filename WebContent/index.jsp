<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FarmerMarket</title>
<!-- favicon 설정 -->
<link rel="icon" type="image/x-icon" href="../images/favicon.png">
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
				<div class="slideshow-container">

					<!-- Full-width images with number and caption text -->
					<div class="mySlides fade">
						<div class="numbertext">1 / 3</div>
						<img src="/images/mainSlide/mainSlide_img1.png" style="width: 100%">
						<div class="text"></div>
					</div>

					<div class="mySlides fade">
						<div class="numbertext">2 / 3</div>
						<img src="/images/mainSlide/mainSlide_img2.png" style="width: 100%">
						<div class="text"></div>
					</div>

					<div class="mySlides fade">
						<div class="numbertext">3 / 3</div>
						<img src="/images/mainSlide/mainSlide_img3.png" style="width: 100%">
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
			<!-- div#mainSlide -->
			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- ///////////////////////////////////////메인 이미지 슬라이드 끝//////////////////////////////////////////////////// -->
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