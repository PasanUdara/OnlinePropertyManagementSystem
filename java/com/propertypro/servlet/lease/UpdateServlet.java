package com.propertypro.servlet.lease;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.model.lease.leaseModel;
import com.propertypro.service.lease.leaseController;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); 
		String propertyId = request.getParameter("propertyId"); 
		String tenentId = request.getParameter("tenentId"); 
		String startDate = request.getParameter("startDate"); 
		String endDate = request.getParameter("endDate"); 
		String monthlyRent = request.getParameter("monthlyRent"); 
		String securityDeposit = request.getParameter("securityDeposit"); 
		String terms = request.getParameter("terms"); 
		
		boolean isTrue;
		isTrue = leaseController.updatedata(id, propertyId, tenentId, startDate, endDate, monthlyRent, securityDeposit, terms);
	
		if(isTrue == true) {
			List<leaseModel> leaseDetails = leaseController.getById(id);
			request.setAttribute("leaseDetails", leaseDetails);
			
			String alertMessage = "Data Update Successfully";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllServlet'</script>");
		 	
       
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
