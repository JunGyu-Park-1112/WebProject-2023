package DOA;

import java.beans.Beans;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.management.RuntimeErrorException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.member;
public class memberDOA {
	private static memberDOA instance;
	private memberDOA() {}
	
	public static memberDOA getinstance() {
		if(instance == null) instance = new memberDOA();
		return instance;
	}
	
	public void joinMember_SignPage(member bean, HttpServletRequest request, HttpServletResponse response) {
	      Connection conn = null;
	      PreparedStatement pstm = null;
	      ResultSet rs = null;
	      
	      try {
	         String driver = "org.mariadb.jdbc.Driver";
	         Class.forName(driver);
	         String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testdb";
	         conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
	         
	         String query1 = "SELECT id FROM member WHERE id=?";
	         pstm = conn.prepareStatement(query1);
	         pstm.setString(1, bean.getId());
	         rs = pstm.executeQuery();
	         
	         if(rs.next()) {
	        	 request.setAttribute("errorMessage", "중복된 아이디(학번)입니다.");
	        	 RequestDispatcher dispatcher = request.getRequestDispatcher("signIn.jsp");
	        	 dispatcher.forward(request, response);
	         }
	         
	         pstm.clearParameters();
	         String query2 = "INSERT INTO MEMBER VALUES(?,?,?,?)";
	         pstm = conn.prepareStatement(query2);
	         
	         pstm.setString(1,bean.getUser_name());
	         pstm.setString(2,bean.getId());
	         pstm.setString(3, bean.getPw());
	         pstm.setString(4,bean.getUser_status());
	         
	         pstm.executeUpdate();
	         
	         conn.commit();
	      }catch(Exception sqle) {
	         try {
	            conn.rollback();
	         }catch(SQLException e) {
	            e.printStackTrace();
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
	public void compareID(member bean, HttpServletRequest request, HttpServletResponse response) {
		   Connection conn = null;
		   PreparedStatement pstm = null;
		   ResultSet rs = null;
		   
		   
		   try {
		         String driver = "org.mariadb.jdbc.Driver";
		         Class.forName(driver);
		         String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testdb";
		         conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
		         String query = "SELECT * FROM member WHERE id=? AND pw=?";
		         pstm = conn.prepareStatement(query);
		         /*
		          * System.out.println(bean.getId());
		          *	System.out.println(bean.getPw());
		          */
		         pstm.setString(1, bean.getId());
		         pstm.setString(2, bean.getPw());
		         rs = pstm.executeQuery();
		         HttpSession session = request.getSession();
		         if(rs.next()) {
		        	 session.setAttribute("id", rs.getString("id"));
		        	 session.setAttribute("pw", rs.getString("pw"));
		        	 session.setAttribute("user_name", rs.getString("user_name"));
		        	 session.setAttribute("user_status", rs.getString("user_status"));
		        	 /*
		        	  * System.out.println(rs.getString("user_name"));
		        	  * System.out.println(rs.getString("user_status"));
		        	  */
		        	 response.sendRedirect("mainPage.jsp");
		         }
		         else {
		        	 request.setAttribute("errorMessage", "로그인에 실패했습니다.");
		        	 RequestDispatcher dispatcher = request.getRequestDispatcher("homePage.jsp");
		        	 dispatcher.forward(request, response);
		         }
		   }catch (Exception e) {
	           e.printStackTrace();
	       } finally {
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
