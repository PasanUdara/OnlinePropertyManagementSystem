package com.propertypro.servlet.property;


import java.io.File;



import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.propertypro.service.property.PropertyControl;



@WebServlet("/InsertServ")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,  // 1MB
                maxFileSize = 1024 * 1024 * 5,    // 5MB
                maxRequestSize = 1024 * 1024 * 10 // 10MB
)




public class InsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        
		// retrieve all parameters
		String title = request.getParameter("title");
		String description = request.getParameter("description");
	     String type = request.getParameter("type");
	     String price = request.getParameter("price");
	     String bedrooms = request.getParameter("bedrooms");
	     String bathrooms = request.getParameter("bathrooms");
	     String areaSqft = request.getParameter("areaSqft");
	     String location = request.getParameter("location");
	     String status = request.getParameter("status");
	     String userId = request.getParameter("userId");
	     
	     String imagePath = null;  // relative path to save in DB(no image = null)

	        // Handle image upload
	        Part imagePart = request.getPart("image"); 
	        if (imagePart != null && imagePart.getSize() > 0) {
	           
	            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();//get filename

	            //create directory
	            String appPath = request.getServletContext().getRealPath("");
	            String imagesDirPath = appPath + File.separator + "images";//path
	            File imagesDir = new File(imagesDirPath);
	            // create folder if doesn't exist
	            if (!imagesDir.exists()) {
	                imagesDir.mkdirs();  
	            }

	            // Save the file 
	            String filePath = imagesDirPath + File.separator + fileName;
	            imagePart.write(filePath);  

	            // relative path for db 
	            imagePath = "images/" + fileName;
	        }
	     
	     // insert property data 
	     boolean isSuccess ;
	     isSuccess  = PropertyControl.insertdata(title, description, type,price,bedrooms,bathrooms,areaSqft, location, status, userId,imagePath);
	     
	     if(isSuccess ) {
	    	 String alertMessage = "Insert success";
	    	 String User = java.net.URLEncoder.encode(userId, "UTF-8"); 
	    	 response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='GetAllServ?userId=" + User + "'</script>"); }
	     else {
	    	 String User = java.net.URLEncoder.encode(userId, "UTF-8");
	    	 RequestDispatcher dis2 = request.getRequestDispatcher("GetAllServ?userId='" + User + "'");
	    	 dis2.forward(request, response);
	     }
	     

	}

}
