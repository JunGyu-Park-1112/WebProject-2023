<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.Team" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    ArrayList<Team> TeamInfo = new ArrayList<>();
    
    try {
        // DB 커넥션 연결
        String driver = "org.mariadb.jdbc.Driver";
        Class.forName(driver);
        String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
        
        conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
        if (conn != null)
            System.out.println("DB 접속 성공!");
        
        String query = "SELECT * FROM team";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);

        while (rs.next()) {
            Team team = new Team();
            team.setTeam_name(rs.getString("team_name"));
            team.setTeam_description(rs.getString("team_description"));
            team.setTeam_host(rs.getString("team_host"));
            team.setTeam_candidate(rs.getString("team_candidate"));
            TeamInfo.add(team);
        }
        request.setAttribute("TeamList", TeamInfo);
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
