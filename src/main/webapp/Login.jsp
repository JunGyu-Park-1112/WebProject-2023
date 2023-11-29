<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DOA.memberDOA" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id = "memberBean"  class = "beans.member"/>
	<jsp:setProperty name="memberBean" property="id"/>
	<jsp:setProperty name="memberBean" property="pw"/>
	<%
		memberDOA dao = memberDOA.getinstance();
		dao.compareID(memberBean, request, response);
	%>
</body>
</html>