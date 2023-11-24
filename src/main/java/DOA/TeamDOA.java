package DOA;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.management.RuntimeErrorException;

public class TeamDOA {
	private static TeamDOA instance;
	private TeamDOA() {}
	
	public static TeamDOA getinstance() {
		if(instance == null) instance = new TeamDOA();
		return instance;
	}
	
	public void AddCandidate(Team bean) {
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
			conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
			
			String query = "INSERT INTO MEMBER VALUES"
		}
	}

}
