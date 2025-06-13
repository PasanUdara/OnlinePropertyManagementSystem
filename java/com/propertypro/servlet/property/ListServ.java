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




@WebServlet("/ListServ")
public class ListServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// retrieve all properties from the database
		List <Property> allp = PropertyControl.getAll();
		request.setAttribute("allp", allp);
		
		// set the properties list
		RequestDispatcher disp = request.getRequestDispatcher("view/property/propertyList.jsp");
		
		disp.forward(request, response);
	}
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request,response);
	}

}
