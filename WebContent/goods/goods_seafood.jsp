<%@page import="java.util.Arrays"%>
<%@page import="java.util.Vector"%>
<%@page import="pack_Goods.GoodsBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="gBean" class="pack_Goods.GoodsDao" />

<%
List<GoodsBean> goodsList = gBean.goodsTbl();	// 상품관련데이터 반환용 메서드 실행
%>

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
    <script src="/script/script_goods.js"></script>
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
			
			<form action="goods_detailProc.jsp" id="codeFrm" method="get">
			<div id="goodsList" class="dFlex">
			
			<%
				String goodsCode = null;
				for(int i=0; i<goodsList.size(); i++) {
					
					GoodsBean goodsBean = goodsList.get(i);
					
					goodsCode = goodsBean.getGoodsCode(); 
					String goodsImg = goodsBean.getGoodsImg(); 
					String goodsName = goodsBean.getGoodsName();
					int goodsPrice = goodsBean.getGoodsPrice();
					
					
					
					if(goodsCode.contains("S") ) {
			%>
					<table class="goodsList">
						<tbody>
							<tr>
								<td class="goodsImg">
									<a href="#">
										<img src="/images<%=goodsImg %>" alt="<%=goodsName%>">
									</a>
								</td>
							</tr>
							<tr>
								<td class="goodsTitle"><a href="#"><%=goodsName %></a></td>
							</tr>
							<tr>
								<td class="goodsPrice price"><a href="#"><%=goodsPrice %></a></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="goodsCode" value="<%=goodsCode %>">
				<%
					}
				}%>			
			</div>
			<!--  div#goodsList, 상품 목록 끝 -->
			</form>
			
			
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