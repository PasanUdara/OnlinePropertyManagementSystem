<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PropertyOwner Dashboard - PropertyPro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        
        body {
           
            background-color: #f5f5f5;
            padding: 20px;
        }
        
        .navbar {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }
        
        .navbar-brand {
            font-weight: bold;
            font-size: 24px;
            color: #111;
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
        
        .nav-link {
            color: #333;
            font-weight: 500;
            margin: 0 15px;
        }
        
        .nav-link:hover {
            color: #FFD700;
        }
        
        .btn-login {
            color:  #111;
            font-weight: 500;
        }
        
        .btn-signup {
            background-color:  #111;
            color: white;
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 500;
        }
        
        .btn-signup:hover {
            background-color: #333;
        }
        
        .dashboard-container {
            max-width: 1200px;
            margin: 10px auto;
        }
        
        .header {
            background-color: #111;
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display :flex;
            justify-content: space-between;
            
        }
        
        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 22px;
        }
        
        .logo-icon {
            color: #111;
            background-color: white;
            padding: 6px;
            border-radius: 5px;
            margin-right: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo-highlight {
            color: #FFD700;
            font-size: 24px;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            font-weight: 500;
        }
        
        .user-info i {
            margin-right: 8px;
            color: #FFD700;
        }
        
        .logout-btn {
            background-color: transparent;
            border: 1px solid white;
            color: white;
            font-size: 14px;
            padding: 6px 15px;
            border-radius: 5px;
            margin-left: 15px;
            transition: all 0.3s;
        }
        
        .logout-btn:hover {
            background-color: white;
            color: #111;
        }
        
        .dashboard-container {
            max-width: 1200px;
            margin: 10px auto;
        }
        
        .header {
            background-color: var(--primary);
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display :flex;
            justify-content: space-between;
            
        }
        
        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 22px;
        }
        
        .logo-icon {
            color: var(--primary);
            background-color: white;
            padding: 6px;
            border-radius: 5px;
            margin-right: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo-highlight {
            color: var(--accent);
            font-size: 24px;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            font-weight: 500;
        }
        
        .user-info i {
            margin-right: 8px;
            color:  #FFD700;
        }
        
        .logout-btn {
            background-color: transparent;
            border: 1px solid white;
            color: white;
            font-size: 14px;
            padding: 6px 15px;
            border-radius: 5px;
            margin-left: 15px;
            transition: all 0.3s;
        }
        
        :root {
            --primary: #111;
            --accent: #FFD700;
            --light-bg: #f5f5f5;
            --text-dark: #212529;
            --text-muted: #6c757d;
        }
        
        
        .logout-btn:hover {
            background-color: white;
            color: var(--primary);
        }
        
        .dashboard-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .card-title {
            color: var(--primary);
            font-weight: 600;
            font-size: 18px;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .card-title i {
            color: var(--accent);
            margin-right: 8px;
        }
        
        
        
        
        
        
        
        
        .btn-accent {
            background-color: var(--accent);
            
            color: var(--text-dark);
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 5px;
            
        }
        
        .btn-accent:hover {
            background-color: #e6c200;
            color: var(--text-dark);
        }
        
        .navigation {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        
        .nav-btn {
            display:block;
            width:300px;
            text-align: center;
            background-color: white;
            border: 1px solid #ddd;
            padding: 12px;
            margin-right: 5px;
            border-radius: 8px;
            color: var(--text-dark);
            text-decoration: none;
            
        }
        
        
        
        .nav-btn i {
            display: block;
            font-size: 24px;
            margin-bottom: 5px;
            color: var(--accent);
        }
        
        .nav-btn:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            color: var(--text-dark);
        }
        
        .welcome-message {
            padding: 15px;
            background-color: var(--primary);
            border-radius: 8px;
            color: white;
            margin-bottom: 20px;
        }
        
         h3 {
            font-size: 20px;
            
        }
        
         p {
            
            color: rgb(157, 157, 151);
        }
        
        
    </style>
</head>
<body>


	<%
    
    String type = request.getParameter("type");
    
    String userId = request.getParameter("userId");
    
    String userName = request.getParameter("userName");
    
    %>
    
     <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="../Tenant/home.jsp">
                <span class="logo-icon">
                    <i class="fa-solid fa-home"></i>
                </span>
                Property<span class="logo-highlight">Pro</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">To Rent</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Property</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center">
                	<span style="font-weight: 500; margin-right: 15px; color: #111;">
    				Hello, <%= userName %>
					</span>
                    <a href="login.jsp" class="btn btn-login me-3">Log Out</a>
                </div>
            </div>
        </div>
    </nav>
    
    <div class="dashboard-container">
        
        
        <div class="welcome-message">
            <h3>Welcome to PropertyPro!</h3>
            <p>Find your perfect property with ease. Browse listings, schedule viewings, and more.</p>
        </div>
        
       
        <div class="navigation">
            <a href="../../ListServ" class="nav-btn">
                <i class="fas fa-building"></i>
                Properties
            </a>
            <a href="#" class="nav-btn">
                <i class="fas fa-heart"></i>
                Favorites
            </a>
            <a href="#" class="nav-btn">
                <i class="fas fa-comment-alt"></i>
                Messages
            </a>
            <a href="#" class="nav-btn">
                <i class="fas fa-user"></i>
                Profile
            </a>
        </div>
        
        
        
        <!-- Quick Actions -->
        <div class="dashboard-card">
            <h4 class="card-title"><i class="fas fa-tasks"></i> Quick Actions</h4>
            <div class="row">
                <div class="col-md-6 mb-2" >
                <input type="hidden" name="userId" value="<%=userId%>">
                    <a href="form.jsp?userId=<%=userId%>"  class="btn btn-accent w-100" >
                        <i class="fas fa-search me-2"></i> Add Property
                    </a>
                </div>
                <div class="col-md-6 mb-2" >
                <input type="hidden" name="userId" value="<%=userId%>">
                    <a href="../../GetAllServ?userId=<%=userId%>"  class="btn btn-accent w-100" >
                        <i class="fas fa-search me-2"></i> Property Details
                    </a>
                </div>
                
            </div>
            </div>
            
        </div>
    
    
    
</body>
</html>