<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import="java.sql.*" %>
<%@ page import="DOA.DescriptionDOA" %>
<%@ page import="beans.Description" %>
<%@ page import="DOA.TeamDOA" %>
<%@ page import="beans.Team" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HttpSession session = request.getSession();

	//현재 세션에 저장되어 있는 classNum을 받아온다.
	int classNum = Integer.parseInt((String)session.getAttribute("classNum"));
	String user_name = (String)session.getAttribute("user_name");
	String id = (String)session.getAttribute("id");

	DescriptionDOA Ddoa = DescriptionDOA.getInstance();
	List<Description> descriptions = Ddoa.loadDescription(classNum);
	pageContext.setAttribute("descriptions", descriptions);
	
	TeamDOA Tdoa = TeamDOA.getInstance();
	List<Team> Teams = Tdoa.loadTeam(classNum);
	pageContext.setAttribute("Teams",Teams);
	
%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TeamPrage</title>
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
        <c:forEach items="${Teams }" var="team">
        <c:if test="${team.getFlag() != 1}">
        	<div class="TeamConstruct" id="${team.team_name }">
        		<span>${team.team_name }</span><br>
        		<span>-${team.team_description }</span>
        	</div>
        </c:if>
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
            <c:forEach items="${descriptions }" var="member">
        		<div class="introduceBox" id="${member.user_name }">
        			<div class="introduceBox__name">${member.id} ${member.user_name }</div>
        			<div class="introduceBox__content">${member.user_description }</div>
        		</div>
        </c:forEach>
          </div>
          <div class="comment">
            <div class="comment_header"><%=id %> <%=user_name %></div>
            <div class="comment_body">
              <form class="comment_form" method="post" action="AddDescription-db.jsp">
                <input
                  type="text"
                  placeholder="1인당 1번만 입력해 주세요..."
                  name="description"
                />
                <button>
                  <i class="fa-solid fa-angle-up fa-xl" style="color: white;"></i></i>
                </button>
              </form>
            </div>
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