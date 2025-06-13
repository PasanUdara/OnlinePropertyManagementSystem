package com.propertypro.model.property;

public class User {
    private String userId;
    private String userType; 
    private String userName;
    private String email;
    private String phone;
    private String password;
    
  //constructor with details
	public User(String userId, String userType, String userName, String email, String phone, String password) {
		
		this.userId = userId;
		this.userType = userType;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}

	//get userId
	public String getUserId() {
		return userId;
	}
	
	//set userId
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	//get userType
	public String getUserType() {
		return userType;
	}
	
	//set userType
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	//get userName
	public String getUserName() {
		return userName;
	}
	
	//set userName
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	//get email
	public String getEmail() {
		return email;
	}
	
	//set email
	public void setEmail(String email) {
		this.email = email;
	}
	
	//get phone
	public String getPhone() {
		return phone;
	}
	
	//set phone
	public void setPhone(String phone) {
		this.phone = phone;
	}

	//get password
	public String getPassword() {
		return password;
	}
	
	//set password
	public void setPassword(String password) {
		this.password = password;
	}
    
	
    
    
   
}