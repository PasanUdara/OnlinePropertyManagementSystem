package com.propertypro.model.payment;

public class Insertpay {
	private int id;
	private String  paymentoption;
	private String NameofCard;
	private String Amount;
	private String CardNumber;
	private String ExpMonth;
	private String ExpYear;
	private String cvv;
	private String userId;
	
	public Insertpay(int id, String paymentoption, String nameofCard, String amount, String cardNumber, String expMonth,
			String expYear, String cvv, String userId) {
		super();
		this.id = id;
		this.paymentoption = paymentoption;
		this.NameofCard = nameofCard;
		this.Amount = amount;
		this.CardNumber = cardNumber;
		this.ExpMonth = expMonth;
		this.ExpYear = expYear;
		this.cvv = cvv;
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPaymentoption() {
		return paymentoption;
	}
	public void setPaymentoption(String paymentoption) {
		this.paymentoption = paymentoption;
	}
	public String getNameofCard() {
		return NameofCard;
	}
	public void setNameofCard(String nameofCard) {
		NameofCard = nameofCard;
	}
	public String getAmount() {
		return Amount;
	}
	public void setAmount(String amount) {
		Amount = amount;
	}
	public String getCardNumber() {
		return CardNumber;
	}
	public void setCardNumber(String cardNumber) {
		CardNumber = cardNumber;
	}
	public String getExpMonth() {
		return ExpMonth;
	}
	public void setExpMonth(String expMonth) {
		ExpMonth = expMonth;
	}
	public String getExpYear() {
		return ExpYear;
	}
	public void setExpYear(String expYear) {
		ExpYear = expYear;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	

}

