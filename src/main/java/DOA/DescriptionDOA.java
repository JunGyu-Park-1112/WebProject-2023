//ClassDOA.java
package DOA;

import java.util.ArrayList;
import java.util.Collections;
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
			String jdbcurl = "jdbc:mariadb://testdb12.ctcd1mj9uzzg.ap-northeast-2.rds.amazonaws.com:3306/testdb";
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
			String jdbcurl = "jdbc:mariadb://testdb12.ctcd1mj9uzzg.ap-northeast-2.rds.amazonaws.com:3306/testdb";
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

	 public void makeRandom(int class_Num) {
	      Connection conn = null;
	       PreparedStatement pstm = null;
	       PreparedStatement update_pstm = null;
	       PreparedStatement fupdate_pstm = null;
	       PreparedStatement End_pstm = null;
	       
	       ResultSet rs = null;
	       
	       try {
	            String driver = "org.mariadb.jdbc.Driver";
	            Class.forName(driver);
	            String jdbcurl = "jdbc:mariadb://testdb12.ctcd1mj9uzzg.ap-northeast-2.rds.amazonaws.com:3306/testdb";
	            conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
	            
	            //description Table에서 현재 Team이 완성되지 않은 User들의 List 생성
	            String query =  "SELECT * FROM description WHERE flag = 0 AND class_Num = ?";        
	            pstm = conn.prepareStatement(query);   
	            pstm.setInt(1, class_Num);   
	            
	            rs = pstm.executeQuery(); 
	            
	            List<String> peopleList = new ArrayList<>();   
	            while(rs.next()) {         
	               String user_Name = rs.getString("user_name");
	               peopleList.add(user_Name);
	            }
	            Collections.shuffle(peopleList);   
	            int groupCount = 1;      
	            
	            //랜덤으로 만들어진 Team을 team Table에 추가
	            String update_query = "INSERT into team (team_name, team_description, team_host, team_candidate, FLAG, class_Num) values(?,?,?,?,?,?);";   
	            update_pstm=conn.prepareStatement(update_query);
	            System.out.println(peopleList.size());
	            
	            for (int i = 0; i < peopleList.size(); i += 3) {
	               String team_name = "랜덤생성팀" + groupCount++;
	               String team_host = peopleList.get(i);   
	               String team_description = "랜덤생성된 팀입니다.";   
	               String teamCandidate1 = (i + 1 < peopleList.size()) ? peopleList.get(i + 1) : ""; 
	               String teamCandidate2 = (i + 2 < peopleList.size()) ? peopleList.get(i + 2) : "";   
	               
	               String team_candidate = teamCandidate1 + teamCandidate2;    
	               update_pstm.setString(1, team_name);         
	               update_pstm.setString(2, team_description);
	               update_pstm.setString(3, team_host);
	               update_pstm.setString(4, team_candidate);
	               update_pstm.setInt(5, 1);            
	               update_pstm.setInt(6, class_Num);
	               
	               update_pstm.executeUpdate();
	            }      
	            
	            //Description에 Team이 배정된 인원들의 flag를 1로 설정
	            String fupdate_query = "UPDATE description SET flag = 1 WHERE class_Num=? AND user_name=?";       
	            fupdate_pstm = conn.prepareStatement(fupdate_query);
	            
	            for(int i = 0; i < peopleList.size(); i++) {
	               String update_name = peopleList.get(i);
	               fupdate_pstm.setInt(1, class_Num);
	               fupdate_pstm.setString(2, update_name);
		           fupdate_pstm.executeUpdate();
	            }
	            
	            
	            //Class의 IsEnd를 1로 설정함으로서, 해당 Team의 팀 만들기를 종료함...
	            String End_Query = "UPDATE classinfo SET IsEnd = 1 	WHERE ClassNum = ?";
	            End_pstm = conn.prepareStatement(End_Query);
	            End_pstm.setInt(1, class_Num);
	            End_pstm.executeUpdate();
	       }
	       catch (ClassNotFoundException | SQLException e) {
	           e.printStackTrace();
	       } 
	       finally {
	           // 연결 및 리소스 해제
	           try {
	               if (rs != null) rs.close();
	               if (pstm != null) pstm.close();
	               if (update_pstm != null) update_pstm.close();
	               if (fupdate_pstm != null) fupdate_pstm.close();
	               if (conn != null) conn.close();
	               
	           } catch (SQLException e) {
	               e.printStackTrace();
	           }
	       }
	   
	   }
	}
