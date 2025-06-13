<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration - PropertyPro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        
        
        body {
            
            background-color: #f5f5f5;
        }
        
        .registration-form {
            max-width: 500px;
            margin: 80px auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }
        
        .role-badge {
            font-size: 24px;
            
            color: #111;
            font-weight: 600;
            margin-bottom: 30px;
        }
        
        .form-label {
            font-weight: 500;
            color: #212529;
            margin-bottom: 8px;
        }
        
        .form-control {
            padding: 12px;
            border-radius: 8px;
            
            margin-bottom: 10px;
        }
        
        
        
        .btn-primary {
            background-color: #111;
            border: none;
            padding: 12px;
            border-radius: 25px;
            font-weight: 500;
            margin-top: 10px;
            
        }
        
        .btn-primary:hover {
            background-color: #333;
        }
        
        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
            text-decoration: none;
            color: #111;
            font-weight: bold;
            font-size: 28px;
        }
        
        .logo-icon {
            color: white;
            background-color: #111;
            padding: 8px;
            border-radius: 5px;
            margin-right: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo-highlight {
            color: #FFD700;
            font-size: 32px;
        }
    </style>
</head>
<body>
    <%
    String userType = request.getParameter("userType");
    
    %>
    
    <div class="container">
        <div class="registration-form bg-white">
            <div class="logo">
                <span class="logo-icon">
                    <i class="fas fa-home"></i>
                </span>
                Property<span class="logo-highlight">Pro</span>
            </div>
            
            <!-- form -->
            <form action="../../RegisterServlet" method="post">
                
                
                <input type="hidden" name="userType" value="<%= userType %>">
                
               
                <div class="text-center mb-4">
                    <span class="badge role-badge"><%= userType.equals("owner") ? "Property Owner" : "Tenant" %> Registration
                    </span>
                </div>
                
                
                <div class="mb-3">
                    <label for="userName" class="form-label">User Name</label>
                    <input type="text" class="form-control" id="userName" name="userName" required>
                </div>
                
                
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                
                
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required>
                </div>
                
                
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                
              
                <button type="submit" class="btn btn-primary w-100">Register</button>
            </form>
        </div>
    </div>
    
    <script >
   
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
    
    // Phone number validation
    const phoneInput = document.getElementById('phone');
    phoneInput.addEventListener('input', function() {
        
        phoneInput.value = phoneInput.value.replace(/[^0-9\s\-()]/g, '');
    });
    </script>
    
</body>
</html>