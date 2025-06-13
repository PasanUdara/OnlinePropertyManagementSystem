package com.propertypro.service.property;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.propertypro.model.property.Property;
import com.propertypro.util.DBConnection;

public class PropertyControl {
	
	
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stat=null;
	private static ResultSet rs=null;
	
	
	//insert new property details to DB
	public static boolean insertdata(String title, String description, String type, String price, String bedrooms,
			String bathrooms, String areaSqft, String location, String status, String userId,String imagePath) {
		boolean isSuccess= false;
		try {
			con=DBConnection.getConnection();//get db connection
			stat = con.createStatement();//create sql statement
			
			//insert data query
			String sql = "insert into properties values(0,'"+title+"','"+description+"','"+type+"','"+price+"','"+bedrooms+"','"+bathrooms+"','"+areaSqft+"','"+location+"','"+status+"','"+userId+"','"+imagePath+"')";
			
			//execute insert 
			int rs= stat.executeUpdate(sql);
			
			//check affected rows
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			}catch(Exception e) {
				e.printStackTrace(); //logs any exception
			}
		return isSuccess;
	}
	
	
	public static List<Property> getById (String ID){
		//convert string to integer
		int conID = Integer.parseInt(ID);
		
		//array list to store data 
		ArrayList <Property> prop = new ArrayList<>();
		
		try {
			con=DBConnection.getConnection();//get db connection
			stat = con.createStatement();//create sql statement
			
			//select properties from specific property id
			String sql = "select * from properties where id ='"+conID+"'";
			
			//execute query
			rs= stat.executeQuery(sql);
			
			//results
			while(rs.next()) {
				String id = rs.getString(1);
				String title= rs.getString(2);
				String description= rs.getString(3);
				String type= rs.getString(4);
				String price= rs.getString(5);
				String bedrooms= rs.getString(6);
				String bathrooms= rs.getString(7);
				String areaSqft= rs.getString(8);
				String location= rs.getString(9);
				String status= rs.getString(10);
				String userId= rs.getString(11);
				String imagePath = rs.getString(12);
				
				//database rows into property obj
				Property pk = new Property(id,title,description,type,price,bedrooms,bathrooms,areaSqft,location,status,userId,imagePath);
				prop.add(pk);//add obj to arraylist
			}
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();//logs any exception
		}
		
		return prop;
	}
	
	public static List<Property> getownerPById (String userID){
		//int conID = Integer.parseInt(userID);
		
		
		//array list to store data 
		ArrayList <Property> prop = new ArrayList<>();
		
		try {
			con=DBConnection.getConnection();//get db connection
			stat = con.createStatement();//create sql statement
			
			//select properties from specific userID
			String sql = "select * from properties where userId= '"+userID+"'";
			
			rs= stat.executeQuery(sql);//execute query
			
			
			//results
			while(rs.next()) {
				String id = rs.getString(1);
				String title= rs.getString(2);
				String description= rs.getString(3);
				String type= rs.getString(4);
				String price= rs.getString(5);
				String bedrooms= rs.getString(6);
				String bathrooms= rs.getString(7);
				String areaSqft= rs.getString(8);
				String location= rs.getString(9);
				String status= rs.getString(10);
				String userId= rs.getString(11);
				String imagePath = rs.getString(12);
				
				//database rows into property obj
				Property pk = new Property(id,title,description,type,price,bedrooms,bathrooms,areaSqft,location,status,userId,imagePath);
				prop.add(pk);//add obj to arraylist
			}
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace(); //logs any exception
		}
		
		return prop;
	}
	
	public static List<Property> getAll (){
		
		
		ArrayList <Property> al = new ArrayList<>();
		
		try {
			con=DBConnection.getConnection(); //get db connection
			stat = con.createStatement();//create sql statement
			
			
			String sql = "select * from properties";//select properties 
			
			rs= stat.executeQuery(sql);//execute query
			
			//results
			while(rs.next()) {
				String id = rs.getString(1);
				String title= rs.getString(2);
				String description= rs.getString(3);
				String type= rs.getString(4);
				String price= rs.getString(5);
				String bedrooms= rs.getString(6);
				String bathrooms= rs.getString(7);
				String areaSqft= rs.getString(8);
				String location= rs.getString(9);
				String status= rs.getString(10);
				String userId= rs.getString(11);
				String imagePath = rs.getString(12);
				
				//database rows into property obj
				Property pk = new Property(id,title,description,type,price,bedrooms,bathrooms,areaSqft,location,status,userId, imagePath);
				al.add(pk);//add obj to arraylist
			}
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace(); //logs any exception
		}
		
		return al;
	}
	
	//function for property update
	public static boolean updateproperty(String ID,String title, String description, String type, String price, String bedrooms,String bathrooms, String areaSqft, String location, String status, String userId,String imagePath) {
		
		//int conID = Integer.parseInt(ID);
		
		try {
			con=DBConnection.getConnection(); //get db connection
			stat = con.createStatement();//create sql statement
			
			
			
			//update sql query for specific property id
			String sql = "update properties set title='"+title+"',description='"+description+"',type='"+type+"',price='"+price+"',bedrooms='"+bedrooms+"',bathrooms='"+bathrooms+"',areaSqft='"+areaSqft+"',location='"+location+"',status='"+status+"',userId='"+userId+"',imagePath='"+imagePath+"' where id='"+ID+"'";
							
			
			
			int rs = stat.executeUpdate(sql);
			//check affected rows
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
			}catch(Exception e) {
				e.printStackTrace(); //logs any exception
			}
		
		
		
		return isSuccess;
	}
	
	//function for property delete
	public static boolean deleteproperty(String ID) {
		
		//convert string to integer
		int conID = Integer.parseInt(ID);
		
		try {
			con=DBConnection.getConnection(); //get db connection
			stat = con.createStatement();//create sql statement
			
			
			//delete sql query for specific property id
			String sql ="delete from properties where id='"+conID+"'";			
			int rs = stat.executeUpdate(sql);
			
			//check affected rows
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
			}catch(Exception e) {
				e.printStackTrace(); //logs any exception
			}
		
		
		
		return isSuccess;
	}
	
}

