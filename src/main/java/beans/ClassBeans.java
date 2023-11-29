package beans;

public class ClassBeans {
	private String ClassName;
	private String profName;
	private String description;
	private String ClassNum;
	
	public ClassBeans() {}
	public ClassBeans(String ClassName,String profName,String description,String ClassNum) {
		this.ClassName = ClassName;
		this.profName = profName;
		this.description = description;
		this.ClassNum = ClassNum;
	}
	public String getClassName() {
		return ClassName;
	}
	public String getprofName() {
		return profName;
	}
	public String getdescription() {
		return description;
	}
	public String getClassNum() {
		return ClassNum;
	}
	
	public void setClassName(String ClassName) {
		this.ClassName = ClassName;
	}
	public void setprofName(String profName) {
		this.profName = profName;
	}
	public void setdescription(String description) {
		this.description = description;
	}
	public void setClassNum(String ClassNum) {
		this.ClassNum = ClassNum;
	}
}