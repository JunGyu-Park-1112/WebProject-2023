<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.Team" %>
<%@ page import= "java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String team_name = request.getParameter("teamId");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

Map<String, String> jsonResponse = new HashMap<>();
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

try {
    // DB 커넥션 연결
    String driver = "org.mariadb.jdbc.Driver";
    Class.forName(driver);
    String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
    
    conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
    if (conn != null)
        System.out.println("DB 접속 성공!");
    
    String query = "SELECT team_host FROM team where team_name = " + driver;
    stmt = conn.createStatement();
    rs = stmt.executeQuery(query);

    String host_name = null;
    while (rs.next()) {
        host_name = rs.getString("team_host");
    }
    
    if(host_name.equals((String)session.getAttribute("user_name")))
    {
    	jsonResponse.put("sucess","true");
    }
    else{
		jsonResponse.put("sucess","false");
    }
  
    //예외 처리
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
//1. TeamDOA를 호출하여, 해당 team_name의 방장 이름을 load한다.
//2. 해당 정보가 현재 session_name에 저장되어 있는 이름과 동일하면, location.href... 문을 실행하도록
//3. 동일하지 않으면, 다시 TeamDOA를 호출하여, candidate를 수정한다.
//4. 이떄 location.href나 alert문을 실행하기 위하여, ajax의 sucess 함수를 수정한다.
