package com.propertypro.servlet.property;

import java.io.File;



import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.propertypro.model.property.Property;
import com.propertypro.service.property.PropertyControl;




@WebServlet("/UpdateServ")

@MultipartConfig(fileSizeThreshold = 1024 * 1024,  // 1MB
maxFileSize = 1024 * 1024 * 5,    // 5MB
maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class UpdateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// retrieve all parameters
		String id = request.getParameter("id");
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
	    // String imagePath = request.getParameter("imagePath");
	     
	     String imagePath = null;  // relative path to save in DB(no image = null)

	        // Handle image upload
	        Part imagePart = request.getPart("image"); 
	        String exist = request.getParameter("exist");
	        if (imagePart != null && imagePart.getSize() > 0) {
	           
	            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();//get filename
	           
	          //create directory
	            String appPath = request.getServletContext().getRealPath("");
	            String imagesDirPath = appPath + File.separator + "images";//path
	            File imagesDir = new File(imagesDirPath);
            
	            

	            // Save the file 
	            String filePath = imagesDirPath + File.separator + fileName;
	            imagePart.write(filePath);  

	            // relative path for db
	            imagePath = "images/" + fileName;
	        }else {
	            // Keep existing image
	            imagePath = exist;
	        }
	     
	        // update property data 
	     boolean isTrue = PropertyControl.updateproperty(id, title, description, type, price, bedrooms, bathrooms, areaSqft, location, status, userId,imagePath);
	     
	     if(isTrue ) {
	    	 List <Property> pro = PropertyControl.getById(id);
	    	 request.setAttribute("pro", pro);
	    	 String alertMessage = "update success";
	    	 String User = java.net.URLEncoder.encode(userId, "UTF-8"); // Handle spaces/special chars
	    	 response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='GetAllServ?userId=" + User + "'</script>"); 
	    	 }
	    
	     
	     else {
	    	 String User = java.net.URLEncoder.encode(userId, "UTF-8");
	    	 RequestDispatcher dis2 = request.getRequestDispatcher("GetAllServ?userId='" + User + "'");
	    	 dis2.forward(request, response);
	     }
	     
	  
	}

}

