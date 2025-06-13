package com.propertypro.servlet.tenant;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.propertypro.model.tenant.Tenant;
import com.propertypro.service.tenant.TenantDBUtil;

@WebServlet("/GetAllTenantServlet")
public class GetAllTenantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userId = request.getParameter("userId");
        List<Tenant> allTenants = TenantDBUtil.getTenantbyid(userId);
        request.setAttribute("allTenants", allTenants);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/Tenant/displayAllTenants.jsp");
        dispatcher.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}