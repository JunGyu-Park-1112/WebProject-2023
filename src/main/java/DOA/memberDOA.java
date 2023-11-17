package DOA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.management.RuntimeErrorException;

import beans.member;
public class memberDOA {
	private static memberDOA instance;
	private memberDOA() {}
	
	public static memberDOA getinstance() {
		if(instance == null) instance = new memberDOA();
		return instance;
	}
	
	public void joinMember(member bean) {
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
			conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
			
			String query = "INSERT INTO MEMBER VALUES(?,?,?,?)";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1,bean.getUser_name());
			pstm.setString(2,bean.getId());
			pstm.setString(3, bean.getPw());
			pstm.setString(4,bean.getUser_status());
			
			pstm.executeUpdate();
			
			conn.commit();
		}catch(Exception sqle) {
			if(conn != null) {
			try {
				conn.rollback();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
			else {
				System.out.println("null입니다.");
			}
			throw new RuntimeException(sqle.getMessage());
		}finally {
			try {
				if(pstm != null) {
					pstm.close();
					pstm = null;
				}
				if(conn != null) {
					conn.close();
					conn = null;
				}
			}catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
}
