<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.Team" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String team_name = request.getParameter("teamId");
Connection conn = null;
PreparedStatement pstm = null;
ResultSet rs = null;
String jsonResponse = null;
String session_name = (String)session.getAttribute("user_name");


try {
    // DB 커넥션 연결
    String driver = "org.mariadb.jdbc.Driver";
    Class.forName(driver);
    String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testdb";
    
    conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
    if (conn != null)
        System.out.println("DB 접속 성공!");
    
    String query = "SELECT team_host FROM team where team_name = ?";
    pstm = conn.prepareStatement(query);
    pstm.setString(1,team_name);
    
    rs = pstm.executeQuery();

    String host_name = null;
    while (rs.next()) {
        host_name = rs.getString("team_host");
        System.out.println(host_name);
    }
    
    if(host_name.equals((String)session.getAttribute("user_name")))
    {
    	jsonResponse="{\"sucess\":\"true\"}";
    	System.out.println(jsonResponse);
    }
    else{
    	//db에 해당 이름을 추가하는 로직 구현
    	String query2 = "UPDATE team SET team_candidate = CONCAT(team_candidate, ?) WHERE team_name = ? ";
    	pstm = conn.prepareStatement(query2);
    	pstm.setString(1, session_name);
    	pstm.setString(2,team_name);
    	pstm.executeUpdate();
    	jsonResponse="{\"sucess\":\"false\"}";
    	System.out.println(jsonResponse);
    }
    response.setContentType("application/json;charset=UTF-8");
    response.getWriter().write(jsonResponse);
  
    //예외 처리
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException sqle) {
    sqle.printStackTrace();
} finally {
    // 리소스 해제
    try {
        if (rs != null) rs.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
