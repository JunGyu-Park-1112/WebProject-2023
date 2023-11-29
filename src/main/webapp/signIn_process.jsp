<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DOA.memberDOA" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id = "memberBean"  class = "beans.member"/>
	<jsp:setProperty name = "memberBean" property ="*"/>
	
	<%
		memberDOA dao = memberDOA.getinstance();
		dao.joinMember_SignPage(memberBean, request, response);
		
	%>
	<jsp:forward page = "homePage.jsp"></jsp:forward>
</body>
