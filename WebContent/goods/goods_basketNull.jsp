<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/style/style_GoodsBasketNull.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
</head>
<body>
  <div id="wrap">
       
		<!-- 헤더템플릿 시작 --> 
		<%@ include file="/ind/headerTmp.jsp" %>
		<!-- 헤더템플릿 끝 -->
	
		<main id="main">	
			<div id="notice">
				<p>장바구니에 담긴 상품이 없습니다.</p>
				<button type=button>메인으로</button>
			</div>
		</main>
		
		<script>
			$("#notice button").click(function(){
				location.href = "/index.jsp";
			});
		</script>
	
	
       <!-- 푸터템플릿 시작 -->
       <%@ include file="/ind/footerTmp.jsp" %>
        <!-- 푸터템플릿 끝 -->
        
  	</div>
   <!-- div#wrap -->
</body>
</html>