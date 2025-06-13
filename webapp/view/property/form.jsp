<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add New Property - PropertyPro</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
       
        
        body {
            background-color: #f5f5f5;
        }
        
        .content {
            display: flex;
            justify-content: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        .form {
            width: 800px;
            margin: 40px;
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
        
        .form-label {
            font-weight: 500;
            color: #333;
            display: flex;
            align-items: center;
            font-size: 14px;
        }
        
        .form-label i {
            margin-right: 8px;
            color: #FFD700;
            
        }
        
        .form-control, .form-select {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #eee;
            font-size: 16px;
        }
        
        
        
        .submit-btn {
            width: 100%;
            padding: 14px;
            font-weight: 600;
            border-radius: 25px;
            font-size: 17px;
            margin-top: 25px;
            background-color: #111;
            border: none;
            transition: all 0.3s;
        }
        
        .submit-btn:hover {
            background-color: #333;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary {
            background-color: #111;
            border-color: #111;
        }
        
        .btn-primary:hover {
            background-color: #333;
            border-color: #333;
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
        
        /* Header Section */
        header {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 80px;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #111;
            font-weight: bold;
            font-size: 24px;
        }
        
        .logo-icon {
            color: #fff;
            background-color: #111;
            padding: 8px;
            border-radius: 5px;
            margin-right: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo-highlight {
            color: #FFD700;
            font-size: 28px;
        }
        
        .nav-links {
            display: flex;
            gap: 30px;
        }
        
        .nav-link {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-link:hover {
            color: #FFD700;
        }
        
        .auth-buttons {
            display: flex;
            gap: 15px;
            align-items: center;
        }
        
        .btn-login {
            color: #111;
            text-decoration: none;
        }
        
        .btn-signup {
            background-color: #111;
            color: white;
            border: none;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-signup:hover {
            background-color: #333;
        }
        
        
    </style>
</head>
<body>

<%
    
    String userId = request.getParameter("userId");
    
%>
    
    <!-- form -->

    <div class="content">
        <div class="form">
            <form action="../../InsertServ" method="post" enctype="multipart/form-data">
                <h1 class="form-title">List Your Property</h1>
                
                <div class="row">
                    <div class="col-md">
                        <label for="title" class="form-label"><i class="fas fa-heading"></i> Title</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Beautiful modern apartment" >
                    </div>
                    
                    <div class="col-md ">
                        <label for="type" class="form-label"><i class="fas fa-home"></i> Property Type</label>
                        <select class="form-select" id="type" name="type" required>
                            <option value="" disabled selected>Select property type</option>
                            <option value="House">House</option>
                            <option value="Apartment">Apartment</option>
                            <option value="Villa">Villa</option>
                        </select>
                    </div>
                </div>

                <br>
                
                <label for="description" class="form-label"><i class="fas fa-align-left"></i> Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" placeholder="Describe your property in detail..." required></textarea>
                
                <br>
                
               
                <div class="row">
                    <div class="col-md">
                        <label for="price" class="form-label"><i class="fas fa-tag"></i> Price</label>
                        <input type="text" class="form-control" id="price" name="price" placeholder="eg:Rs.123" required>
                    </div>
                    
                    <div class="col-md">
                        <label for="areaSqft" class="form-label"><i class="fas fa-ruler-combined"></i> Area </label>
                        <input type="text" class="form-control" id="areaSqft" name="areaSqft" placeholder="85" pattern="[0-9]+" required>
                    </div>
                    
                    <div class="col-md">
                        <label for="status" class="form-label"><i class="fas fa-info-circle"></i> Status</label>
                        <select class="form-select" id="status" name="status" required>
                            <option value="Available">Available</option>
                            <option value="Rented">Rented</option>
                        </select>
                    </div>
                </div>

                <br>
                
                <div class="row">
                    <div class="col-md">
                        <label for="bedrooms" class="form-label"><i class="fas fa-bed"></i> Bedrooms</label>
                        <select class="form-select" id="bedrooms" name="bedrooms" required>
                            <option value="" disabled selected>Select bedrooms</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4+">4+</option>
                        </select>
                    </div>
                    
                    <div class="col-md">
                        <label for="bathrooms" class="form-label"><i class="fas fa-bath"></i> Bathrooms</label>
                        <select class="form-select" id="bathrooms" name="bathrooms" required>
                            <option value="" disabled selected>Select bathrooms</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4+">4+</option>
                        </select>
                    </div>
                </div>
                
                <br>
                
                <label for="location" class="form-label"><i class="fas fa-map-marker-alt"></i> Location</label>
                <input type="text" class="form-control" id="location" name="location" placeholder="Brixton Road, London SW9" required>
                
             
                <br>
                
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
                    <i class="fas fa-paper-plane me-2"></i> Publish Listing
                </button>
            </form>
        </div>
        
    </div>


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
