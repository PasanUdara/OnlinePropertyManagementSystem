package com.propertypro.model.lease;


public class leaseModel {
	private int id;
	private String propertyId;
	private String tenentId;
	private String startDate;
	private String endDate;
	private String monthlyRent;
	private String securityDeposit;
	private String terms;
	
	
	public leaseModel(int id, String propertyId, String tenentId, String startDate, String endDate,String monthlyRent, String securityDeposit, String terms) {
		super();
		this.id = id;
		this.propertyId = propertyId;
		this.tenentId = tenentId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.monthlyRent = monthlyRent;
		this.securityDeposit = securityDeposit;
		this.terms = terms;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getPropertyId() {
		return propertyId;
	}


	public void setPropertyId(String propertyId) {
		this.propertyId = propertyId;
	}


	public String getTenentId() {
		return tenentId;
	}


	public void setTenentId(String tenentId) {
		this.tenentId = tenentId;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getMonthlyRent() {
		return monthlyRent;
	}


	public void setMonthlyRent(String monthlyRent) {
		this.monthlyRent = monthlyRent;
	}


	public String getSecurityDeposit() {
		return securityDeposit;
	}


	public void setSecurityDeposit(String securityDeposit) {
		this.securityDeposit = securityDeposit;
	}


	public String getTerms() {
		return terms;
	}


	public void setTerms(String terms) {
		this.terms = terms;
	}
	
	
}

