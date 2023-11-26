<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- test할 session의 user_name과 user_status 설정 -->
<%
	session.setAttribute("user_name","박준규");
	session.setAttribute("user_status","Student");
	session.setAttribute("class_id","1");
%>
<!-- DB에 저장되어 있는 team List를 request 영역에 저장 -->
<c:import url="GetTeamsInfo.jsp"/>  
<c:import url="GetMemberInfo.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TeamPage</title>
    <link rel="stylesheet" href="./assest/css/style.css" />
    <script src="./jquery.js"></script>
    <script>
    $(document).ready(function(){
    	<%
    	if(session.getAttribute("user_status").equals("Student")){
    	//현재 접속자가 교수라면, 해당 랜덤 팀 만들기 버튼이 보이지만, 학생이라면 팀 만들기 버튼이 보인다.
    	%>
        	$(".secondColumn button:last-child").hide();
        <%
        }
    	else
        {
        %>	
        	$(".secondColumn button:first-child").hide();
        <%
        }
        %>
    })
    </script>
</head>
<body>
    <div class="main">
      <div class="imgColumn">
        <img class="logoImg" src="img/logo.jpg" />
        <div class="gradient"></div>
      </div>
      <div class="firstColumn">
        <div class="FirstRow">
        <!-- 실제로 구현 후에는, DB에서 Team 이름과 Description 의 정보를 불러와서, 이를 동적으로 배치할 것이다... -->
        <c:forEach items="${TeamList }" var="team">
        	<div class="TeamConstruct" id="${team.team_name }">
        		<span>${team.team_name }</span><br>
        		<span>-${team.team_description }</span>
        	</div>
        </c:forEach>
        </div>
        <div class="TeamPageButton">	
          <form class = "SearchForm">
            <input
              class="RoundInput"
              type="text"
              placeholder="이름을 입력해 주세요..."
              name="student_name"
              value=""
            />
            <button value="">
              <i class="fa-solid fa-magnifying-glass fa-lg"></i>
            </button>
           </form>
        </div>
        <div class="SecondRow">
          <div class="introduceTable">
            <c:forEach items="${memberList }" var="member">
        		<div class="introduceBox" id="${member.user_name }">
        			<div class="introduceBox__name">${member.id} ${member.user_name }</div>
        			<div class="introduceBox__content">일단 이 부분은 보류</div>
        		</div>
        </c:forEach>
          </div>
        </div>
      </div>
      <div class="secondColumn">
        <button class="button">팀 만들기</button>
        <button class="button">랜덤 팀 만들기</button>
      </div>
    </div>
    <script>
    $(".secondColumn .button:last-child").click(function(){
    	location.href="TeamList.jsp";
    })
	$(".secondColumn .button:first-child").click(function(){
		location.href="TeamBuilding.jsp";
	})
    $(".TeamConstruct").click(function(){
    	const teamId = $(this).attr("id");
    	$.ajax({
    		type: "post",
    		url: "HandleTeamClick-db.jsp",
    		data: {teamId: teamId},
    		success: function(data){
    			if(data.sucess === "true"){
    				location.href="UserRoom.jsp";
    			}else{
    				alert("지원되셨습니다!");
    			}
    		},error: function (xhr, status, error) {
    	        console.error("AJAX request failed:", status, error);
    	    }
    	})	
    }	
    )
    const BoxArr = $(".introduceBox");
    $(".SearchForm").submit(function(event){
    	event.preventDefault();
    	for(let box of BoxArr)
    	{
    		if(box.id === $(".SearchForm .RoundInput").val()){
    			box.scrollIntoView();	
    		}
    	}
    	
    })
    </script>
    <script
      src="https://kit.fontawesome.com/cacb8915e2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>