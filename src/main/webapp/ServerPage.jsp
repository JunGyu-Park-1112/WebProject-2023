<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
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
		//String classNum = request.getParameter("classNum");
		String classNum = "1";
		
		
		
		
		ArrayList<String> Classinfo = new ArrayList<>();
		
		Classinfo.add(className);
		Classinfo.add(profName);
		Classinfo.add(description);
		Classinfo.add(classNum);
		
		HttpSession session = request.getSession();
		session.setAttribute("Classinfo",Classinfo);
		
		
	%>
	<jsp:forward page="TeamPage.jsp"/>
</body>
</html>