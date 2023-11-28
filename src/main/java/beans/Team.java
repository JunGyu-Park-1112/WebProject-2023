package beans;

import java.util.List;

public class Team {
	private String class_identifier;
	private String team_name;
	private String team_description;
	private String team_host;
	private List team_candidate;
	private int Flag;
	
	public Team() {}
	public Team(String identifier,String team_name,String description,String host,List candidate, int Flag) {
		this.class_identifier = identifier;
		this.team_name = team_name;
		this.team_description = description;
		this.team_host = host;
		this.team_candidate = candidate;
		this.Flag = Flag;
	}
	public String getClass_identifier() {return class_identifier;}
	public String getTeam_name() {return team_name;}
	public String getTeam_description() {return team_description;}
	public String getTeam_host() {return team_host;}
	public List getTeam_candidate() {return team_candidate;}
	public int getFlag() {return Flag;}
	
	public void setClass_identifier(String identifier) {
		this.class_identifier = identifier;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public void setTeam_description(String description) {
		this.team_description = description;
	}
	public void setTeam_host(String host) {
		this.team_host = host;
	}
	public void setTeam_candidate(List candidate) {
		this.team_candidate = candidate;
	}
	public void setFlag(int Flag) {
		this.Flag = Flag;
	}
}
