<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PropertyPro - Property Management</title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }
        
        .container{
        	padding-top: 30px; 
        	padding-bottom: 30px;
        	
        }
        
        header {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
            margin-bottom: 30px;
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
        
        .page-title {
            font-size: 32px;
            font-weight: bold;
            color: #111;
            margin-bottom: 20px;
        }
        
        .property-card {
            margin-bottom: 20px;
            border: none;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .property-img {
            height: 200px;
            object-fit: cover;
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
            margin-right: 10px;
        }
        
        .location-pin {
            color: #FFD700;
            margin-right: 10px;
        }
        
        .property-price {
            font-size: 20px;
            font-weight: bold;
            color: #111;
            margin-right: 10px;
        }
        
        .content{
             margin-left: 10px;
        
        }
        
        
        
       	.btn{
        	background-color:rgb(251, 66, 66);
        	margin-bottom: 10px;
        }
    </style>
</head>
<body>

<%
	String username = (String) session.getAttribute("username");
%>
    <!-- Header -->
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
            
            
            
            <div class="auth-buttons">
                <span class="btn btn-signup">Hello, <%=username%></span>
                <a href="view/property/logout.jsp" class="btn btn-signout">Logout</a>
            </div>
        </div>
    </header>

    <div class="container" >
        <div class="row">
            <div class="col-md-6">
                <h2 class="page-title">Property Listings</h2>
            </div>
            
            
             <!-- search bar -->
            <div class="col-md-6">
                <div class="input-group mb-3">
                    <span class="input-group-text">
                        <i class="fas fa-search content"></i>
                    </span>
                    <input type="text" id="search" class="form-control" placeholder="Search properties...">
                </div>
            </div>
        </div>
        
         <!-- display properties -->

        <div class="row" id="propertyContainer">
            <c:forEach var="al" items="${allp}">
                <div class="col-md-4 property-item">
                    <div class="card property-card">
                        <img src="${al.imagePath}" class="property-img" alt="Property Image">
                        
                        <div class="row">
                        <div class="card-body">
                            <div class="row mb-2">
                                <div class="col-8">
                                    <h5 class="card-title content">${al.title}</h5>
                                </div>
                                <div class="col-4 text-end">
                                    <span class="${al.status == 'Available' ? 'status-available' : 'status-rented'}">
                                        ${al.status}
                                    </span>
                                </div>
                            </div>
                            </div>
                            
                            <p class="mb-2 content">
                                <i class="fas fa-map-marker-alt location-pin"></i>
                                ${al.location}
                            </p>
                            
                            <p class="text-muted mb-3 content">${al.description}</p>
                            
                            <div class="row mb-3">
                                <div class="col">
                                    <i class="fas fa-bed content"></i> ${al.bedrooms} Beds
                                </div>
                                <div class="col">
                                    <i class="fas fa-bath content"></i> ${al.bathrooms} Baths
                                </div>
                                <div class="col">
                                    <i class="fas fa-ruler-combined content"></i> ${al.areaSqft} sqft
                                </div>
                            </div>
                            
                            <p class="property-price mb-3 content">${al.price}</p>
                            
                            <div class="row">
                               
                                <div class="col-6 text-end">
                                    <form action="DeleteAdProperty" method="post">
                                        <input type="hidden" name="id" value="${al.id}">
                                        <input type="hidden" name="userId" value="${al.userId}">
                                        <button type="submit" class="btn ">
                                            <i class="fas fa-trash"></i> Delete
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
      </div>

    
    <!-- search script -->
    <script>
    function filterProperties() {
        const input = document.getElementById("search");
        const filter = input.value.toUpperCase();
        const container = document.getElementById("propertyContainer");
        const properties = container.getElementsByClassName("property-item");

        for (let i = 0; i < properties.length; i++) {
            const property = properties[i];
            const text = property.textContent || property.innerText;
            if (text.toUpperCase().indexOf(filter) > -1) {
                property.style.display = "";
            } else {
                property.style.display = "none";
            }
        }
    }

    document.getElementById("search").addEventListener("input", filterProperties);
    </script>
</body>
</html>