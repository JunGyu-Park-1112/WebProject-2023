<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TeamBuilding</title>
    <link rel="stylesheet" href="./assest/css/style.css" />
    <script src="./jquery.js"></script>
</head>
<body>
	<div class="main">
      <div class="imgColumn">
        <img class="logoImg" src="img/logo.jpg" />
        <div class="gradient"></div>
      </div>
      <form class="buildingForm" action="AddTeamInfoToDB.jsp" method="post">
      <div class="firstColumn buildingColumn">
        <div class="buildingTitle">
          <h1>Team Building</h1>
        </div>
        <hr width="100%" />
        <div class="TeamForm">
            <h4>팀 이름</h4>
            : <input type="text" name="TeamName" /><br />
            <h4>팀 세부 사항(안내 사항)</h4>
            :
            <textarea cols="50" rows="10" name="Description"></textarea>
        </div>
      </div>
      <div class="secondColumn">
        <button class="button">생성하기</button>
      </div>
      </form>
    </div>
</body>
</html>