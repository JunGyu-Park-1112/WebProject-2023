//ClassDOA.java
package DOA;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import javax.management.RuntimeErrorException;

import beans.ClassBeans;

public class ClassDOA {
	private static ClassDOA instance;
	private ClassDOA() {}
	   
	public static ClassDOA getInstance() {
	      if(instance == null) instance = new ClassDOA();
	      return instance;
	   }
	public void CreateClass(ClassBeans bean) {
		Connection conn = null;
	    PreparedStatement pstm = null;
	    
	    String jdbcurl = "jdbc:mariadb://testdb12.ctcd1mj9uzzg.ap-northeast-2.rds.amazonaws.com/testdb";
	    try {
	    	String driver = "org.mariadb.jdbc.Driver";                           //JDBC driver 로드
	        Class.forName(driver);
	        
	        conn = DriverManager.getConnection(jdbcurl,"root","ksm8828237!");
	        
	        String query = "INSERT INTO classinfo ( ClassName, profName, description, ClassNum ) VALUES(?,?,?,?)";             //쿼리
	        pstm = conn.prepareStatement(query);
	        
	        pstm.setString(1,bean.getClassName());
	        pstm.setString(2,bean.getprofName());
	        pstm.setString(3,bean.getdescription());
	        pstm.setString(4,bean.getClassNum());
	        
	        pstm.executeUpdate();
	        
	        conn.setAutoCommit(false);
	        
	        
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
	
	public List<ClassBeans> load() {
		List<ClassBeans> beanList = new ArrayList<>();
		Connection conn = null;
	    PreparedStatement pstm = null;
	    try {
	    	String driver = "org.mariadb.jdbc.Driver";                           //JDBC driver 로드
	        Class.forName(driver);
	        String jdbcurl = "jdbc:mariadb://testdb12.ctcd1mj9uzzg.ap-northeast-2.rds.amazonaws.com/testdb";
	        conn = DriverManager.getConnection(jdbcurl,"root","ksm8828237!");
	        
	        String query = "SELECT * FROM classinfo";             //쿼리
	        pstm = conn.prepareStatement(query);
	        
	        ResultSet rs = pstm.executeQuery(query);
	        
	        
	        while(rs.next()) {
	        	ClassBeans bean = new ClassBeans();
	        	bean.setClassName(rs.getString("Classname"));
		        bean.setprofName(rs.getString("profName"));
		        bean.setdescription(rs.getString("description"));
		        bean.setClassNum(rs.getString("ClassNum"));
		        
		        beanList.add(bean);
	        }
	        
	        rs.close();       //rs종료
	        return beanList;
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
	public boolean isEnd(int class_Num)
	{
		boolean Result = false;
		try {
			String driver = "org.mariadb.jdbc.Driver";                           //JDBC driver 로드
	        Class.forName(driver);
	        String jdbcurl = "jdbc:mariadb://testdb12.ctcd1mj9uzzg.ap-northeast-2.rds.amazonaws.com:3306/testdb";
	        Connection conn = DriverManager.getConnection(jdbcurl,"root","ksm8828237!");
	        
	        String query = "SELECT IsEnd FROM classinfo WHERE ClassNum = ?";
	        PreparedStatement pstm = conn.prepareStatement(query);
	        pstm.setInt(1, class_Num);
	        ResultSet rs = pstm.executeQuery();
	        
	        while(rs.next())
	        {
	        	if(rs.getInt("isEnd") == 1)
	        		Result = true;
	        	else
	        		Result = false;
	        }
		}catch(Exception e)
		{
			System.out.println("ClassDOA - isEnd() 오류 발생...");
		}
		return Result;
	}
}