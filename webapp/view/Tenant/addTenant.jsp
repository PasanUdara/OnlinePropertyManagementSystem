<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Tenant</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 3rem 0;
        }
        
        .form-container {
            background-color: #fff;
            border-radius: 1rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            padding: 2rem;
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .section-title {
            color: #0d6efd;
            position: relative;
            padding-bottom: 0.75rem;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(to right,  #0d6efd, #0dcaf0);
            border-radius: 2px;
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #0dcaf0;
            box-shadow: 0 0 0 0.25rem rgba(13, 202, 240, 0.25);
        }
        
        .invalid-feedback {
            font-size: 0.875rem;
        }
        
        .btn-submit {
            padding: 0.5rem 2rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        
        .input-group-text {
            background-color: #e9ecef;
            color: #6c757d;
        }
        
        /* Image Upload Styles */
        .image-upload-container {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .image-upload-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        
        .image-preview-container {
            width: 100%;
            max-width: 320px;
            height: 280px;
            margin: 0 auto 1rem;
            border: 2px dashed #ccc;
            border-radius: 8px;
            overflow: hidden;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .image-preview {
            max-width: 100%;
            max-height: 100%;
            display: none;
        }
        
        .image-upload-actions {
            display: flex;
            justify-content: center;
            gap: 1rem;
        }
        
        .image-upload-btn {
            background-color:  #0d6efd;
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .image-upload-btn:hover {
            background-color: #0b5ed7;
            transform: translateY(-2px);
        }
        
        .image-remove-btn {
            background-color: #dc3545;
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: none;
        }
        
        .image-remove-btn:hover {
            background-color: #bb2d3b;
            transform: translateY(-2px);
        }
        
        #fileInput {
            display: none;
        }
    </style>
</head>
<body>
	<%
    
    String userId = request.getParameter("userId");
    
    %>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
                <div class="form-container">
                    <h1 class="section-title">Add New Tenant</h1>
                    
                    <!-- Image Upload Section -->
                    
                    
                    <form id="tenantForm" method="post" action="../../TenantInsert" class="needs-validation" enctype="multipart/form-data" novalidate>
                    
                    	<div class="image-upload-container">
                        <h3 class="image-upload-title">Upload Image with Preview</h3>
                        <div class="image-preview-container" id="imagePreviewContainer">
                            <img id="imagePreview" class="image-preview" src="#" alt="Image Preview">
                        </div>
                        <div class="image-upload-actions">
                            <input name="image" type="file" id="fileInput" accept="image/*" />
                            <button type="button" id="chooseImageBtn" class="image-upload-btn">
                                <i class="fas fa-upload me-1"></i> Choose Image
                            </button>
                            <button type="button" id="removeImageBtn" class="image-remove-btn">
                                <i class="fas fa-trash-alt me-1"></i> Remove
                            </button>
                        </div>
                    </div>
                    
                        <div class="row g-3">
                            <!-- Tenant Information -->
                            <div class="col-12">
                                <h5 class="mt-3 mb-3 text-secondary"><i class="fas fa-user me-2"></i>Tenant Information</h5>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="name" class="form-label">Name <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                    <div class="invalid-feedback">
                                        Please provide tenant's name.
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid email address.
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="phone" class="form-label">Phone <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input type="text" class="form-control" id="phone" name="phone" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid phone number.
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="property" class="form-label">Property <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-home"></i></span>
                                    <input type="text" class="form-control" id="property" name="property" required>
                                    <div class="invalid-feedback">
                                        Please specify the property.
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Lease Information -->
                            <div class="col-12">
                                <h5 class="mt-4 mb-3 text-secondary"><i class="fas fa-file-contract me-2"></i>Lease Information</h5>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="startDate" class="form-label">Lease Start Date <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                    <input type="date" class="form-control" id="startDate" name="startDate" required>
                                    <div class="invalid-feedback">
                                        Please select a start date.
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="endDate" class="form-label">Lease End Date <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                                    <input type="date" class="form-control" id="endDate" name="endDate" required>
                                    <div class="invalid-feedback">
                                        Please select an end date.
                                    </div>
                                </div>
                            </div>
                            
                            <input type="hidden" name="userId" value="<%=userId%>"  required>
                            
                            <div class="col-12">
                                <label for="note" class="form-label">Additional Notes</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-sticky-note"></i></span>
                                    <textarea class="form-control" id="note" name="note" rows="4"></textarea>
                                </div>
                            </div>
                            
                            <div class="col-12 mt-4">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <button type="reset" class="btn btn-outline-secondary me-md-2">
                                        <i class="fas fa-undo me-1"></i> Reset
                                    </button>
                                    <button type="submit" class="btn btn-primary btn-submit">
                                        <i class="fas fa-save me-1"></i> Add Tenant
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    
    <!-- Form validation and image upload script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Image Upload Functionality
            const fileInput = document.getElementById('fileInput');
            const chooseImageBtn = document.getElementById('chooseImageBtn');
            const removeImageBtn = document.getElementById('removeImageBtn');
            const imagePreview = document.getElementById('imagePreview');
            const imagePreviewContainer = document.getElementById('imagePreviewContainer');
            
            // Trigger file input when choose image button is clicked
            chooseImageBtn.addEventListener('click', function() {
                fileInput.click();
            });
            
            // Preview the selected image
            fileInput.addEventListener('change', function() {
                if (fileInput.files && fileInput.files[0]) {
                    const reader = new FileReader();
                    
                    reader.onload = function(e) {
                        imagePreview.src = e.target.result;
                        imagePreview.style.display = 'block';
                        removeImageBtn.style.display = 'block';
                    }
                    //convert choosed image to Base64 format
                    reader.readAsDataURL(fileInput.files[0]);
                }
            });
            
            // Remove the selected image
            removeImageBtn.addEventListener('click', function() {
                fileInput.value = '';
                imagePreview.src = '#';
                imagePreview.style.display = 'none';
                removeImageBtn.style.display = 'none';
            });
            
            // Phone number validation
            const phoneInput = document.getElementById('phone');
            phoneInput.addEventListener('input', function() {
                // Allow only numbers, spaces, dashes, and parentheses
                phoneInput.value = phoneInput.value.replace(/[^0-9\s\-()]/g, '');
            });
            
            // Date validation
            const startDateInput = document.getElementById('startDate');
            const endDateInput = document.getElementById('endDate');
            
            endDateInput.addEventListener('change', function() {
                if (startDateInput.value && endDateInput.value) {
                    const startDate = new Date(startDateInput.value);
                    const endDate = new Date(endDateInput.value);
                    
                    if (endDate <= startDate) {
                        endDateInput.setCustomValidity('End date must be after start date');
                    } else {
                        endDateInput.setCustomValidity('');
                    }
                }
            });
            
           
            
            // Email validation
            const emailInput = document.getElementById('email');
            emailInput.addEventListener('input', function() {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (emailInput.value && !emailRegex.test(emailInput.value)) {
                    emailInput.setCustomValidity('Please enter a valid email address');
                } else {
                    emailInput.setCustomValidity('');
                }
            });
            
            // Bootstrap form validation
            const form = document.getElementById('tenantForm');
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                
                form.classList.add('was-validated');
            });
            
            // Reset form should also reset the image preview
            form.addEventListener('reset', function() {
                fileInput.value = '';
                imagePreview.src = '#';
                imagePreview.style.display = 'none';
                removeImageBtn.style.display = 'none';
                form.classList.remove('was-validated');
            });
        });
    </script>
</body>
</html>