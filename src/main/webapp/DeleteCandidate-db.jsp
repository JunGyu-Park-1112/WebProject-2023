<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String Candidate_name = request.getParameter("Candidate_name");
Connection conn = null;
PreparedStatement pstm = null;
ResultSet rs = null;
String jsonResponse = null;
String session_name = (String)session.getAttribute("user_name");

String before_candidates = null;
String after_candidates = null;

try{
	// DB 커넥션 연결
    String driver = "org.mariadb.jdbc.Driver";
    Class.forName(driver);
    String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testdb";
    
    conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
    if (conn != null)
        System.out.println("DB 접속 성공!");
    
    String query = "SELECT team_candidate FROM team WHERE team_host = ?";
    pstm = conn.prepareStatement(query);
    pstm.setString(1, session_name);
    rs = pstm.executeQuery();
    
    while(rs.next())
    {
    	//team_candidate에 저장되어 있던 이름 제거...
    	before_candidates = rs.getString("team_candidate");
    	after_candidates = before_candidates.replace(Candidate_name,"");
    }
    
    //DB에 정보를 수정한다.
    query = "UPDATE team SET team_candidate = ? WHERE team_host = ? ";
    pstm = conn.prepareStatement(query);
    pstm.setString(1, after_candidates);
    pstm.setString(2, session_name);
    pstm.executeUpdate();
    
    jsonResponse="{\"sucess\":\"true\"}";

    System.out.println(jsonResponse);
    
    response.setContentType("application/json;charset=UTF-8");
    response.getWriter().write(jsonResponse);
    
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} catch (SQLException sqle) {
    sqle.printStackTrace();
} finally {
    // 리소스 해제
    try {
        if (rs != null) rs.close();
        if(pstm != null) pstm.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>