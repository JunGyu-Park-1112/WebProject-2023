<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="GetTeamInfo.jsp"/>  

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
          <span class="room_name_font"> Team 이름 : ${Team.team_name } </span>
          <div class="room_text_description">${Team.team_description }</div>
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
    	/*$("#delete").click(function(){
    		$.ajax({
    			type: "post",
    			data: "DeleteCandidate-db.jsp",
    			data: {Candidate_name: name},
    			sucess: function(data){
    				if(data,sucess === "true"){}
    					
    			}else{
    				
    			}
    		})
    	})*/
    	
    </script>
  </body>
</html>