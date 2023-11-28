<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.Team" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstm = null;
    String user_name = (String)session.getAttribute("user_name");
    
    try {
        // DB 커넥션 연결
        String driver = "org.mariadb.jdbc.Driver";
        Class.forName(driver);
        String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
        
        conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
        if (conn != null)
            System.out.println("DB 접속 성공!");
        
        String query = "UPDATE team SET FLAG=? WHERE team_host = ?;";
        pstm = conn.prepareStatement(query);
        pstm.setInt(1,1);
        pstm.setString(2,user_name);
        pstm.executeUpdate();

        
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
    //teamPage로 이동
    response.sendRedirect("TeamPage.jsp");
%>
