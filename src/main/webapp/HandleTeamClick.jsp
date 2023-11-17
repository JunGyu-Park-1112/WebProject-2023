<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String team_name = request.getParameter("teamId");

//1. TeamDOA를 호출하여, 해당 team_name의 방장 이름을 load한다.
//2. 해당 정보가 현재 session_name에 저장되어 있는 이름과 동일하면, location.href... 문을 실행하도록
//3. 동일하지 않으면, 다시 TeamDOA를 호출하여, candidate를 수정한다.
//4. 이떄 location.href나 alert문을 실행하기 위하여, ajax의 sucess 함수를 수정한다.
%>