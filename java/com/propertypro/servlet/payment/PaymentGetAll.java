package com.propertypro.servlet.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.model.payment.Insertpay;
import com.propertypro.service.payment.PaymentController;



@WebServlet("/PaymentGetAll")
public class PaymentGetAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		List <Insertpay> allpay = PaymentController.getuserById(userId);
		request.setAttribute("allpay", allpay);
		
	RequestDispatcher dispatcher = request.getRequestDispatcher("view/payment/PayDetails.jsp");
	dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}
	
}
