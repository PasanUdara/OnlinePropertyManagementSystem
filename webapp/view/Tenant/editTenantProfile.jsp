<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #0d6efd;
            --secondary-color: #6c757d;
            --accent-color: #0dcaf0;
            --bs-body-bg: #f8f9fa;
        }
        
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
            color: var(--primary-color);
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
            background: linear-gradient(to right, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(13, 202, 240, 0.25);
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
            background-color: var(--primary-color);
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
	
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String note = request.getParameter("note");
		String image = request.getParameter("image");
	
	%>
	
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">
                <div class="form-container">
                    <h1 class="section-title">Edit Details</h1>
                    
                    <!-- Hidden ID field for update -->
                    <form id="tenantForm" method="post" action="../../EditDetailsServlet" enctype="multipart/form-data">
                        <input type="hidden" id="tenantId" name="id" value="<%=id%>">
                        <!-- Add this line to preserve the existing image path -->
                        <input type="hidden" id="existingImage" name="existingImage" value="<%=image%>">
                    
                        <!-- Image Upload Section -->
                        <div class="image-upload-container">
                            <h3 class="image-upload-title">Tenant Photo</h3>
                            <div class="image-preview-container" id="imagePreviewContainer">
                                <img alt="img" src="<%=image%>" object-fit="cover" width=320px height=300px >
                            </div>
                            
                            <div class="image-upload-actions">
                                <input name="image" type="file" id="fileInput" accept="image/*" />
                                <button type="button" id="chooseImageBtn" class="image-upload-btn">
                                    <i class="fas fa-upload me-1"></i> Change Photo
                                </button>
                                <button type="button" id="removeImageBtn" class="image-remove-btn" style="display: <%=id%> != null ? 'block' : 'none'">
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
                                <label for="name" class="form-label">Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" class="form-control" id="email" name="email" value="<%=email%>">
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="phone" class="form-label">Phone</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input type="text" class="form-control" id="phone" name="phone" value="<%=phone%>">
                                </div>
                            </div>
                            
                            
                            <div class="col-12">
                                <label for="note" class="form-label">Additional Notes</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-sticky-note"></i></span>
                                    <textarea class="form-control" id="note" name="note" rows="4"><%=note%></textarea>
                                </div>
                            </div>
                            
                            <div class="col-12 mt-4">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <a href="GetTenantServlet" class="btn btn-outline-secondary me-md-2">
                                        <i class="fas fa-arrow-left me-1"></i> Back
                                    </a>
                                    <button type="submit" class="btn btn-primary btn-submit">
                                        <i class="fas fa-save me-1"></i> Edit Details
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
    
    <!-- Image upload script without validation -->
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
                if (this.files && this.files[0]) {
                    const reader = new FileReader();
                    
                    reader.onload = function(e) {
                        imagePreview.src = e.target.result;
                        imagePreview.style.display = 'block';
                        removeImageBtn.style.display = 'block';
                    }
                    
                    reader.readAsDataURL(this.files[0]);
                }
            });
            
            // Remove the selected image
            removeImageBtn.addEventListener('click', function() {
                fileInput.value = '';
                imagePreview.src = '';
                imagePreview.style.display = 'none';
                removeImageBtn.style.display = 'none';
            });
        });
    </script>
</body>
</html>