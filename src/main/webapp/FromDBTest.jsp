<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 정보 출력</title>
</head>
<body>
	<h2>회원 정보 갖고 오기!</h2>
	<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		//DB 커넥션 연결
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
		
		conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
		if(conn != null)
			System.out.println("DB 접속 성공!");
		
		String query = "SELECT * FROM MEMBER";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException sqle){
		sqle.printStackTrace();
	}
	while(rs.next()){
	%>
		<span><%= rs.getString("user_name") %></span>
	<%
	}
	 %>
</body>
</html>