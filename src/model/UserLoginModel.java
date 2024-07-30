package model;

public class UserLoginModel {
	private String userName;
	private String password;
	
	/*Constructor with parameter*/
	public UserLoginModel(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUsername(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}