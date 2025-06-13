package com.propertypro.servlet.property;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.service.property.UserControl;




@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        
		// retrieve all parameters
		String userId = request.getParameter("userId");
		String userType = request.getParameter("userType");
	     String userName = request.getParameter("userName");
	     String email = request.getParameter("email");
	     String phone = request.getParameter("phone");
	     String password = request.getParameter("password");
	    
	     
	   
	     // insert register data 
	     boolean isSuccess ;
	     isSuccess  = UserControl.registerUser( userId, userType, userName,email,phone,password);
	     
	     if(isSuccess ) {
	    	 String alertMessage = "Register Successful";
	    	 response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='view/property/login.jsp'</script>"); }
	     else {
	    	 RequestDispatcher dis2 = request.getRequestDispatcher("view/property/login.jsp");
	    	 dis2.forward(request, response);
	     }
	     

	}
}