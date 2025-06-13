package com.propertypro.servlet.property;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.propertypro.model.property.User;
import com.propertypro.service.property.UserControl;




@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// retrieve login parameters
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		String userId = request.getParameter("userId");
		String type = request.getParameter("type");
	try {
		// validate credentials
		List <User> login = UserControl.validate(mail, pass);
		
		//success
		if(login != null && !login.isEmpty()) {
			User user = login.get(0);// get first user
			type= user.getUserType();
			String dashboardUrl;
			
			HttpSession session = request.getSession();
			session.setAttribute("username", user.getUserName());
			
			if(type.equals("owner")) {
				dashboardUrl = "view/property/ownerDashboard.jsp?userId=" + user.getUserId() + "&userName=" + URLEncoder.encode(user.getUserName(), "UTF-8");
			
			} 
			else if(type.equals("admin")) {
				dashboardUrl = "view/property/adminDashboard.jsp?userId=" + user.getUserId() + "&userName=" + URLEncoder.encode(user.getUserName(), "UTF-8");
			
			} else {
				// Default dashboard (you can modify this as needed)
				dashboardUrl = "view/property/userDashboard.jsp?userId=" + user.getUserId() + "&userName=" + URLEncoder.encode(user.getUserName(), "UTF-8")
; 
			}
			request.getSession().setAttribute("user", user);//create session
			String alert = "Login Success";
			
			response.getWriter().println("<script>alert('"+alert+"');window.location.href='"+dashboardUrl+"  '</script>");
			
			
		}else {
			// display error message and  back to login
			String alert = "Invalid login credentials";
			response.getWriter().println("<script>alert('"+alert+"');window.location.href='view/property/login.jsp'</script>");
            
		}
		
		
		
	}catch(Exception e) {
		e.printStackTrace();//log any error
	}
	
}
}
