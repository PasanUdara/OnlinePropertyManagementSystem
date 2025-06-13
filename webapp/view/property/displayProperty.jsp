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
        
        .container{
        	padding-top: 30px; 
        	padding-bottom: 30px;
        	
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
        }
        
        .location-pin {
            color: #FFD700;
            margin-right: 5px;
        }
        
        .property-price {
            font-size: 20px;
            font-weight: bold;
            color: #111;
        }
        
        .add-prop {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-top: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        
        .form-control{
        	border-radius: 15px;
        }
       
        
        .btn-delete  {
            margin-right: 5px;
            background-color:#dc3545;
        }
        
        .btn-add  {
            color: #111; 
           font-weight: bold;
           background-color:#FFD700;
        }
        .btn-add:hover  {
            color: #FFD700;
        }
        .btn-delete:hover  {
            
            color: #FFD700;
        }
        
        .btn-delete:hover  {
            
            color: #FFD700;
        }
        
        .btn-update:hover  {
            
            background-color: black;
            color:white;
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

	<!-- search box -->
    <div class="container" >
        <div class="row">
            <div class="col-md-6">
                <h2 class="page-title">Property Listings</h2>
            </div>
            <div class="col-md-6 " >
                <div class="input-group mb-3 searchbox">
                    
                    <input type="text" id="search" class="form-control" placeholder="Search properties...">
                </div>
            </div>
        </div>

	<!-- Display properties -->
        <div class="row" id="propertyContainer">
            <c:forEach var="al" items="${allp}">
                <div class="col-md-4 property-item">
                    <div class="card property-card">
                        <img src="${al.imagePath}" class="property-img" alt="Property Image">
                        <div class="card-body">
                            <div class="row mb-2">
                                <div class="col-8">
                                    <h5 class="card-title">${al.title}</h5>
                                </div>
                                <div class="col-4 text-end">
                                    <span class="${al.status == 'Available' ? 'status-available' : 'status-rented'}">
                                        ${al.status}
                                    </span>
                                </div>
                            </div>
                            
                            <p class="mb-2">
                                <i class="fas fa-map-marker-alt location-pin"></i>
                                ${al.location}
                            </p>
                            
                            <p class="text-muted mb-3">${al.description}</p>
                            
                            <div class="row mb-3">
                                <div class="col">
                                    <i class="fas fa-bed"></i> ${al.bedrooms} Beds
                                </div>
                                <div class="col">
                                    <i class="fas fa-bath"></i> ${al.bathrooms} Baths
                                </div>
                                <div class="col">
                                    <i class="fas fa-ruler-combined"></i> ${al.areaSqft} sqft
                                </div>
                            </div>
                            
                            <p class="property-price mb-3">${al.price}</p>
                            
                            <div class="row">
                                <div class="col-6">
                                    <a href="view/property/updateProperty.jsp?id=${al.id}&title=${al.title}&description=${al.description}&type=${al.type}&price=${al.price}&bedrooms=${al.bedrooms}&bathrooms=${al.bathrooms}&areaSqft=${al.areaSqft}&location=${al.location}&status=${al.status}&userId=${al.userId}&imagePath=${al.imagePath}" 
                                       class="btn btn-update">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                </div>
                                <div class="col-6 text-end">
                                    <form action="DeleteServ" method="post">
                                        <input type="hidden" name="id" value="${al.id}">
                                        <input type="hidden" name="userId" value="${al.userId}">
                                        <button type="submit" class="btn btn-delete">
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
        
        <!-- add property -->
        <div class="add-prop text-center">
            <div class="row">
                <div class="col-md-8 text-md-start">
                    <h3>Want to rent your property?</h3>
                    <p class="text-muted">Get your property instantly valued online today!</p>
                </div>
                <div class="col-md-4 text-md-end">
                    <a href="#" class="btn btn-add" >Add New Property</a>
                </div>
            </div>
        </div>
    </div>

    
    <!-- searching -->>
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