<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    ArrayList<member> memberInfo = new ArrayList<>();
    
    try {
        // DB 커넥션 연결
        String driver = "org.mariadb.jdbc.Driver";
        Class.forName(driver);
        String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
        
        conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
        if (conn != null)
            System.out.println("DB 접속 성공!");
        
        String query = "SELECT * FROM member";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);

        while (rs.next()) {
            member memb = new member();
            memb.setId(rs.getString("id"));
            memb.setUser_name(rs.getString("user_name"));
            memb.setUser_status(rs.getString("user_status"));
            memberInfo.add(memb);
        }
        request.setAttribute("memberList", memberInfo);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException sqle) {
        sqle.printStackTrace();
    } finally {
        // 리소스 해제
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
