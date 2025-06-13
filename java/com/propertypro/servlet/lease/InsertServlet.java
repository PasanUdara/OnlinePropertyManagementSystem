package com.propertypro.servlet.lease;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.service.lease.leaseController;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String propertyId = request.getParameter("propertyId"); 
		String tenentId = request.getParameter("tenentId"); 
		String startDate = request.getParameter("startDate"); 
		String endDate = request.getParameter("endDate"); 
		String monthlyRent = request.getParameter("monthlyRent"); 
		String securityDeposit = request.getParameter("securityDeposit"); 
		String terms = request.getParameter("terms"); 
		
		boolean isTrue;
		
		isTrue = leaseController.insertData(propertyId, tenentId, startDate, endDate, monthlyRent, securityDeposit, terms);
		
		if(isTrue == true) {
			//response.sendRedirect("GetAllServlet");
			
			String alertMessage = "Data insert Successfully";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllServlet'</script>");
		 	
            /*✅✅✅ ADDED: Proper content type + fixed JavaScript alert and redirect
            response.setContentType("text/html");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Data Inserted Successfully');");  // Success message
            response.getWriter().println("window.location.href = 'GetAllServlet';");  // Correct lowercase 'window'
            response.getWriter().println("</script>");*/ 
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}

	}

}
