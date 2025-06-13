package com.propertypro.service.property;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.propertypro.model.property.User;
import com.propertypro.util.DBConnection;



public class UserControl {
	
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stat=null;
	private static ResultSet rs=null;
	
	
	
	public static boolean registerUser(String userId, String userType, String userName, 
            String email, String phone, String password) {

		boolean isSuccess = false;
		
		try {
		con = DBConnection.getConnection();
		stat = con.createStatement();
		
		String sql = "INSERT INTO users VALUES(0,'"+userType+"','"+userName+"','"+email+"','"+phone+"','"+password+"')";
		
		int rs = stat.executeUpdate(sql);
		
		if(rs > 0) {
		isSuccess = true;
		} else {
		isSuccess = false;
		}
		
		} catch(Exception e) {
		e.printStackTrace();
		} finally {
		// Close resources in finally block
		try {
		if(stat != null) stat.close();
		if(con != null) con.close();
		} catch(Exception e) {
		e.printStackTrace();
		}
		}
		
		return isSuccess;
}
	
	public static List<User> validate (String mail,String pass){
		
		ArrayList <User> us = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			stat=con.createStatement();
			
			String sql = "select * from users where "+"email='"+mail+"' and password='"+pass+"'";
			 rs = stat.executeQuery(sql);
			
			if(rs.next()) {
				String userId = rs.getString(1);
				String userType = rs.getString(2);
				String userName = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(5);
				String password = rs.getString(6);
				
				User u = new User(userId,userType,userName,email,phone,password);
				us.add(u);
				
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		return us;
	}
}
