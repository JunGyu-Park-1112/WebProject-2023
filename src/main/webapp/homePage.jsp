<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HomePage</title>
    <link rel="stylesheet" href="assest/css/style.css" />
    <script src="jquery.js"></script>
  </head>
  <body>
    <div class="main">
      <div class="imgColumn">
        <img class="logoImg" src="img/logo.jpg" />
        <div class="gradient"></div>
      </div>
      <div class="main__firstColumn">
        <div class="main__firstColumn__Form">
          <form class="LoginForm" method="POST" action="Login.jsp">
            <span class="LoginForm__title">동국대학교 팀 만들기(학부)</span>
           
            <label for="id">아이디 (학번)</label>
            <input
              id="id"
              type="text"
              placeholder="학번을 입력하세요"
              name="id"
              value=""
            />
            <%
				String errorMessage = (String)request.getAttribute("errorMessage");
				if(errorMessage != null) {
				
			%>
			<div class = "control-error">
				<label class = "error"><%=errorMessage%></label>
			</div>
			<%
				}
			%>
            <label for="pw">비밀번호</label>
            <input
              id="pw"
              type="password"
              placeholder="비밀번호를 입력하세요"
              name="pw"
              value=""
            />
            <button class="LoginForm_btn">로그인</button>
            <div class = "SigninForm_btn"> <a class = "signIn" href = "signIn.jsp">회원가입 </a></div>
          </form>
        </div>
        <div class="main__firstColumn__announcement">
          <div class="announcement__title">
            <span> &lt;공지 사항&gt; </span>
          </div>
          <div class="announcement__text"></div>
        </div>
      </div>
      <div class="main__secondColumn">
        <div class="main__secondColumn--Howtouse">
          <div class="Howtouse__title">
            <span>&lt;이용 방법&gt;</span>
          </div>
          <div class="Howtouse__text"></div>
        </div>
        <div class="main__secondColumn--Introduce">
          <div class="Introduce__title">
            <span>&lt;소개 글&gt;</span>
          </div>
          <div class="Introduce__text"></div>
        </div>
      </div>
    </div>
    <script src="assest/js/homepage.js"></script>
    <script
      src="https://kit.fontawesome.com/cacb8915e2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
