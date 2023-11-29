<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DOA.ClassDOA"%>
<%@ page import="beans.ClassBeans"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8"); 
		String CN = request.getParameter("ClassName");
		String PN = request.getParameter("profName");
		String DC = request.getParameter("description");
		String CU = request.getParameter("ClassNum");
		ClassBeans bean_C = new ClassBeans(CN,PN,DC,CU);

		ClassDOA dao = ClassDOA.getInstance();
		dao.CreateClass(bean_C);
	%>
	<jsp:forward page="mainPage.jsp"/>
</body>
</html>