package com.propertypro.servlet.property;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.model.property.Property;
import com.propertypro.service.property.PropertyControl;


@WebServlet("/DeleteAdProperty")
public class DeleteAdProperty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		boolean isTrue = PropertyControl.deleteproperty(id);
		
		if(isTrue) {
			String alert = "Delete Property";
			
			response.getWriter().println("<script>alert('"+alert+"');window.location.href='AllProperty';</script>");
			}
		
		else {
			
			
			
			RequestDispatcher dis2 = request.getRequestDispatcher("AllProperty");
			dis2.forward(request, response);
		}
	}

}
