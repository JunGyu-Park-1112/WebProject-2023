<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String TeamName = (String)request.getAttribute("TeamName");
String Description = (String)request.getAttribute("Description");
//DB에 해당 정보를 이용하여, 새로운 Team Element를 만든다.
response.sendRedirect("UserRoom.jsp");
%>