<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login - PropertyPro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        
        
        body {
            
            background-color: #f5f5f5;
        }
        
        .login-container {
            max-width: 500px;
            margin: 100px auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }
        
        .login-title {
            text-align: center;
            margin-bottom: 30px;
            color: #111;
            font-weight: 600;
            font-size: 24px;
        }
        
        .form-label {
            font-weight: 500;
            
            margin-bottom: 5px;
        }
        
        .form-control {
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #dee2e6;
            margin-bottom: 10px;
        }
        
        
        
        .btn-primary {
            background-color: #111;
          border:none; 
            padding: 12px;
            border-radius: 25px;
            font-weight: 500;
            margin-top: 10px;
            
        }
        
        .btn-primary:hover {
            background-color:   #FFD700;
            color :#111;
        }
        
        .logo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
           
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
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo-highlight {
            color:  #FFD700;
            font-size: 32px;
        }
        
        a {
            color:  #FFD700;
            font-weight: 500;
            text-decoration: none;
            
        }
        
        a:hover {
            color: #e6c200;
            
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container bg-white">
            <div class="logo">
                <span class="logo-icon">
                    <i class="fas fa-home"></i>
                </span>
                Property<span class="logo-highlight">Pro</span>
            </div>
            <h2 class="login-title"><i class="fas fa-sign-in-alt me-2"></i>User Login</h2>
            
            <!-- form -->
            
            <form action="../../LoginServ" method="post">
                
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="mail" required>
                </div>
                
            
                <div class="mb-4">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="pass" required>
                </div>
                
                
                <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>
                
                
                <div class="text-center">
                    <p>Don't have an account? <a href="regType.jsp">Register here</a></p>
                </div>
                
               
            </form>
        </div>
    </div>
    <script>
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
    </script>
   
</body>
</html>