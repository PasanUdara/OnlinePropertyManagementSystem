package com.propertypro.servlet.tenant;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.service.tenant.TenantDBUtil;



@WebServlet("/DeleteTenant")
public class DeleteTenant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		boolean isTrue = TenantDBUtil.deleteTenant(id);
		
		if(isTrue ) {
	    	
	    	 String alertMessage = "delete property";
	    	 response.getWriter().println("<script> alert ('"+alertMessage+"');window.location.href='ShowAll'</script>");
	     }
	     

		
	}

}
