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



@WebServlet("/DeleteServ")
public class DeleteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get parameters from user id
		String userId = request.getParameter("userId");
		String id = request.getParameter("id");//get parameters from property id
		boolean isTrue = PropertyControl.deleteproperty(id); //call delete method in property_control
		
		if(isTrue ) {
	    	
	    	 String alertMessage = "delete property";
	    	 String User = java.net.URLEncoder.encode(userId, "UTF-8"); // url encode the userId 
	    	 response.getWriter().println("<script> alert ('"+alertMessage+"');"+"window.location.href='GetAllServ?userId=" + User + "'</script>");
	     }
	     else {
	    	 List <Property> pro = PropertyControl.getById(id);// get the property details couldn't delete
	    	 request.setAttribute("property", pro);// Store property details
	    	 String User = java.net.URLEncoder.encode(userId,"UTF-8");
	    	 RequestDispatcher dis2 = request.getRequestDispatcher("GetAllServ?userId='" + User + "'");
	    	 dis2.forward(request, response);//forward request and response to page
	     }
	}

}
