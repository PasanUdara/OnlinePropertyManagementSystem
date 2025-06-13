<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Type - PropertyPro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        
        
        body {
            
            background-color: #f5f5f5;
        }
        
        .registration{
            max-width: 500px;
            margin: 100px auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
            background-color: white;
            border: none;
        }
        
        .card {
            font-weight: 600;
            margin-bottom: 30px;
            font-size: 32px;
            border:none;
        }
        
        .btn {
            width: 100%;
            padding: 15px;
            margin: 15px 0;
            font-size: 18px;
            border-radius: 25px;
            font-weight: 500;
            transition: all 0.3s;
            border: none;
        }
        
        .btn-owner {
            background-color: #111;
            color: white;
        }
        
        .btn-owner:hover {
            color:#FFD700;
            background-color:#111;
        }
        
        .btn-tenant {
            background-color: #FFD700;
            color: #111;
        }
        
        .btn-tenant:hover {
            background-color: #FFD700;
            color: white;
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
    <div class="container">
        <div class="card registration">
            <div class="card-body text-center">
                <div class="logo">
                    <span class="logo-icon">
                        <i class="fas fa-home"></i>
                    </span>
                    Property<span class="logo-highlight">Pro</span>
                </div>
                <h2 class="card">Register As</h2>
                
                <a href="register.jsp?userType=owner">
                <button  class="btn btn-owner " name="userType" >
                    <i class="fas fa-home me-2"></i>Property Owner
                </button>
                 </a>
                 
                <a href="register.jsp?userType=tenant">
                <button class="btn btn-tenant " name="userType" >
                    <i class="fas fa-user me-2"></i>Tenant
                </button>
                </a>
                
            </div>
        </div>
    </div>
    
    
</body>
</html>