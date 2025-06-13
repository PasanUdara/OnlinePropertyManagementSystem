package com.propertypro.servlet.payment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.service.payment.PaymentController;



@WebServlet("/InserServlet")
public class InserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    //form values assign to java variables  
		    String paymentoption = request.getParameter("paymentoption");  // Match form field name exactly
	        String NameofCard = request.getParameter("NameofCard");
	        String Amount = request.getParameter("Amount");
	        String CardNumber = request.getParameter("CardNumber");
	        String ExpMonth = request.getParameter("ExpMonth");
	        String ExpYear = request.getParameter("ExpYear");
	        String cvv = request.getParameter("cvv");
	        String userId = request.getParameter("userId");
	        
	        
	        boolean isTrue = PaymentController.insertdata(paymentoption, NameofCard, Amount, CardNumber, ExpMonth, ExpYear, cvv, userId);

	        
	        if (isTrue==true) {
	            String alertMessage = "Insert successful";
	            String user = java.net.URLEncoder.encode(userId,"UTF-8");
	            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='PaymentGetAll?userId="+user+"' </script>");
	        } else {
	            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
	            dis2.forward(request, response);
	        }
		
	}

}
