//ClassDOA.java
package DOA;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import beans.Description;

public class DescriptionDOA {
	private static DescriptionDOA instance;
	private DescriptionDOA() {}
	
	public static DescriptionDOA getInstance() {
		if(instance == null) instance = new DescriptionDOA();
		return instance;
	}
	public List<Description> loadDescription(int classNum) {
		List<Description> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			String driver = "org.mariadb.jdbc.Driver";    
			Class.forName(driver);
			String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
			conn = DriverManager.getConnection(jdbcurl,"root","ksm8828237!");
			
			String query = "SELECT * FROM description WHERE class_Num = ?;";
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, classNum);
			
			ResultSet rs = pstm.executeQuery();
			
			
			while(rs.next())
			{
				Description description = new Description();
				description.setClass_Num(rs.getInt("class_Num"));
				description.setId(rs.getString("id"));
				description.setUser_description(rs.getString("user_description"));
				description.setUser_name(rs.getString("user_name"));
				list.add(description);
			}
			rs.close();
			return list;
		}
		    catch(Exception sqle) {
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
	public void AddDescription(String user_name, String id, String user_description, int class_Num)
	{
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testdb";
			conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
			String query = "INSERT INTO description (user_name, id, user_description, class_Num) VALUES(?,?,?,?);";
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1,user_name);
			pstm.setString(2, id);
			pstm.setString(3, user_description);
			pstm.setInt(4, class_Num);
			
			pstm.executeUpdate();
			conn.commit();
			
			pstm.close();
			conn.close();
		}catch(Exception e)
		{
			System.out.println("에러 발생... -AddDescription" + e.getMessage());
		}
	}
	}
