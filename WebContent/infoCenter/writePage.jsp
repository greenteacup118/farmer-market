<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <link rel="stylesheet" href="/style/style_infoCenter.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script_infoCenter.js"></script>
</head>
<body>
  <div id="wrap">
 
 
 
   <header id="headerTmp">
      
      <div id="headMenu">
      <ul class="dFlex">
      	<li><a href="#">로그아웃</a></li>
      	<li><a href="#">고객센터</a></li>
      </ul>
      </div>
      <a href="/infoCenter/notice.jsp"><img src="/images/headerLogo.png" alt="헤더로고" /></a>
         
         <nav id="headLNB">
         
         <ul class="dFlex">
         	<li>LNB카테고리</li>
         	<li>|</li>
         	<li>육류</li>
         	<li>|</li>
         	<li>채소</li>
         	<li>|</li>
         	<li>생선</li>
         	
         </ul>
         
         </nav>
         
         
         
         
   </header>
     
<!--      <div id="headerLMB">
      
     
     
     </div>
    -->
      <main id="main" class="dFlex">
      
      
      
      
      <div id="mainlnb" class="dFlex">
      
        <nav id="mainlnb_M">
        
        <h2>고객센터</h2>
        <ul id="nextPage">
        	<li  id="notice_lnb"  class="main_MLi" ><a href="/infoCenter/notice.jsp">공지사항</a></li>
        	<li  id="Q&A_lnb"    class="main_MLi"><a href="/infoCenter/qna.jsp">	Q&A게시판</a></li>
        	<li  id="FAQ_lnb"     class="main_MLi"><a href="/infoCenter/faq.jsp">FAQ게시판</a></li>
        	<li  id="inquire_lnb" class="main_MLi"><a href="/infoCenter/inquire.jsp">1:1문의</a></li>
        </ul>
        
        </nav>
      
      </div>
      
      <div id="contents">
        
        <h3>게시판 글쓰기</h3>
                    
        <hr class="divisionline">
          
        <table id="BBSwrite">
        	<tbody>
        	
        	 	
        		 
                 <select >
       		      <option value="">게시판 선택</option>
       		      <option value="">공지사항</option>
       		      <option value="">Q&A게시판</option>
      		      <option value="">FAQ게시판</option>
       		    
       		    </select>
       		    
       	
        	
        	
        		<tr>
        			<td>글제목</td>
        			<td><input type="text"></td>      		
        		</tr>
        		<tr>
        			<td id="mainwrite">글내용</td>
        			<td><textarea></textarea></td>
        		</tr>
        		
        		 <tr>
        		 <td>파일</td>
        		<td id="file"><input type="file"></td>
        		 </tr>
        		 
       
        	</tbody>
        	
        </table>
       
          <div id="btnArea">
        <button><a href="#">취소</a></button>
       <button><a href="#">저장하기</a></button>
          </div>
      
          
        
     
        

      </div>
      
      
      
      </main>
   
      <footer id="footer">
      
          <hr class="divisionline">
      
      </footer>
   
   
   
 
 
 </div>
</body>
</html>