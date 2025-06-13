package com.propertypro.service.payment;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.propertypro.model.payment.Insertpay;
import com.propertypro.util.DBConnection;


public class PaymentController {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertdata (String  paymentoption,String NameofCard,String Amount,String CardNumber,String ExpMonth,String ExpYear,String cvv,String userId)
{
		

		boolean isSuccess = false;
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement(); 

			//stmt.getConnection().createStatement();
			
			String sql = "INSERT INTO pay VALUES(0, '"+paymentoption+"', '"+NameofCard+"', '"+Amount+"', '"+CardNumber+"', '"+ExpMonth+"', '"+ExpYear+"', '"+cvv+"','"+userId+"')";

			int rs= stmt.executeUpdate(sql);
			if(rs>0) {
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
	
	public static List<Insertpay>getById(String Id){//mama wenas kara int ekata
		int convertedID = Integer.parseInt(Id);
		
		ArrayList <Insertpay> pay = new ArrayList<>();
		
		try {
			//DBconnection
			con = DBConnection.getConnection();
			stmt = con.createStatement(); 
			
			//Query
			String sql = "select * from pay where id '"+convertedID+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String paymentoption = rs.getString(2);
				String NameofCard = rs.getString(3);
				String Amount = rs.getString(4);
				String CardNumber = rs.getString(5);
				String ExpMonth = rs.getString(6);
				String ExpYear = rs.getString(7);
				String cvv = rs.getString(8);
				String userId = rs.getString(9);
				
				Insertpay pa = new Insertpay(id,paymentoption,NameofCard,Amount,CardNumber,ExpMonth,ExpYear,cvv,userId);
				pay.add(pa);
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return pay;
	}
	
	public static List<Insertpay>getuserById(String user){//mama wenas kara int ekata
		
		
		ArrayList <Insertpay> pay = new ArrayList<>();
		
		try {
			//DBconnection
			con = DBConnection.getConnection();
			stmt = con.createStatement(); 
			
			//Query
			String sql = "select * from pay where userId= '"+user+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String paymentoption = rs.getString(2);
				String NameofCard = rs.getString(3);
				String Amount = rs.getString(4);
				String CardNumber = rs.getString(5);
				String ExpMonth = rs.getString(6);
				String ExpYear = rs.getString(7);
				String cvv = rs.getString(8);
				String userId = rs.getString(9);
				
				Insertpay pa = new Insertpay(id,paymentoption,NameofCard,Amount,CardNumber,ExpMonth,ExpYear,cvv,userId);
				pay.add(pa);
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return pay;
	}
	
	//GetAllData
	public static List<Insertpay> getAllPay (){
		
		ArrayList <Insertpay> pays = new ArrayList<>();
		
		try {
			//DBconnection
			con = DBConnection.getConnection();
			stmt = con.createStatement(); 
			
			//Query
			String sql = "select * from pay ";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String paymentoption = rs.getString(2);
				String NameofCard = rs.getString(3);
				String Amount = rs.getString(4);
				String CardNumber = rs.getString(5);
				String ExpMonth = rs.getString(6);
				String ExpYear = rs.getString(7);
				String cvv = rs.getString(8);
				String userId = rs.getString(9);
				
				Insertpay pa = new Insertpay(id,paymentoption,NameofCard,Amount,CardNumber,ExpMonth,ExpYear,cvv,userId);
				pays.add(pa);
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return pays;
		
	}
	public static boolean updatedata(String id,String paymentoption,String NameofCard,String Amount,String CardNumber,String ExpMonth,String ExpYear,String cvv,String userId) {
		try {
			//DBconnection
			con = DBConnection.getConnection();
			stmt = con.createStatement(); 
			
			String sql= "update pay set paymentoption= '"+paymentoption+"',NameofCard= '"+NameofCard+"',Amount= '"+Amount+"',CardNumber= '"+CardNumber+"',ExpMonth= '"+ExpMonth+"',ExpYear= '"+ExpYear+"',cvv= '"+cvv+"',userId='"+userId+"'"
					+ "where id ='"+id+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return isSuccess;
	}
	//Delete data
	public static boolean deletedata(String id) {
		int convID = Integer.parseInt(id);
		try {
			//DBconnection
			con = DBConnection.getConnection();
			stmt = con.createStatement(); 
			String sql = "delete from pay where id = '"+convID+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
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
