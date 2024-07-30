package model;

import java.io.Serializable;



public class UserModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String firstName;
	private String lastName;
	private String userName;
	private String email;
	private String password;
	private String repassword;
	private String phoneNumber;
	private String address;


	
	/*Default Constructor*/
	public UserModel() 
	{
		
	}
	
	/*Constructor with parameters*/
	public UserModel(String firstName, String lastName, String address, String phoneNumber, String email, String userName,String password, String repassword) 
	{
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.userName = userName;
		this.password = password;
		this.repassword = repassword;
		
		
		
		
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}




	
	

}
