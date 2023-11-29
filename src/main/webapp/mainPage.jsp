<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="DOA.ClassDOA" %>
<%@ page import="beans.ClassBeans" %>

<%
    ClassDOA dao = ClassDOA.getInstance();
    List<ClassBeans> beanList = dao.load();
    request.setAttribute("ClassBean", beanList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MainPage</title>
    <link rel="stylesheet" href="./assest/css/style.css"/>
    <script src="./jquery.js"></script>
    <%
    	session.setAttribute("user_name","박준규");
		session.setAttribute("user_status","Professor");
		session.setAttribute("class_id","1");
		//login한 id의 member_status를 status의 속성값으로 설정 
		String status = (String)session.getAttribute("user_status");
		
	%>
    <script>                 	
		document.addEventListener("DOMContentLoaded", function() { //session의 status에 따라 숨기기 설정
			var status = <%= status%>
			if(status !="Professor"){
				document.getElementById("bt").style.display = "none";
			}
		});
	</script>
	
  </head>
</head>
<body>
	<div class="main">
      <div class="imgColumn">
        <img class="logoImg" src="img/logo.jpg" />
        <div class="gradient"></div>
      </div>
      <div class="firstColumn">
        <div class="teamTable__title">
          <i class="fa-solid fa-list-ul"></i>
          강의 리스트
        </div>
    	<form class="SearchTeam">
	        <input
	            class="RoundInput"
	            type="text"
	            name="team_name"
	            placeholder="수업/교수명을 입력해주세요..."
	            oninput="SearchClass()"
	        	/>
    	</form>
		    <div class="teamTable">
		        <c:forEach var="bean" items="${ClassBean}">
		            <div class="team" style="cursor: pointer;" onclick="handleTeamClick('${bean.className}', '${bean.profName}', '${bean.description}')">
		                <div class="classinfo">
		                    <div class="className">강의 이름 : ${bean.className}</div>
		                    <div class="classProf">교수명: ${bean.profName}</div>
		                </div>
		                <div class="description">${bean.description}</div>
		            </div>
		        </c:forEach>
	    	</div>
		</div>
		<div class="secondColumn">
        <a href="ClassBuild.html" class="button" id="bt">수업 만들기</a>
      </div>
	</div>
    <script>
        function SearchClass() {                                  //검색 함수
            var input, filter, team, i;
            input = document.querySelector('.RoundInput');
            filter = input.value.toUpperCase();
            team = document.querySelectorAll('.team');

            for (i = 0; i < team.length; i++) {
                var name = team[i].querySelector('.className').innerText.toUpperCase();
                var profName = team[i].querySelector('.classProf').innerText.toUpperCase();

                if (name.includes(filter) || profName.includes(filter)) {
                    team[i].style.display = '';
                } else {
                    team[i].style.display = 'none';
                }
            }
        }
        function handleTeamClick(className, classProf, description) {     //클릭시 인수에는 실제 클릭할 얘들의 정보가 담김  
            window.location.href = "ServerPage.jsp?className=" + encodeURIComponent(className) +
                                   "&profName=" + encodeURIComponent(classProf) +
                                   "&description=" + encodeURIComponent(description);
        }
    </script>
    <script src="./assest/js/mainPage.js"></script>
    <script
      src="https://kit.fontawesome.com/cacb8915e2.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>