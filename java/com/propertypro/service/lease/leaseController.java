package com.propertypro.service.lease;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.propertypro.model.lease.leaseModel;
import com.propertypro.util.DBConnection;

public class leaseController {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static boolean insertData(String propertyId, String tenentId, String startDate, String endDate,
			String monthlyRent, String securityDeposit, String terms) {
		boolean isSuccess = false;
		try {
			// DBconnection Call
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO lease (propertyId, tenentId, startDate , endDate, monthlyRent, securityDeposit, terms ) VALUES ('"
					+ propertyId + "', '" + tenentId + "', '" + startDate + "', '" + endDate + "', '" + monthlyRent
					+ "','" + securityDeposit + "','" + terms + "')";

			int rs = stmt.executeUpdate(sql);
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	// GetByID
	public static List<leaseModel> getById(String Id) {
		int convertedID = Integer.parseInt(Id);

		ArrayList<leaseModel> lease = new ArrayList<>();

		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM lease WHERE id = '" + convertedID + "'";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String propertyId = rs.getString(2);
				String tenentId = rs.getString(3);
				String startDate = rs.getString(4);
				String endDate = rs.getString(5);
				String monthlyRent = rs.getString(6);
				String securityDeposit = rs.getString(7);
				String terms = rs.getString(8);

				leaseModel lm = new leaseModel(id, propertyId, tenentId, startDate, endDate, monthlyRent,
						securityDeposit, terms);

				lease.add(lm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lease;
	}

	// GetAll data
	public static List<leaseModel> getAllLease() {
		ArrayList<leaseModel> leaseN = new ArrayList<>();

		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			String sql = "select * from lease";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String propertyId = rs.getString(2);
				String tenentId = rs.getString(3);
				String startDate = rs.getString(4);
				String endDate = rs.getString(5);
				String monthlyRent = rs.getString(6);
				String securityDeposit = rs.getString(7);
				String terms = rs.getString(8);

				leaseModel lm = new leaseModel(id, propertyId, tenentId, startDate, endDate, monthlyRent,
						securityDeposit, terms);

				leaseN.add(lm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return leaseN;
	}

	// UPDATE CONTROLL
	public static boolean updatedata(String id, String propertyId, String tenentId, String startDate, String endDate,
			String monthlyRent, String securityDeposit, String terms) {
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			String sql = "UPDATE lease SET propertyId = '" + propertyId + "', tenentId = '" + tenentId
					+ "', startDate = '" + startDate + "', endDate = '" + endDate + "', monthlyRent = '" + monthlyRent
					+ "', securityDeposit = '" + securityDeposit + "', terms = '" + terms + "' WHERE id = '" + id + "'";

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	// DELETE CONTROLL
	public static boolean deletedata(String id) {
		int convID = Integer.parseInt(id);
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();

			String sql = "delete from lease where id = '"+convID+"'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}
