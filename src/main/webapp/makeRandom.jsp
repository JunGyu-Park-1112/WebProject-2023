<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import="DOA.DescriptionDOA" %>
<%
	HttpSession session = request.getSession();
	int class_Num = Integer.parseInt((String)session.getAttribute("classNum"));
	DescriptionDOA dDOA = DescriptionDOA.getInstance();
	dDOA.makeRandom(class_Num);
	
	response.sendRedirect("mainPage.jsp");
%>