package com.propertypro.servlet.tenant;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.propertypro.service.tenant.TenantDBUtil;

@WebServlet("/TenantInsert")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class TenantInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            // Retrieve form input values from the request
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String property = request.getParameter("property");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String note = request.getParameter("note");
            String userId = request.getParameter("userId");
            
            
            String image = null;  // relative path to save in DB

	        // Handle image upload
	        Part imagePart = request.getPart("image"); 
	        if (imagePart != null && imagePart.getSize() > 0) {
	           
	            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

	            // Determine the absolute path to the images folder in the webapp
	            String appPath = request.getServletContext().getRealPath("");
	            String imagesDirPath = appPath + File.separator + "image";
	            File imagesDir = new File(imagesDirPath);
	            if (!imagesDir.exists()) {
	                imagesDir.mkdirs();  // create /images folder if it doesn't exist
	            }

	            // Save the file on disk
	            String filePath = imagesDirPath + File.separator + fileName;
	            imagePart.write(filePath);  

	            // Set relative path for DB (use forward slashes or appropriate URL path)
	            image = "image/" + fileName;
            
            // Insert tenant to database
            boolean isTrue = TenantDBUtil.insertTenant(name, email, phone, property, startDate, endDate, note, image,userId);
            
            if (isTrue) {
            	 String alertMessage = "Insert successful";
 	            String user = java.net.URLEncoder.encode(userId,"UTF-8");
            	 response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='GetAllTenantServlet?userId="+user+"' </script>");
        	      // Changed from forward to redirect to avoid duplicate submissions
            } else {
                RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
                dis.forward(request, response);
            }
	        }
    }
}