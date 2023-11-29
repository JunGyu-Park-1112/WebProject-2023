<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./assest/css/style.css" />
    <script src="./jquery.js"></script>
  </head>
    <body class ="signInPage">
      <div class="main">
        <div class="imgColumn">
          <img class="logoImg" src="img/logo.jpg" />
          <div class="gradient"></div>
        </div>
        <!-- wrapper -->
        <div id="signIn_wrapper">
            <!-- content-->
            <div id="signIn_content">
                <form method ="POST" action = "signIn_process.jsp">
                <!-- ID -->
                <div>
                    <h3 class ="signInPage">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="signInPage_box int_id">
                        <input type="text" name="id" class="signInPage_int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                 <%
					Object errorMessage = request.getAttribute("errorMessage");
					if(errorMessage != null) {
				
				%>
				<div class = "control-error">
					<label class = "error"><%=errorMessage%></label>
				</div>
				<%
					}
				%>

                <!-- PW1 -->
                <div>
                    <h3 class="signInPage"><label for="pw">비밀번호</label></h3>
                    <span class="signInPage_box int_pass">
                        <input type="password" name="pw" class="signInPage_int" maxlength="20">
                        <span id="alertTxt">비밀번호</span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="signInPage"><label for="user_name">이름</label></h3>
                    <span class="signInPage_box int_name">
                        <input type="text" name="user_name" class="signInPage_int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <div>
                  <h3 class = "signInPage"><label for = "user_status">신분</label></h3>
                    <select name = "user_status" class = "signInPage_grade" size="1">
                      <option value ="Student">학생</option>
                      <option value ="Professor">교수</option>
                    </select>

            
                </div>
                
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <input type ="submit" onclick = "redirecthomePage()" id="btnJoin" value ="회원가입">
                        
                </div>
 				</form>
                

            </div> 
         
            <!-- content-->

        </div> 
    </div>
        <!-- wrapper -->
    <script src="main.js"></script>
    <script>
      function redirecthomePage() {
        window.location.href ='homePage.jsp';
      
      }
     
    </script>
  
    </body>
</html>
