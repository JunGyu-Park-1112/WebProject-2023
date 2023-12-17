<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import="DOA.TeamDOA" %>
<%@ page import="beans.Team" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HttpSession session = request.getSession();
	String status = (String)session.getAttribute("user_status");

	int classNum = Integer.parseInt((String)session.getAttribute("classNum"));
	TeamDOA tDOA = TeamDOA.getInstance();
	List<Team> Teams = tDOA.LoadEndTeamInfo(classNum);
	pageContext.setAttribute("Teams",Teams);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TeamList</title>
    <link rel="stylesheet" href="./assest/css/style.css" />
    <script src="./jquery.js"></script>
    <script>
    function gotoMain(){
    	location.href="mainPage.jsp";
    }
    $(document).ready(function(){
		<%
		if(status.equals("Student")){
		%>
			$(".secondColumn .button").hide();
		<%
		}
		%>
	})
    </script>
  </head>
<body>
    <div class="main">
      <div class="imgColumn">
        <img class="logoImg" src="img/logo.jpg" onclick='gotoMain()'/>
        <div class="gradient"></div>
      </div>
      <div class="firstColumn">
        <div class="TL_title">
          <i class="fa-solid fa-layer-group"> 팀 구성 현황</i>
        </div>
        <form class="TL_checkbox_Form">
          완성된 팀 제외<input type="checkbox" class="TL_checkbox" />
        </form>
        <form class="TL_SearchTeam">
          <input
            class="RoundInput"
            type="text"
            name="team_name"
            value=""
            placeholder="팀명을 입력해주세요..."
          />
          <button>
            <i class="fa-solid fa-magnifying-glass fa-lg"></i>
          </button>
        </form>
		<div class="TL_list_box">
		<c:forEach var="Team" items="${ Teams}">
         	<div class="TL_list">
          	 <div class="TL_list_status">
              <div class="TL_list_Leader">${Team.team_name }</div>
              <div class="TL_list_extra">조장 : ${Team.team_host }</div>
            </div>
            <hr color="grey" width="100%" />
            <div class="TL_list_content">
            	<c:forEach var="member" items="${ Team.team_candidate}">
            	${member }   
            	</c:forEach>
            </div>
          	</div>
          </c:forEach>
      	</div>
      </div>
      <div class="secondColumn">
      <form method="get" action="makeRandom.jsp">
      	<button class="button">마감</button>
      </form>
      </div>
    </div>
    <script>
    
    $(".TL_SearchTeam").submit(function(event){
        event.preventDefault(); 
        const search = $(".TL_SearchTeam input").val();
        $(".TL_list").each(function() {
            const teamName = $(this).find(".TL_list_Leader").text();
            if(search === teamName)
            	$(this).get(0).scrollIntoView();	
        });
    });

    	
    </script>
    <script src="./assest/js/mainPage.js"></script>
    <script
      src="https://kit.fontawesome.com/cacb8915e2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>