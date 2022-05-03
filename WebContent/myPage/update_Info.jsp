<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="mBean" class="pack_Member.MemberBean"/>
<jsp:useBean id="memDao" class="pack_Member.MemberDao"/>

<%
String uId_Session = (String) session.getAttribute("uId_Session");
if(uId_Session == null) {
	response.sendRedirect("/member/login.jsp");
}

// MemberBean의 값을 Dao 메서드를 활용해서 채우기
mBean = memDao.selectMemberOne(uId_Session);
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_MyPage.css">
<!---------------------------카카오 주소검색 API 시작  ---------------------------------------->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!---------------------------카카오 주소검색 API 끝  ------------------------------------------>
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_myPage.js"></script>

</head>
<body>
	<div id="wrap">
		<!-- 마이페이지를 누르면 제일 먼저 orderList 화면이 나와야 함 -->
		<jsp:include page="/ind/headerTmp.jsp" />
		<!-- LNB템플릿 영역 -->

		<main id="main" class="dFlex">

			<div id="mainlnb" class="dFlex">
				<nav id="mainlnb_M">
					<h2>마이 마켓</h2>
					<ul>
						<li class="main_MLi"><a href="/myPage/orderList.jsp">주문
								내역</a></li>
						<li class="main_MLi"><a href="/myPage/wishList.jsp">찜한 상품</a></li>
						<li class="main_MLi"><a href="/myPage/addrUpdate.jsp">배송지
								관리</a></li>
						<li class="main_MLi"><a href="/myPage/goodsComments.jsp">상품
								후기</a></li>
						<li class="main_MLi"><a href="/myPage/goodsQnA.jsp">상품 문의</a></li>
						<li class="main_MLi checked"><a href="#">개인 정보 수정</a></li>
						<li class="main_MLi"><a href="/myPage/withdraw_Info.jsp">회원
								탈퇴</a></li>
					</ul>
				</nav>
			</div>

			<div id="contentsArea">

				<div id="title_container" class="dFlex">
					<div id="title">
						<h2>회원 정보 수정</h2>
					</div>
				</div>
				<hr class="sepLine">
				<div id="contents">


					<form method="post" id="updateFrm" action="/member/updateProc.jsp">
						<table>
							<tbody>
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
										placeholder="이름을 입력해주세요" value="<%=mBean.getuName() %>"></td>
								</tr>
								<!------------------- 이름 끝 ------------------->
								<!------------------- 이메일 시작 ------------------->
								<tr>
									<td class="necessary">이메일</td>
									<td><input id="emailInput" type="text" name="uEmail"
										placeholder="예:farmermarket@fmket.com"
										 value="<%=mBean.getuEmail() %>"></td>
									<td>
										<!-- <button id="emailBtn" type="button">중복확인</button> -->
									</td>
								</tr>
								<!------------------- 이메일 끝 ------------------->
								<!------------------- 휴대폰 시작 ------------------->
								<tr>
									<td class="necessary">휴대폰</td>
									<td><input id="phoneInput" type="text" name="uPhone"
										placeholder="숫자만 입력해주세요" value="<%=mBean.getuPhone() %>"></td>
									<td></td>
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
										id="addr" name="uAddr" value="<%=mBean.getuAddr() %>"></td>
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
											id="genderMInput" type="radio" name="uGender" value="1" checked>
											남자
									</label> <label for="genderWInput"> <input id="genderWInput"
											type="radio" name="uGender" value="2"> 여자
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
												class="birthInput" type="text" maxlength="2"
												placeholder="MM"> <span>/</span> <input
												class="birthInput" type="text" maxlength="2"
												placeholder="DD"> <input type="hidden" id="birth"
												name="uBirth"  value="<%=mBean.getuBirth() %>">
										</div>
									</td>

								</tr>
								<!------------------- 성별 끝 ------------------->

							</tbody>
						</table>
						<!------------------- 유효성 검사 참고 hidden input 시작 ------------------->
						<div id="formRes">
							<input id="pwRes" type="hidden" value="false"> <input
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

					<div id="btnArea">
						<button id="updateBtn" type="button">회원 정보 수정</button>
					</div>

				</div>

			</div>
		</main>

		<jsp:include page="/ind/footerTmp.jsp" />

	</div>
</body>
</html>