<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String uId_Session = (String) session.getAttribute("uId_Session");
String goodsCode = request.getParameter("goodsCode");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 후기 등록하기</title>
<link rel="stylesheet" href="/style/style_GoodsDetail.css">
</head>
<body>
	<div id="commentPage">
		<div class="dimmed">
			<div class="popup">
				<div class="title dFlex">
					<p>상품 후기작성하기</p>
				</div>
				<div class="content">
					<form id="goodsCommentFrm" enctype="multipart/form-data" method="post" action="/goods/updateCommentBBSProc.jsp?goodsCode=<%=goodsCode%>">
						<table id="commentTbl">
							<tr>
								<td>&nbsp;</td>
								<td id="info">
									<ul>
										<li>* 상품 후기 작성 시, 수령하신 상품 이미지를 함께 등록해주세요</li>
										<li>* 배송관련, 주문(취소/교환/환불) 관련 문의 및 요청사항은 1:1 문의에 남겨주세요.</li>
										<li>* 전화번호, 이메일, 주소, 계좌번호 등 상세 개인정보를 작성하지 않도록 주의해주세요.</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td>제목 <input id="goodsCode" type="hidden" name="goodsCode"
									value="<%=goodsCode%>">
								</td>
								<td id="tdTitle"><input type="text"
									placeholder="제목을 입력해주세요" name="title"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td id="tdContent"><textarea name="content"
										placeholder="내용을 입력해주세요" wrap="hard"></textarea></td>
							</tr>
							<tr id="fileTr">
								<td>파일 첨부</td>
								<td><input type="file" name="file" id="fName"></td>
							</tr>
							<tr>
								<td id="tdComentBtn" colspan="2"><button id="cancelBtn"
										type="button">취소</button>
									<button id="registerBtn" type="button">등록</button></td>
							</tr>

						</table>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!--div#wrap-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>