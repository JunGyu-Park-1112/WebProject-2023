<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import="java.sql.*" %>
<%@ page import="beans.Team"%>
<%@ page import="DOA.TeamDOA" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
HttpSession session = request.getSession();
request.setCharacterEncoding("UTF-8");
int classNum = Integer.parseInt((String)session.getAttribute("classNum"));
String team_name = request.getParameter("TeamName");
String team_description = request.getParameter("Description");
String team_host = (String)session.getAttribute("user_name");

TeamDOA Tdoa = TeamDOA.getInstance();
Tdoa.AddTeamInfo(classNum, team_name, team_description, team_host);
%>

//UserRoom으로 현재 저장된 팀의 이름과, 세부 설명을 함께 전달한다.
<c:redirect url="UserRoom.jsp">
	<c:param name="TeamName" value="${param.TeamName }"/>
	<c:param name="Description" value="${param.Description }"/>
</c:redirect>
