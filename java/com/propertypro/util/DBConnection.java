package com.propertypro.util;



import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	
		private static String host = "jdbc:mysql://localhost:3306/propertymanagement";
		private static String username = "root";
		private static String password = "password";
		private static Connection conn;
		
		public static Connection getConnection() {
			
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(host, username, password);
			
			System.out.println("Connected to MYSQL database...");
			
		}catch(Exception e) {
			System.out.println("Failed to connect to MySQL database");
			e.printStackTrace();
		}
		
		return conn;

	}
}


