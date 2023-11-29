<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String className = request.getParameter("className");
		String profName = request.getParameter("profName");
		String description = request.getParameter("description");
		
		
		
		
		ArrayList<String> Classinfo = new ArrayList<>();
		
		Classinfo.add(className);
		Classinfo.add(profName);
		Classinfo.add(description);
		
		session.setAttribute("Classinfo",Classinfo);
		
		
	%>
	<jsp:forward page="TeamPage.jsp"/>
</body>
</html>