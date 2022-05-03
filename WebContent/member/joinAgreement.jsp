<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이용약관 동의</title>
<link rel="stylesheet" href="/style/style_member.css">
</head>
<body>
	<div class="dimmed">
		<div class="popup">
			<div class="title dFlex">
				<p>이용약관 동의</p>
				<div class="cmd">
					<button class="button" type="button">Ｘ</button>
				</div>
			</div>
			<div class="content">
				<p>1. 이용약관 동의</p>
				<jsp:include page="/ind/agreement/personallInfoAgree.jsp" />

				<p>2. 개인정보 이용 동의</p>
				<jsp:include page="/ind/agreement/usingAgree.jsp" />

				<p>3. 개인정보 수집 동의</p>
				<jsp:include page="/ind/agreement/shopInfoAgree.jsp" />
			</div>
			<div class="cmd">
				<button type="button" class="button">닫기</button>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>