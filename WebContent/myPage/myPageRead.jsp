<%@page import="pack_MyPage.GoodsCommentsBean"%>
<%@page import="pack_MyPage.GoodsQnABean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="myPageDao" class="pack_MyPage.MyPageDao" />
<jsp:useBean id="goodsDao" class="pack_Goods.GoodsDao" />
<%
request.setCharacterEncoding("UTF-8");
String uId = (String) session.getAttribute("uId_Session");

int no = Integer.parseInt(request.getParameter("no"));
String type = request.getParameter("type");

String[] chkBBS= {"", ""};
String title = "";
String subTitle1 = "";
String subTitle2 = "";

if("q".equals(type)) {
	//qna게시판에서 왔다면
	chkBBS[0] = " checked"; 
	title = "상품 문의";
	subTitle1 = "* 상품에 대해 남기신 문의를 확인하는 공간입니다.";
	subTitle2 = "* 배송관련, 주문 관련 문의 및 요청사항은 파머마켓 내, 1:1 문의에 남겨주세요.";

} else if("c".equals(type)) {
	//후기 게시판에서 왔다면
	chkBBS[1] = " checked"; 
	title = "상품 후기";
	subTitle1 = "* 상품에 대해 남기신 후기를 확인하는 공간입니다.";
	subTitle2 = "* 전화번호, 이메일, 주소, 계좌번호 등 상세 개인정보를 작성하지 않도록 주의해주세요.";
}

String readonly = "readonly";


String write = request.getParameter("write");
if("y".equals(write)) {
	readonly = "";
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품문의</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_MyPage.css">
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
						<li class="main_MLi <%=chkBBS[1]%>"><a href="/myPage/goodsComments.jsp">상품
								후기</a></li>
						<li class="main_MLi <%=chkBBS[0]%>"><a href="/myPage/goodsQnA.jsp">상품 문의</a></li>
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
						<input id="type" type="hidden" value="<%=type%>">
						<input id="no" type="hidden" value="<%=no%>">
						<input id="write" type="hidden" value="<%=write%>">
						<h2><%=title %></h2>
					</div>
					<div id="subtitle" class="QnA bbsSubtitle">
						<p><%=subTitle1 %></p>
						<p><%=subTitle2 %></p>
					</div>

				</div>
				
				<hr class="sepLine">
				
				
				<!-- 본문영역 2번 반복 -->
				<%
				if("q".equals(type)) {
					//qna게시판에서 왔다면
					GoodsQnABean bean = myPageDao.selectQnAOne(no);
					GoodsQnABean beanBefore = myPageDao.selectQnAOne(no-1);
					GoodsQnABean beanAfter = myPageDao.selectQnAOne(no+1);
				%>
								<!-- /////////////////////본문영역 시작///////////////////// -->
				<div id="contents">
					<form method="post" id="goodsBbsFrm">
						<table id="bbsTbl">
							<tbody>
								<tr>
									<td class="tdTitle">제목</td>
									<td colspan="3">
										<input name="title" type="text" value="<%=bean.getTitle_q() %>" <%=readonly %>>
									</td>
								</tr>
								
								<tr>
									<td class="tdTitle">작성자</td>
									<td colspan="3">
										<input type="text" value="<%=bean.getuId() %>" readonly>
									</td>
								</tr>
								
								<tr id="viewAndDate">
									<td class="tdTitle">작성일</td>
									<td colspan="3">
										<input type="text" value="<%=bean.getWriteTime_q() %>" readonly>
									</td>
								</tr>
								
								<tr>
									<td colspan="4">
									<!-- 이미지 있다면 이미지 태그 넣기 -->
									<%if(bean.getFileRName_q() != null) {%>
										<div id="img">
											<img src="/fileUpload/<%=bean.getFileRName_q() %>" alt="업로드 이미지" />
										</div>
									<%} %>
										
										<textarea name="content" <%=readonly %> wrap="hard"><%=bean.getContetns_q() %></textarea>
									</td>
								</tr>
								
								<tr id="btnArea">
									<td colspan="4">
										<%if ("y".equals(write)) {%>
										<button id="writeBtn" type="button">등록</button>
										<%} else { %>
										<button id="updateBtn" type="button">수정</button>
										<%} %>
										<button id="deleteBtn" type="button">삭제</button>
										<button id="toListBtn" type="button">목록</button>
									</td>
								</tr>
	
								<%if (beanBefore.getTitle_q() != null) {%>
								<tr id="beforeRead">
									<td class="tdTitle">이전글</td>
									<td colspan="3">
										<input type="text" value="<%=beanBefore.getTitle_q()%>">
										<input type="hidden" name="no" value="<%=beanBefore.getNo()%>">
										<input type="hidden" name="type" value="q">										
										<input type="hidden" name="write" value="n">										
									</td>
								</tr>
								<%} %>
								<%if (beanAfter.getTitle_q() != null) {%>							
								<tr id="afterRead">
									<td class="tdTitle">다음글</td>
									<td colspan="3">
										<input type="text" value="<%=beanAfter.getTitle_q()%>">
										<input type="hidden" name="no" value="<%=beanAfter.getNo()%>">
										<input type="hidden" name="type" value="q">										
										<input type="hidden" name="write" value="n">										
									</td>
								</tr>
								<%} %>
	
							</tbody>
						</table>
					</form>
				</div>
				<!-- div#contents -->
				<!-- /////////////////////본문영역 끝///////////////////// -->
				<%
				} else if("c".equals(type)) {
					//후기 게시판에서 왔다면
					GoodsCommentsBean bean = myPageDao.selectCommentOne(no);
					GoodsCommentsBean beanBefore = myPageDao.selectCommentOne(no-1);
					GoodsCommentsBean beanAfter = myPageDao.selectCommentOne(no+1);
					%>
									<!-- /////////////////////본문영역 시작///////////////////// -->
				<div id="contents">
					<form method="post" id="goodsBbsFrm">
						<table id="bbsTbl">
							<tbody>
								<tr>
									<td class="tdTitle">제목</td>
									<td colspan="3">
										<input name="title" type="text" value="<%=bean.getTitle_c() %>" <%=readonly %>>
									</td>
								</tr>
								
								<tr>
									<td class="tdTitle">작성자</td>
									<td colspan="3">
										<input type="text" value="<%=bean.getuId() %>" readonly>
									</td>
								</tr>
								
								<tr id="viewAndDate">
									<td class="tdTitle">작성일</td>
									<td><input type="text" value="<%=bean.getWriteTime_c() %>" readonly></td>
									<td class="tdTitle">조회수</td>
									<td><input type="text" value="<%=bean.getView_cnt_c() %>" readonly></td>
								</tr>
								
								<tr>
									<td colspan="4">
									<!-- 이미지 있다면 이미지 태그 넣기 -->
									<%if(bean.getFileRName_c() != null) {%>
										<div id="img">
											<img src="/fileUpload/<%=bean.getFileRName_c() %>" alt="업로드 이미지" />
										</div>
									<%} %>
										
										<textarea name="content" <%=readonly %>  wrap="hard"><%=bean.getContetns_c() %></textarea>
									</td>
								</tr>
								
								<tr id="btnArea">
									<td colspan="4">
										<%if ("y".equals(write)) {%>
										<button id="writeBtn" type="button">등록</button>
										<%} else { %>
										<button id="updateBtn" type="button">수정</button>
										<%} %>
										<button id="deleteBtn" type="button">삭제</button>
										<button id="toListBtn" type="button">목록</button>
									</td>
								</tr>
	
								<%if (beanBefore.getTitle_c() != null) {%>
								<tr id="beforeRead">
									<td class="tdTitle">이전글</td>
									<td colspan="3">
										<input type="text" value="<%=beanBefore.getTitle_c()%>">
										<input type="hidden" name="no" value="<%=beanBefore.getNo()%>">
										<input type="hidden" name="type" value="c">										
										<input type="hidden" name="write" value="n">										
									</td>
								</tr>
								<%} %>
								<%if (beanAfter.getTitle_c() != null) {%>							
								<tr id="afterRead">
									<td class="tdTitle">다음글</td>
									<td colspan="3">
										<input type="text" value="<%=beanAfter.getTitle_c()%>">
										<input type="hidden" name="no" value="<%=beanAfter.getNo()%>">
										<input type="hidden" name="type" value="c">										
										<input type="hidden" name="write" value="n">		
									</td>
								</tr>
								<%} %>
	
							</tbody>
						</table>
					</form>
				</div>
				<!-- div#contents -->
				<!-- /////////////////////본문영역 끝///////////////////// -->
					<%					
				}
				%>


			</div>
		</main>

		<jsp:include page="/ind/footerTmp.jsp" />

	</div>
</body>
</html>