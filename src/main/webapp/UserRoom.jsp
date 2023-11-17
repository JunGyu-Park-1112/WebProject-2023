<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>UserRoom</title>
    <link rel="stylesheet" href="./assest/css/style.css" />
    <script src="./jquery.js"></script>
  </head>
 <body>
    <div class="main">
      <div class="imgColumn">
        <img class="logoImg" src="img/logo.jpg" />
        <div class="gradient"></div>
      </div>
      <div class="firstColumn">
        <div class="room_information">
          <!-- 방의 정보를 알려주는 div공간 -->
          <span class="room_name_font"> Team 이름 : JLP웹프로젝트 </span>
          <div class="room_text_description">Team 세부 정보</div>
        </div>
        <div class="deadline">
          <input id="deadline_submit" type="submit" value="마감" />
        </div>
        <div class="user_information">
          <!-- 지원자의 이름, 학번등의 정보를 알려주는 div공간 -->
          <div class="candidate_div">
            <button id="delete">x</button>
            <div class="candidate_info"></div>
          </div>
          <div class="candidate_div">
            <button id="delete">x</button>
            <div class="candidate_info"></div>
          </div>
          <div class="candidate_div">
            <button id="delete">x</button>
            <div class="candidate_info"></div>
          </div>
        </div>
      </div>
      <div class="secondColumn">
      <button class="button">되돌아가기</button>
      </div>
    </div>
    <script src="./assest/js/mainPage.js"></script>
    <script
      src="https://kit.fontawesome.com/cacb8915e2.js"
      crossorigin="anonymous"
    ></script>
    <script>
    	$(".secondColumn .button").click(function(){
    		location.href = "TeamPage.jsp";
    	})
    </script>
  </body>
</html>