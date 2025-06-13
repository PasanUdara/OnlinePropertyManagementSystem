<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PropertyPro - Update Property</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        
        
        body {
            background-color: #f5f5f5;
        }
        
        .form {
            width: 100%;
            max-width: 800px;
            margin: 40px auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        
        .form-title {
            text-align: center;
            margin-bottom: 30px;
            color: #111;
            font-weight: 600;
            font-size: 32px;
        }
        
        .form-title i {
            color: #FFD700;
        }
        
        .form-label {
            font-weight: 500;
            color: #333;
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }
        
        .form-label i {
            margin-right: 8px;
            color: #FFD700;
        }
        
        .form-control, .form-select {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #eee;
            margin-bottom: 20px;
        }
        
        
        
        .submit-btn {
            width: 100%;
            padding: 14px;
            font-weight: 600;
            border-radius: 25px;
            font-size: 17px;
            margin-top: 20px;
            background-color: #111;
            border: none;
            
        }
        
        .submit-btn:hover {
            background-color: #333;
            
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
       .file-upload-input {
            opacity: 0;
        }
        
        .file-upload-label {
            display: block;
            padding: 25px;
            background-color: #f8f9fa;
            border: 1px dashed #eee;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .file-upload-label:hover {
            border-color: #FFD700;
            background-color: rgba(255, 215, 0, 0.05);
        }
        
        .file-upload-icon {
            font-size: 24px;
            color: #FFD700;
            margin-bottom: 8px;
        }
        
        .current-image {
            width: 150px;
            height: 150px;
           
            border-radius: 10px;
            border: 1px solid #eee;
        }
        
        .file-input {
            display: none;
        }
        
        .img-input{
        	width:650px;
        }
        
        
    </style>
</head>
<body>
   
    
    <%
    int id = Integer.parseInt(request.getParameter("id"));
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
    String imagePath = request.getParameter("imagePath");
    %>
    
    <!-- form -->
    <div class="content">
        <div class="form">
            <form action="../../UpdateServ" method="post" enctype="multipart/form-data">
                <h1 class="form-title"><i class="fas fa-edit me-2"></i>Update Property</h1>
                
                <input type="hidden" name="id" value="<%=id%>">
                
                <div class="row">
                    <div class="col-md">
                        <label for="title" class="form-label"><i class="fas fa-heading"></i> Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%=title%>" required>
                    </div>
                    
                    <div class="col-md">
                        <label for="type" class="form-label"><i class="fas fa-home"></i> Property Type</label>
                        <select class="form-select" id="type" name="type" required>
                            <option value="House" <%= "House".equals(type) ? "selected" : "" %>>House</option>
                            <option value="Apartment" <%= "Apartment".equals(type) ? "selected" : "" %>>Apartment</option>
                            <option value="Villa" <%= "Villa".equals(type) ? "selected" : "" %>>Villa</option>
                        </select>
                    </div>
                </div>

                <label for="description" class="form-label"><i class="fas fa-align-left"></i> Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required><%=description%></textarea>
                
                <div class="row">
                    <div class="col-md">
                        <label for="price" class="form-label"><i class="fas fa-tag"></i> Price</label>
                        <input type="text" class="form-control" id="price" name="price" value="<%=price%>" required>
                    </div>
                    
                    <div class="col-md">
                        <label for="areaSqft" class="form-label"><i class="fas fa-ruler-combined"></i> Area (Sqft)</label>
                        <input type="text" class="form-control" id="areaSqft" name="areaSqft" value="<%=areaSqft%>" required>
                    </div>
                    
                    <div class="col-md">
                        <label for="status" class="form-label"><i class="fas fa-info-circle"></i> Status</label>
                        <select class="form-select" id="status" name="status" required>
                            <option value="Available" <%= "Available".equals(status) ? "selected" : "" %>>Available</option>
                            <option value="Rented" <%= "Rented".equals(status) ? "selected" : "" %>>Rented</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md">
                        <label for="bedrooms" class="form-label"><i class="fas fa-bed"></i> Bedrooms</label>
                        <select class="form-select" id="bedrooms" name="bedrooms" required>
                            <option value="1" <%= "1".equals(bedrooms) ? "selected" : "" %>>1</option>
                            <option value="2" <%= "2".equals(bedrooms) ? "selected" : "" %>>2</option>
                            <option value="3" <%= "3".equals(bedrooms) ? "selected" : "" %>>3</option>
                            <option value="4+" <%= "4+".equals(bedrooms) ? "selected" : "" %>>4+</option>
                        </select>
                    </div>
                    
                    <div class="col-md">
                        <label for="bathrooms" class="form-label"><i class="fas fa-bath"></i> Bathrooms</label>
                        <select class="form-select" id="bathrooms" name="bathrooms" required>
                            <option value="1" <%= "1".equals(bathrooms) ? "selected" : "" %>>1</option>
                            <option value="2" <%= "2".equals(bathrooms) ? "selected" : "" %>>2</option>
                            <option value="3" <%= "3".equals(bathrooms) ? "selected" : "" %>>3</option>
                            <option value="4+" <%= "4+".equals(bathrooms) ? "selected" : "" %>>4+</option>
                        </select>
                    </div>
                </div>
                
                <label for="location" class="form-label"><i class="fas fa-map-marker-alt"></i> Location</label>
                <input type="text" class="form-control" id="location" name="location" value="<%=location%>" required>
               
                
                <input type="hidden" class="form-control" id="userId" name="userId" value="<%=userId%>" >
                
                
                <label class="form-label"><i class="fas fa-camera"></i> Property Images</label>
				<div class="upload">
				    <input type="file" id="image" name="image" class="file-upload-input" accept=".jpg, .jpeg, .png" required>
				    <label for="image" class="file-upload-label">
				        <span class="file-upload-icon">
				            <i class="fas fa-cloud-upload-alt"></i>
				        </span>
				        <span>Click to upload images</span>
				        <span class="small text-muted mt-1">PNG, JPG or JPEG (Max. 5MB)</span>
				    </label>
				</div>
                
                <button type="submit" class="btn btn-primary submit-btn">
                    <i class="fas fa-save me-2"></i> Save Changes
                </button>
            </form>
        </div>
    </div>
    
    <script >
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form');
        
        // Price validation - allow only numbers and one decimal point
        const priceInput = document.getElementById('price');
        priceInput.addEventListener('input', function() {
            // Remove any non-digit characters except decimal point
            this.value = this.value.replace(/[^0-9.]/g, '');
            
            // Ensure only one decimal point
            const decimalCount = (this.value.match(/\./g) || []).length;
            if (decimalCount > 1) {
                this.value = this.value.substring(0, this.value.lastIndexOf('.'));
            }
        });

        // Area validation - allow only numbers
        const areaInput = document.getElementById('areaSqft');
        areaInput.addEventListener('input', function() {
            this.value = this.value.replace(/[^0-9]/g, '');
        });

        form.addEventListener('submit', function(e) {
            let isValid = true;
            
            // Validate title
            const title = document.getElementById('title');
            if (title.value.trim() === '') {
                alert('Please enter a title for your property');
                title.focus();
                isValid = false;
                e.preventDefault();
                return false;
            }
            
            // Validate property type
            const type = document.getElementById('type');
            if (!type.value) {
                alert('Please select a property type');
                type.focus();
                isValid = false;
                e.preventDefault();
                return false;
            }
            
            // Validate description
            const description = document.getElementById('description');
            if (description.value.trim() === '') {
                alert('Please enter a description for your property');
                description.focus();
                isValid = false;
                e.preventDefault();
                return false;
            }
            
            // Validate price
            const price = document.getElementById('price');
            const priceValue = price.value.trim();
            if (priceValue === '' || isNaN(priceValue) || parseFloat(priceValue) <= 0) {
                alert('Please enter a valid price (positive numbers only)');
                price.focus();
                isValid = false;
                e.preventDefault();
                return false;
            }
            
            // Validate area
            const areaSqft = document.getElementById('areaSqft');
            if (areaSqft.value.trim() === '' || isNaN(areaSqft.value) || parseInt(areaSqft.value) <= 0) {
                alert('Please enter a valid area (positive numbers only)');
                areaSqft.focus();
                isValid = false;
                e.preventDefault();
                return false;
            }
            
            // Validate bedrooms
            const bedrooms = document.getElementById('bedrooms');
            if (!bedrooms.value) {
                alert('Please select number of bedrooms');
                bedrooms.focus();
                isValid = false;
                e.preventDefault();
                return false;
            }
            
            // Validate bathrooms
            const bathrooms = document.getElementById('bathrooms');
            if (!bathrooms.value) {
                alert('Please select number of bathrooms');
                bathrooms.focus();
                isValid = false;
                e.preventDefault();
                return false;
            }
            
            // Validate location
            const location = document.getElementById('location');
            if (location.value.trim() === '') {
                alert('Please enter a location for your property');
                location.focus();
                isValid = false;
                e.preventDefault();
                return false;
            }
            
            // Validate image upload
            const image = document.getElementById('image');
            if (image.files.length === 0) {
                alert('Please upload at least one image of your property');
                isValid = false;
                e.preventDefault();
                return false;
            } else {
                // Check file type
                const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
                if (!allowedExtensions.exec(image.value)) {
                    alert('Please upload only image files (JPG, JPEG, PNG)');
                    image.value = '';
                    isValid = false;
                    e.preventDefault();
                    return false;
                }
                
                // Check file size (max 5MB)
                const maxSize = 5 * 1024 * 1024; // 5MB
                if (image.files[0].size > maxSize) {
                    alert('Image size should be less than 5MB');
                    image.value = '';
                    isValid = false;
                    e.preventDefault();
                    return false;
                }
            }
           
        });
    });
    </script>

    
</body>
</html>
