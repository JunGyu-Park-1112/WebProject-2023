package beans;

public class Description {
	private String user_name;
	private String id;
	private String user_description;
	private int class_Num;
	
	public void setUser_name(String name){
		user_name = name;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setUser_description(String description) {
		user_description = description;
	}
	public void setClass_Num(int num) {
		class_Num = num;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public String getId() {
		return id;
	}
	public  String getUser_description() {
		return user_description;
	}
	public int getClass_Num() {
		return class_Num;
	}
}
