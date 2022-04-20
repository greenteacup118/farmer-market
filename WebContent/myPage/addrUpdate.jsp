<%@page import="pack_Member.MemberBean"%>
<%@page import="pack_MyPage.AddrBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<jsp:useBean id="memberDao" class="pack_Member.MemberDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId = (String) session.getAttribute("uId_Session");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>배송지 관리</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/style/style_MyPage.css">
<!---------------------------카카오 주소검색 API 시작  ---------------------------------------->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!---------------------------카카오 주소검색 API 끝  ------------------------------------------>
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script_myPage.js"></script>
<%
if (uId == null) {
%>
<script>
	alert("로그인 이후 사용 가능합니다.");
	location.href = "/member/login.jsp";
</script>
<%
}
%>
</head>
<body>
	<div id="wrap">
		<!-- 마이페이지를 누르면 제일 먼저 orderList 화면이 나와야 함 -->
		<jsp:include page="/ind/headerTmp.jsp" />


		<main id="main" class="dFlex">
			<%
			//회원정보에 저장된 정보 가져오기
			MemberBean mBean = memberDao.selectMemberOne(uId);
			String uAddr = mBean.getuAddr();
			String uName = mBean.getuName();

			//배송지 관리에 저장된 주소 다 가져오기
			List<AddrBean> addrList = myPageDao.selectAddrList(uId);
			%>
			<div id="mainlnb" class="dFlex">
				<nav id="mainlnb_M">
					<h2>마이 마켓</h2>
					<ul>
						<li class="main_MLi"><a href="/myPage/orderList.jsp">주문
								내역</a></li>
						<li class="main_MLi"><a href="/myPage/wishList.jsp">찜한 상품</a></li>
						<li class="main_MLi checked"><a href="#">배송지 관리</a></li>
						<li class="main_MLi"><a href="/myPage/goodsComments.jsp">상품
								후기</a></li>
						<li class="main_MLi"><a href="/myPage/goodsQnA.jsp">상품 문의</a></li>
						<li class="main_MLi"><a href="/myPage/update_Info.jsp">개인
								정보 수정</a></li>
						<li class="main_MLi"><a href="/myPage/withdraw_Info.jsp">회원
								탈퇴</a></li>
					</ul>
				</nav>
			</div>

			<div id="contentsArea">

				<div id="title_container" class="dFlex">
					<div id="title">
						<h2>배송지 관리</h2>
					</div>
					<div id="subtitle">
						<p>*배송지에 따라 상품정보 및 배송유형이 달라질 수 있습니다.</p>
					</div>

				</div>


				<hr class="sepLine">

				<div id="contents">
					<div id="addr"></div>
					<form method="post" id="addrFrm"
						action="/myPage/insertAddrProc.jsp">
						<table>
							<tbody>
								<tr class="beforeAddr">

									<td rowspan="2" class="beforeAddrTd">
										<button class="addrBtn" type="button" onclick="findAddr()">
											<i class="fa fa-fw fa-search"></i>새 배송지 추가
										</button>
									</td>

								</tr>
								<!-- 주소검색 버튼 클릭 후 -->
								<tr class="afterAddr">
									<td>주소 입력</td>
									<td><input id="addrInput1" name="addr1" type="text"
										readonly></td>
								</tr>
								<tr class="afterAddr">
									<td></td>
									<td><input id="addrInput2" name="addr2" type="text"
										placeholder="나머지 주소를 입력해주세요."></td>
								</tr>
								<tr class="afterAddr">
									<td>받으실 분</td>
									<td><input type="text" name="name1" placeholder="수령하시는분의 성함을 입력해주세요"> <input
										type="hidden" name="name2" value="<%=uName%>"></td>
								</tr>
								<tr class="afterAddr">
									<td></td>
									<td rowspan="2">
										<button class="addrBtn" type="button" onclick="findAddr()">
											<i class="fa fa-fw fa-search"></i> 재검색
										</button>
										<button id="addrInsBtn" type="button">등록</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<hr class="sepLine2">
					<!------------------- 주소 끝 ------------------->
				</div>



				<div id="addrList">
					<form id="addrListFrm" method="post">
						<table id="addrTbl">
							<tbody>
								<tr>
									<td><strong>선택</strong></td>
									<td><strong>주소</strong></td>
									<td><strong>받으실 분</strong></td>
									<td><strong>기본 주소지</strong></td>
								</tr>
								<%
								for (int i = 0; i < addrList.size(); i++) {
									AddrBean aBean = addrList.get(i);
								%>
								<tr class="addrTr">
									<td><input type="checkbox" name="no"
										value="<%=aBean.getNo()%>"></td>
									<td><input type="text" name="uAddr"
										value="<%=aBean.getuAddr()%>" readonly></td>
									<td><input type="text" name="uName"
										value="<%=aBean.getuName()%>" readonly></td>
									<%
									if (uAddr.equals(aBean.getuAddr())) {
									%>
									<td><i class="fa fa-check"></i></td>
									<%} else {%>
									<td></td>
									<%
									}
									%>
								</tr>
								<%
								}
								%>
								<tr>
									<td></td><td></td>
									<td></td>
									<td>
										<button id="deleteBtn" type="button">삭제하기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>



			</div>




		</main>

		<jsp:include page="/ind/footerTmp.jsp" />

	</div>
</body>
</html>