<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PropertyPro - Property Listings</title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f5f5f5;
            
        }
        
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
    
    .btn {
      padding: 10px 20px;
      border-radius: 25px;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s;
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
    }
    
    .btn-signup:hover {
      background-color: #333;
    }
        
       
        
        /* Search box */
        .search-box {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin: 20px auto;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            position: relative;
        }
        
        .search-box i {
            position: absolute;
            left: 35px;
            top: 32px;
            color: #777;
        }
        
        .search-input {
            padding-left: 40px;
        }
        
        /* Property listing */
        .section-title {
            font-size: 28px;
            font-weight: bold;
            color: #111;
            margin-bottom: 20px;
            position: relative;
        }
        
        
        .property-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        
        .property-card:hover {
            transform: translateY(-5px);
        }
        
        .property-img {
            height: 200px;
            object-fit: cover;
        }
        
        .property-title {
            font-size: 18px;
            font-weight: bold;
            color: #111;
        }
        
        .property-price {
            font-size: 22px;
            font-weight: bold;
            color: #111;
            margin-bottom: 10px;
        }
        
        .property-location i {
            color: #FFD700;
        }
        
        .detail-item {
            background-color: #f5f5f5;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            margin-right: 5px;
            margin-bottom: 5px;
            display: inline-block;
        }
        
        .status-available{
            background-color: #FFF8DD;
            color: #806a00;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
        }
        
        .status-rented{
            background-color: #f5f5f5;
            color: #777;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
        }
        
        
        footer {
            background-color: #111;
            color: white;
            padding: 40px 0 20px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <%
    String user = request.getParameter("userId");
    String username = (String) session.getAttribute("username");
    %>
    
    <header>
    <div class="container nav-container">
      <div class="logo-container">
        <a href="view/Tenant/home.jsp" class="logo">
          <span class="logo-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
              <polyline points="9 22 9 12 15 12 15 22"></polyline>
            </svg>
          </span>
          Property<span class="logo-highlight">Pro</span>
        </a>
      </div>
      
      <div class="nav-links">
        <a href="#" class="nav-link">To Rent</a>
        <a href="#" class="nav-link">Property</a>
        <a href="#" class="nav-link">Pricing</a>
      </div>
      
      <div class="auth-buttons">
        <a href="view/property/logout.jsp" class="btn btn-login">Log Out</a>
        <span class="btn btn-signup">Hello, <%=username%></span>
      </div>
    </div>
  </header>
   

    <!-- Search Box -->
    <div class="container">
        <div class="search-box">
            <i class="fas fa-search"></i>
            <input type="text" id="search" class="form-control search-input" placeholder="Search by location, price, type...">
        </div>
    </div>

    <!-- Property Listings -->
    <div class="container">
        <h2 class="section-title">Property Listings</h2>
        <div class="row" id="propertyContainer">
            <c:forEach var="al" items="${allp}">
                <div class="col-md-4 property-item">
                    <div class="card property-card">
                        <img src="${al.imagePath}" class="property-img" alt="${al.title}">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8">
                                    <h3 class="property-title">${al.title}</h3>
                                </div>
                                <div class="col-4 text-end">
                                    <span class="${al.status == 'Available' ? 'status-available' : 'status-rented'}">
                                        ${al.status}
                                    </span>
                                </div>
                            </div>
                            
                            <div class="property-price">$${al.price}</div>
                            
                            <p class="property-location">
                                <i class="fas fa-map-marker-alt"></i> ${al.location}
                            </p>
                            
                            <div class="mb-3">
                                <span class="detail-item">
                                    <i class="fas fa-home"></i> ${al.type}
                                </span>
                                <span class="detail-item">
                                    <i class="fas fa-bed"></i> ${al.bedrooms} Beds
                                </span>
                                <span class="detail-item">
                                    <i class="fas fa-bath"></i> ${al.bathrooms} Baths
                                </span>
                                <span class="detail-item">
                                    <i class="fas fa-ruler-combined"></i> ${al.areaSqft} sqft
                                </span>
                            </div>
                            
                            <p class="text-muted">${al.description}</p>
                            
                            
                            
                            
                            
                            <div class="mt-3">
                                <form action="view/Tenant/addTenant.jsp" method="post">
                                    <input type="hidden" name="id" value="${al.id}">
                                    <input type="hidden" name="userId" value="<%=user%>">
                                    <input type="hidden" name="userId" value="<%=username%>">
                                    <button type="submit" class="btn btn-warning">
                                        Rent
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <h5>PropertyPro</h5>
                    <p class="small">Effortless Rentals and Expert Property Management</p>
                </div>
                <div class="col-md-2 mb-4">
                    <h5>Explore</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white-50">To Rent</a></li>
                        <li><a href="#" class="text-white-50">Property</a></li>
                        <li><a href="#" class="text-white-50">Pricing</a></li>
                    </ul>
                </div>
                <div class="col-md-2 mb-4">
                    <h5>About</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white-50">About Us</a></li>
                        <li><a href="#" class="text-white-50">Blog</a></li>
                        <li><a href="#" class="text-white-50">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Newsletter</h5>
                    <p class="small">Subscribe for updates on new properties</p>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" placeholder="Your email">
                        <button class="btn btn-outline-light" type="button">Subscribe</button>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="row">
                <div class="col-md-6 small">
                    &copy; 2025 PropertyPro. All rights reserved.
                </div>
                <div class="col-md-6 text-end">
                    <a href="#" class="text-white-50 me-3"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white-50 me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white-50 me-3"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white-50"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </footer>

    
    
    <script>
    function filterProperties() {
        const input = document.getElementById("search");
        const filter = input.value.toUpperCase();
        const container = document.getElementById("propertyContainer");
        const items = container.getElementsByClassName("property-item");

        for (let i = 0; i < items.length; i++) {
            const item = items[i];
            const text = item.textContent || item.innerText;
            if (text.toUpperCase().indexOf(filter) > -1) {
                item.style.display = "";
            } else {
                item.style.display = "none";
            }
        }
    }

    document.getElementById("search").addEventListener("input", filterProperties);
    </script>
</body>
</html>