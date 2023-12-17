<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DOA.ClassDOA" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		String classNum = request.getParameter("classNum");
		
		ArrayList<String> Classinfo = new ArrayList<>();
		
		Classinfo.add(className);
		Classinfo.add(profName);
		Classinfo.add(description);
		
		HttpSession session = request.getSession();
		session.setAttribute("Classinfo",Classinfo);
		session.setAttribute("classNum",classNum);
		
		ClassDOA cDOA = ClassDOA.getInstance();
		boolean isEnd = cDOA.isEnd(Integer.parseInt(classNum));
		
	%>
	<c:if test="<%=!isEnd%>">
		<jsp:forward page="TeamPage.jsp"/>
	</c:if>
	<!-- 해당 class가 팀 매칭이 종료된 상황이라면 -->
	<jsp:forward page="TeamList.jsp"/>
</body>
</html>