<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<!-- favicon 설정 -->
<link rel="icon" type="image/x-icon" href="../images/favicon.png">
<!-- fontawesome 설정 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style/style_member.css">
</head>
<body>
	<div id="wrap">
		<jsp:include page="/ind/headerTmp.jsp" />
		<!-- 회원가입 container -->
		<main id="main">
			<div id="form-title">
				<p>회원가입</p>
				<div id="form-info">
					<span class="necessary"></span> 필수입력사항
				</div>
			</div>
			<!-- div#form-title -->

			<!---------------------- 회원가입 폼 시작 ---------------------->
			<form method="post" id="memberFrm" action="/member/memberProc.jsp">
				<table>
					<tbody>
						<!------------------- 아이디 시작 ------------------->
						<tr>
							<td class="necessary">아이디</td>
							<td><input id="idInput" type="text" name="uId"
								placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"> <input
								type="hidden" id="idChkTorF" value="0"></td>
							<td>
								<button id="idBtn" type="button">중복확인</button>
							</td>
						</tr>
						<tr id="afterId">
							<td>&nbsp;</td>
							<td>
								<div>6자 이상의 영문 혹은 영문과 숫자를 조함</div>
								<div>아이디 중복확인</div>
							</td>
						</tr>
						<!------------------- 아이디 끝 ------------------->
						<!------------------- 비밀번호 시작 ------------------->
						<tr>
							<td class="necessary">비밀번호</td>
							<td><input id="pwInput" type="password" name="uPw"
								placeholder="비밀번호를 입력해주세요"></td>
							<td>
								<button class="pwBtn" type="button">
									<i class="fa fa-eye-slash"></i>
								</button>
							</td>
						</tr>
						<tr id="afterPw">
							<td>&nbsp;</td>
							<td>
								<div>10자 이상 입력</div>
								<div>영문/숫자/특수문자(공백제외) 만 허용하며, 2개 이상 조합</div>
							</td>
						</tr>
						<!------------------- 비밀번호 끝 ------------------->
						<!------------------- 비밀번호 확인 시작 ------------------->
						<tr>
							<td class="necessary">비밀번호확인</td>
							<td><input id="pwChkInput" type="password"
								placeholder="비밀번호를 한번 더 입력해주세요"></td>
							<td>
								<button class="pwChkBtn" type="button">
									<i class="fa fa-eye-slash"></i>
								</button>
							</td>
						</tr>
						<tr id="afterPwChk">
							<td>&nbsp;</td>
							<td>
								<div>동일한 비밀번호를 입력해주세요.</div>
							</td>
						</tr>
						<!------------------- 비밀번호 확인 끝 ------------------->
						<!------------------- 이름 시작 ------------------->
						<tr>
							<td class="necessary">이름</td>
							<td><input id="nameInput" type="text" name="uName"
								placeholder="이름을 입력해주세요"></td>
						</tr>
						<!------------------- 이름 끝 ------------------->
						<!------------------- 이메일 시작 ------------------->
						<tr>
							<td class="necessary">이메일</td>
							<td><input id="emailInput" type="text" name="uEmail"
								placeholder="예:farmermarket@fmket.com"></td>
							<td>
								<!-- <button id="emailBtn" type="button">중복확인</button> -->
							</td>
						</tr>
						<!------------------- 이메일 끝 ------------------->
						<!------------------- 휴대폰 시작 ------------------->
						<tr>
							<td class="necessary">휴대폰</td>
							<td><input id="phoneInput" type="text" name="uPhone"
								placeholder="숫자만 입력해주세요"></td>
							<td>
								<button id="phoneBtn" type="button">휴대폰 인증하기</button>
							</td>
						</tr>
						<tr id="afterPhone">
							<td>&nbsp;</td>
							<td>
								<div>휴대폰 인증이 완료되었습니다.</div>
							</td>
						</tr>
						<!------------------- 휴대폰 끝 ------------------->
						<!------------------- 주소 시작 ------------------->
						<!-- 주소검색 버튼 클릭 전 -->
						<tr class="beforeAddr">
							<td class="necessary">주소</td>
							<td>
								<button class="addrBtn" type="button" onclick="findAddr()">
									<i class="fa fa-fw fa-search"></i>주소 검색
								</button>
							</td>
							<td>&nbsp;</td>
						</tr>
						<!-- 주소검색 버튼 클릭 후 -->
						<tr class="afterAddr">
							<td class="necessary">주소</td>
							<td><input id="addrInput1" type="text" readonly></td>
							<td>
								<button class="addrBtn" type="button" onclick="findAddr()">
									<i class="fa fa-fw fa-search"></i> 재검색
								</button>
							</td>
						</tr>
						<tr class="afterAddr">
							<td></td>
							<td><input id="addrInput2" type="text"
								placeholder="나머지 주소를 입력해주세요"> <input type="hidden"
								id="addr" name="uAddr"></td>
						</tr>
						<tr class="afterAddr">
							<td>&nbsp;</td>
							<td>
								<div>배송지에 따라 상품 정보가 달라질 수 있습니다.</div>
							</td>
						</tr>
						<!------------------- 주소 끝 ------------------->
						<!------------------- 성별 시작 ------------------->
						<tr>
							<td>성별</td>
							<td><label for="genderMInput"> <input
									id="genderMInput" type="radio" name="uGender" value="m">
									남자
							</label> <label for="genderWInput"> <input id="genderWInput"
									type="radio" name="uGender" value="w"> 여자
							</label> <label for="genderNInput"> <input id="genderNInput"
									type="radio" name=uGender value="0"> 선택안함
							</label></td>
						</tr>
						<!------------------- 성별 끝 ------------------->
						<!------------------- 생년월일 시작 ------------------->
						<tr>
							<td>생년월일</td>
							<td>
								<div id="birthArea">
									<input class="birthInput" type="text" maxlength="4"
										placeholder="YYYY"> <span>/</span> <input
										class="birthInput" type="text" maxlength="2" placeholder="MM">
									<span>/</span> <input class="birthInput" type="text"
										maxlength="2" placeholder="DD"> <input type="hidden"
										id="birth" name="uBirth" />
								</div>
							</td>

						</tr>
						<!------------------- 성별 끝 ------------------->

					</tbody>
				</table>
				<!------------------- 유효성 검사 참고 hidden input 시작 ------------------->
				<div id="formRes">
					<input id="idRes" type="hidden" value="false"> <input
						id="idChkRes" type="hidden" value="false"> <input
						id="pwRes" type="hidden" value="false"> <input
						id="pwChkRes" type="hidden" value="false"> <input
						id="nameRes" type="hidden" value="false"> <input
						id="emailRes" type="hidden" value="false"> <input
						id="phoneRes" type="hidden" value="false"> <input
						id="addrRes" type="hidden" value="false">
				</div>
				<!------------------- 유효성 검사 참고 hidden input 끝 --------------------->
			</form>
			<!-- form#memberFrm -->
			<!---------------------- 회원가입 폼 끝 ------------------------>

			<!---------------------- 이용약관동의 시작 ------------------------>
			<table id="agreeTbl">
				<tbody>
					<tr>
						<td id="title" class="necessary">이용약관동의</td>
						<td><input type="checkbox" id="chkAll"></td>
						<td>
							<p id="allAgree">전체 동의합니다</p>
						</td>
					</tr>
					<tr>
						<td>
							<button id="agreeBtn" type="button">약관보기 〉</button>
							<div id="joinAgreement">
								<jsp:include page="/member/joinAgreement.jsp" />
							</div>
						</td>
						<td>&nbsp;</td>
						<td>선택항목에 동의하지 않는 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</td>
					</tr>

					<tr class="oneAgree">
						<td>&nbsp;</td>
						<td><input type="checkbox"></td>
						<td>이용약관 동의 <span>(필수)</span></td>
					</tr>

					<tr class="oneAgree">
						<td>&nbsp;</td>
						<td><input type="checkbox"></td>
						<td>개인정보 수집 및 이용 동의 <span>(필수)</span></td>
					</tr>

					<tr class="oneAgree">
						<td>&nbsp;</td>
						<td><input type="checkbox"></td>
						<td>개인정보 수집 및 이용 동의 <span>(선택)</span></td>
					</tr>

					<tr class="oneAgree">
						<td>&nbsp;</td>
						<td><input type="checkbox"></td>
						<td>무료배송, 할인쿠폰 등 혜택/정보 수신 동의 <span>(선택)</span></td>
					</tr>

					<tr class="oneAgree">
						<td>&nbsp;</td>
						<td><input type="checkbox"></td>
						<td>본인은 만 14세 이상입니다. <span>(필수)</span></td>
					</tr>
				</tbody>
			</table>

			<!---------------------- 이용약관동의 끝 ------------------------>
		</main>
		<div id="btnArea">
			<button id="memberBtn" type="button">가입하기</button>
		</div>
		<jsp:include page="/ind/footerTmp.jsp" />
	</div>
	<!--div#wrap-->
	<!---------------------------카카오 주소검색 API 시작  ---------------------------------------->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!---------------------------카카오 주소검색 API 끝  ------------------------------------------>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_member.js"></script>
</body>
</html>