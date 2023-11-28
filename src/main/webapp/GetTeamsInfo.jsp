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
            team.setFlag(rs.getInt("FLAG"));
            
            //rs에서 String으로 받아온 값을, 리스트의 형태로 분리하여 Beans에 저장하여야 한다.
            List<String> candidate_List = new ArrayList<>();
            String candidates = rs.getString("team_candidate");
            for(int i = 0; i + 3 < candidates.length(); i+=3)
            {
            	String candidate = candidates.substring(i,i+3);
            	candidate_List.add(candidate);
            }
            
            team.setTeam_candidate(candidate_List);
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
