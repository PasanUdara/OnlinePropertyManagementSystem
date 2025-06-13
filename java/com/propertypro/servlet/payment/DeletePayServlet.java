package com.propertypro.servlet.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.model.payment.Insertpay;
import com.propertypro.service.payment.PaymentController;



@WebServlet("/DeletePayServlet")
public class DeletePayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		String userId= request.getParameter("userId");
		boolean isTrue;
		isTrue = PaymentController.deletedata(id);
		if(isTrue == true) {
			String alertMessage = "Delete successful";
			response.getWriter().println("<script> alert ('"+alertMessage+"');"+"window.location.href='PayAll?userid=" + userId + "'</script>");
		}
		else {
			List<Insertpay> paydetails = PaymentController.getById(id);
			request.setAttribute("paydetails", paydetails);
			
			 RequestDispatcher dispatch = request.getRequestDispatcher("wrong.jsp");
	            dispatch.forward(request, response);
		}
	}

}
