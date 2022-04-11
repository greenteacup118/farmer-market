<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/style/style_Goods.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
</head>
<body>
  <div id="wrap">
       
		<!-- 헤더템플릿 시작 --> 
		<%@ include file="/ind/headerTmp.jsp" %>
		<!-- 헤더템플릿 끝 -->
		
		<main id="main">
	
			<!-- 상품 리스트 시작 -->
			
			<!-- ##### div#goodsList, 상품 목록 시작 ##### -->
			<hr class="sepLine">
			
			<h1 id="todayGoods">오늘의 품목</h1>
			
			<div id="goodsList" class="dFlex">
					<table>
						<tbody>
							<tr>
								<td class="goodsImg"><a href="#"><img src="/images/berry.jpg" alt="과일"></a></td>
							</tr>
							<tr>
								<td class="goodsTitle"><a href="#">[농부목장] 수입산 크랜베리 300g</a></td>
							</tr>
							<tr>
								<td class="goodsPrice"><a href="#">6,500원</a></td>
							</tr>
						</tbody>
					</table>
					
					<!-- DB 연결 후 지울 테이블 -->	
					<table>
						<tbody>
							<tr>
								<td class="goodsImg"><a href="#"><img src="/images/salmon.jpg" alt="과일"></a></td>
							</tr>
							<tr>
								<td class="goodsTitle"><a href="#">[어부마을] 수입산 연어 150g</a></td>
							</tr>
							<tr>
								<td class="goodsPrice"><a href="#">10,160원</a></td>
							</tr>
						</tbody>
					</table>
					
					<table>
						<tbody>
							<tr>
								<td class="goodsImg"><a href="#"><img src="/images/meat.jpg" alt="육류"></a></td>
							</tr>
							<tr>
								<td class="goodsTitle"><a href="#">[도축대장] 호주산 소고기 600g</a></td>
							</tr>
							<tr>
								<td class="goodsPrice"><a href="#">25,590원</a></td>
							</tr>
						</tbody>
					</table>
					<!-- DB 연결 후 지울 테이블 -->
			</div>
			<!--  div#goodsList, 상품 목록 끝 -->
			
			
			<!-- 상품 리스트 끝 -->
			<hr class="sepLine">
			
			
		</main>
		<!-- main#main -->
       
       <!-- 푸터템플릿 시작 -->
       <%@ include file="/ind/footerTmp.jsp" %>
        <!-- 푸터템플릿 끝 -->
        
   </div>
   <!-- div#wrap -->
</body>
</html>