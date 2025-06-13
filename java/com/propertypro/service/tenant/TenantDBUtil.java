package com.propertypro.service.tenant;



import java.sql.Connection;
import java.util.List;

import com.propertypro.model.tenant.Tenant;
import com.propertypro.util.DBConnection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class TenantDBUtil {
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	public static boolean insertTenant(String name, String email, String phone, String property, String startDate, String endDate, String note, String image, String userId) {
		
		boolean isSuccess = false;
		
		try {
			
			conn = DBConnection.getConnection();
			
			stmt = conn.createStatement();
			
			String sql = "insert into  rent values(0,'"+name+"', '"+email+"', '"+phone+"', '"+property+"', '"+startDate+"', '"+endDate+"', '"+note+"', '"+image+"', '"+userId+"')";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				
				isSuccess = true;
				
			}else {
				
				isSuccess = false;
				
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
		return isSuccess;
	}
	
	
	
	public static List<Tenant> getAllTenants(){
		
		ArrayList<Tenant> tenants = new ArrayList<>();
		
		try {
			
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = "select * from rent";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String property = rs.getString(5);
				String startDate = rs.getString(6);
				String endDate = rs.getString(7);
				String note = rs.getString(8);
				String image = rs.getString(9);
				String userId = rs.getString(10);
				
				Tenant t = new Tenant(id, name, email, phone, property, startDate, endDate, note, image,userId);
				
				tenants.add(t);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return tenants;
	}
	
	
public static List<Tenant> getById(String ID){
		
		ArrayList<Tenant> tenant = new ArrayList<>();
		
		try {
			
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = "select * from rent where id = '"+ID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String property = rs.getString(5);
				String startDate = rs.getString(6);
				String endDate = rs.getString(7);
				String note = rs.getString(8);
				String image = rs.getString(9);
				String userId = rs.getString(10);
				
				Tenant t = new Tenant(id, name, email, phone, property, startDate, endDate, note, image,userId);
				
				tenant.add(t);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return tenant;
	}

public static List<Tenant>getTenantbyid(String user){
	
	
	ArrayList <Tenant> tenants = new ArrayList<>();
	
	try {
		//DBconnection
		conn = DBConnection.getConnection();
		stmt = conn.createStatement(); 
		
		//Query
		String sql = "select * from rent where userId= '"+user+"'";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String email = rs.getString(3);
			String phone = rs.getString(4);
			String property = rs.getString(5);
			String startDate = rs.getString(6);
			String endDate = rs.getString(7);
			String note = rs.getString(8);
			String image = rs.getString(9);
			String userId = rs.getString(10);
			
			Tenant t = new Tenant(id, name, email, phone, property, startDate, endDate, note, image,userId);
			tenants.add(t);
		}
	
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return tenants;
}
	
public static boolean updateTenant(String id, String name, String email, String phone, String property, String startDate, String endDate, String note, String image) {
    
    boolean isSuccess = false;
    
    try {
        conn = DBConnection.getConnection();
        stmt = conn.createStatement();
        
        String sql = "update rent set name='"+name+"', email='"+email+"', phone='"+phone+"', property='"+property+"', startDate='"+startDate+"', endDate='"+endDate+"', note='"+note+"', image='"+image+"' where id='"+id+"'";
        
        int rs = stmt.executeUpdate(sql);
        
        if(rs > 0) {
            isSuccess = true;
        } else {
            isSuccess = false;
        }
        
    } catch(Exception e) {
        e.printStackTrace();
    }
    
    return isSuccess;
}



public static boolean deleteTenant(String ID) {
	int conID = Integer.parseInt(ID);
	
	boolean isSuccess = false;
	
	try {
		conn=DBConnection.getConnection();
		stmt = conn.createStatement();
		
		
		//Sql query
		String sql ="delete from rent where id='"+conID+"'";	
		
		int rs = stmt.executeUpdate(sql);
		if(rs > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	return isSuccess;
}

}

