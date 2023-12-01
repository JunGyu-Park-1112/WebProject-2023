package DOA;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import beans.Team;

public class TeamDOA {
	private static TeamDOA instance;
	private TeamDOA() {}
	
	public static TeamDOA getInstance() {
		if(instance == null) instance = new TeamDOA();
		return instance;
	}
	public List<Team> loadTeam(int classNum){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Team> Teams = new ArrayList<>();
		
		try {
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
			
			conn = DriverManager.getConnection(jdbcurl, "root", "ksm8828237!");
			if(conn != null)
				System.out.println("DB 접속 성공! - TeamDOA");
			
			String query = "SELECT * FROM team WHERE class_Num = ?;";
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, classNum);
			
			rs = pstm.executeQuery();
			
			while(rs.next())
			{
				Team team = new Team();
				team.setClass_Num(rs.getString("class_Num"));
	            team.setTeam_name(rs.getString("team_name"));
	            team.setTeam_description(rs.getString("team_description"));
	            team.setTeam_host(rs.getString("team_host"));
	            team.setFlag(rs.getInt("FLAG"));
	            
	            //rs에서 String으로 받아온 값을, 리스트의 형태로 분리하여 Beans에 저장하여야 한다.
	            List<String> candidate_List = new ArrayList<>();
	            String candidates = rs.getString("team_candidate");
	            for(int i = 0; i + 3 < candidates.length(); i+=3)
	            {
	            	String candidate = candidates.substring(i,i+3);
	            	candidate_List.add(candidate);
	            }
	            
	            team.setTeam_candidate(candidate_List);
	            Teams.add(team);
			}
			rs.close();
			pstm.close();
			conn.close();
			
		} catch(Exception e) {
			System.out.println("예외 발생..." + e.getMessage());
		}
		return Teams;
	}
	
	public Team LoadTeamInfo(String hostName, int classNum)
	{
		Team team = new Team();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			String driver = "org.mariadb.jdbc.Driver";
			Class.forName(driver);
			String jdbcurl = "jdbc:mariadb://127.0.0.1:3306/testDB";
			
			conn = DriverManager.getConnection(jdbcurl,"root","ksm8828237!");
			if(conn != null)
				System.out.println("DB 접속 성공 - TeamDOA");
			
			String query = "SELECT * FROM team WHERE team_host = ? AND class_Num = ?;";
			pstm = conn.prepareStatement(query);
			pstm.setString(1,hostName);
			pstm.setInt(2,classNum);
			
			rs = pstm.executeQuery();
			while(rs.next())
			{
	            team.setTeam_name(rs.getString("team_name"));
	            team.setTeam_description(rs.getString("team_description"));
	            team.setTeam_host(rs.getString("team_host"));
	            team.setFlag(rs.getInt("FLAG"));
	            
	          //rs에서 String으로 받아온 값을, 리스트의 형태로 분리하여 Beans에 저장하여야 한다.
	            List<String> candidate_List = new ArrayList<>();
	            String candidates = rs.getString("team_candidate");
	            for(int i = 0; i + 3 <= candidates.length(); i+=3)
	            {
	            	String candidate = candidates.substring(i,i+3);
	            	candidate_List.add(candidate);
	            	System.out.println(candidate);
	            }
	            team.setTeam_candidate(candidate_List);
			}
			rs.close();
            pstm.close();
            conn.close();
		}catch(Exception e)
		{
			System.out.println("에러 발생..." + e.getMessage());
		}
		return team;
		
	}
}
