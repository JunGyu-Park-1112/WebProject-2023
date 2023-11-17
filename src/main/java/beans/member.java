package beans;

public class member {
	private String user_name;
	private String id;
	private String pw;
	private String user_status;
	
	public member(String user_name, String id, String pw, String user_status){
		this.user_name = user_name;
		this.id = id;
		this.pw = pw;
		this.user_status = user_status;
	}
	
	public member() {}
	
	public String getUser_name() {return user_name;}
	public String getId() {return id;}
	public String getPw() {return pw;}
	public String getUser_status() {return user_status;}
	
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
}