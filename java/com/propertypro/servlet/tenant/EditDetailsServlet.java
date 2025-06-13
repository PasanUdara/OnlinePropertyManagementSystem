package com.propertypro.servlet.tenant;

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

import com.propertypro.service.tenant.TenantDBUtil;



@WebServlet("/EditDetailsServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
	    maxFileSize = 1024 * 1024 * 10,      // 10 MB
	    maxRequestSize = 1024 * 1024 * 100   // 100 MB
	)
public class EditDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Get form parameters
	    String id = request.getParameter("id");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String property = request.getParameter("property");
	    String startDate = request.getParameter("startDate");
	    String endDate = request.getParameter("endDate");
	    String note = request.getParameter("note");
	    String existingImage = request.getParameter("existingImage"); // Get existing image path
	    
	    String image = existingImage; // Default to existing image
	    
	    // Handle image upload if a new image was provided
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
	    }
	    
	    boolean isTrue = TenantDBUtil.updateTenant(id, name, email, phone, property, startDate, endDate, note, image);
	    
	    if (isTrue) {
	        response.sendRedirect("GetTenantServlet"); // // Use redirect to prevent resubmission
	    } else {
	        RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
	        dis.forward(request, response);
	    }
	}

}
