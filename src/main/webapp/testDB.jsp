<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DOA.memberDOA"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB test</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="memberBean" class="beans.member"/>
	<jsp:setProperty property="*" name="memberBean"/>
	<%
		memberDOA dao = memberDOA.getinstance();
		dao.joinMember(memberBean);
	%>
</body>
</html>