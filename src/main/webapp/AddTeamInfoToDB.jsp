<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

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
    
    String query = "INSERT INTO team (class_identifier, team_name, team_description, team_host, team_candidate, FLAG) VALUES (?,?,?,?,?,?);";
    pstm = conn.prepareStatement(query);
    pstm.setString(1, (String)session.getAttribute("class_id"));
    pstm.setString(2,request.getParameter("TeamName"));
    pstm.setString(3,request.getParameter("Description"));
    pstm.setString(4,session_name);
    pstm.setString(5,"");
    pstm.setInt(6,0);
    
    pstm.executeUpdate();
    out.println("정상적");
}catch(Exception e)
{
	e.printStackTrace();
}
finally{
	try {
        if (rs != null) rs.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

//UserRoom으로 현재 저장된 팀의 이름과, 세부 설명을 함께 전달한다.
<c:redirect url="UserRoom.jsp">
	<c:param name="TeamName" value="${param.TeamName }"/>
	<c:param name="Description" value="${param.Description }"/>
</c:redirect>
