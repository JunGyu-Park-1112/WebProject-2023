<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import="beans.Description" %>
<%@ page import="DOA.DescriptionDOA" %>
<%
request.setCharacterEncoding("UTF-8");
HttpSession session = request.getSession();
String user_name = (String)session.getAttribute("user_name");
String id = (String)session.getAttribute("id");
String user_description = request.getParameter("description");
int class_Num = Integer.parseInt((String)session.getAttribute("classNum"));

DescriptionDOA Ddoa = DescriptionDOA.getInstance();
Ddoa.AddDescription(user_name, id, user_description, class_Num);

response.sendRedirect("TeamPage.jsp");

%>
