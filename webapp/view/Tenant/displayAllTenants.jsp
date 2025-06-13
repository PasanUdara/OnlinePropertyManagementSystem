<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PropertyPro - Tenants Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        /* Header Section */
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
        
        /* Tenant Header */
        .tenant-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .tenant-header h1 {
            font-weight: 600;
            color: #2c3e50;
            font-size: 32px;
        }
        
        .btn-add-tenant {
            background-color: #111;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 12px 20px;
            font-weight: 500;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        
        .btn-add-tenant:hover {
            background-color: #333;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            color: #FFD700;
        }
        
        /* Search bar styles */
        .search-container {
            background-color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        
        .search-container:hover {
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        
        .search-title {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 1.2rem;
            font-weight: 500;
        }
        
        .search-form {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .search-input-group {
            flex: 1;
            min-width: 200px;
            position: relative;
        }
        
        .search-input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #7f8c8d;
        }
        
        .search-input {
            width: 100%;
            padding: 12px 12px 12px 40px;
            border-radius: 25px;
            border: 1px solid #dfe6e9;
            transition: all 0.3s;
        }
        
        .search-input:focus {
            border-color: #FFD700;
            box-shadow: 0 0 0 3px rgba(255, 215, 0, 0.2);
            outline: none;
        }
        
        .search-buttons {
            display: flex;
            gap: 10px;
        }
        
        .btn-search {
            background-color: #111;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 12px 20px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-search:hover {
            background-color: #333;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
            color: #FFD700;
        }
        
        .btn-reset {
            background-color: #f1f3f4;
            color: #2c3e50;
            border: none;
            border-radius: 25px;
            padding: 12px 20px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-reset:hover {
            background-color: #e2e6ea;
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
        }
        
        /* Filter badges styles */
        .filter-badges {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
        }
        
        .filter-badge {
            background-color: #e1f5fe;
            color: #0288d1;
            border-radius: 20px;
            padding: 5px 15px;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            margin-bottom: 5px;
        }
        
        .filter-badge .remove-filter {
            background-color: transparent;
            border: none;
            color: #0288d1;
            margin-left: 5px;
            cursor: pointer;
            padding: 0 5px;
            font-size: 0.9rem;
        }
        
        .filter-badge .remove-filter:hover {
            color: #01579b;
        }
        
        /* Tenant Card Styles */
        .card {
            margin-bottom: 25px;
            border-radius: 15px;
            border: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            overflow: hidden;
        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }
        
        .card-header {
            background: #111;
            color: white;
            display: flex;
            align-items: center;
            padding: 20px;
            border-bottom: none;
            position: relative;
            overflow: hidden;
        }
        
        .card-header::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255, 215, 0, 0.2), transparent);
            z-index: 1;
        }
        
        .tenant-image {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid rgba(255, 215, 0, 0.3);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            position: relative;
            z-index: 2;
        }
        
        .tenant-name {
            margin-left: 20px;
            font-weight: 600;
            letter-spacing: 0.5px;
            position: relative;
            z-index: 2;
        }
        
        .card-body {
            padding: 25px;
        }
        
        .property-badge {
            font-size: 0.9rem;
            padding: 6px 12px;
            border-radius: 20px;
            background-color: #FFD700;
            color: #111;
            margin-bottom: 15px;
            display: inline-block;
            font-weight: 500;
        }
        
        .card-text {
            margin-bottom: 10px;
            color: #555;
        }
        
        .fas {
            color: #FFD700;
            width: 20px;
            text-align: center;
            margin-right: 10px;
        }
        
        .tenant-dates {
            font-size: 0.9rem;
            color: #7f8c8d;
            background-color: #f1f3f4;
            padding: 12px;
            border-radius: 8px;
            margin: 15px 0;
        }
        
        .tenant-dates p {
            margin-bottom: 5px;
        }
        
        .notes-section {
            background-color: #fff9c4;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            border-left: 4px solid #FFD700;
        }
        
        .notes-section p {
            margin-bottom: 0;
            color: #5d4037;
        }
        
        .notes-section strong {
            display: block;
            margin-bottom: 5px;
            color: #424242;
        }
        
        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }
        
        .btn-update {
            background-color: #FFD700;
            color: #111;
            border: none;
            border-radius: 25px;
            padding: 8px 16px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-update:hover {
            background-color: #f1c40f;
            transform: translateY(-3px);
            box-shadow: 0 5px 10px rgba(241, 196, 15, 0.3);
        }
        
        .btn-delete {
            position: relative;
            background: #111;
            color: white;
            border: none;
            border-radius: 25px;
            padding: 8px 16px;
            font-weight: 500;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: inline-flex;
            align-items: center;
        }
        
        .btn-delete:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 14px rgba(0, 0, 0, 0.2);
            background-color: #333;
        }
        
        .btn-delete:active {
            transform: translateY(1px);
        }
        
        .btn-delete::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            transition: 0.5s;
        }
        
        .btn-delete:hover::before {
            left: 100%;
        }
        
        .btn-delete i {
            margin-right: 5px;
            transition: all 0.3s;
        }
        
        .btn-delete:hover i {
            transform: scale(1.1);
            color: #FFD700;
        }
        
        /* No results styling */
        .no-results {
            text-align: center;
            padding: 40px 20px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .no-results i {
            font-size: 64px;
            color: #ddd;
            margin-bottom: 20px;
        }
        
        .no-results h3 {
            color: #2c3e50;
            font-weight: 500;
            margin-bottom: 10px;
        }
        
        .no-results p {
            color: #7f8c8d;
            margin-bottom: 20px;
        }
        
        .alert-info {
            border-radius: 15px;
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            color: #0c5460;
            padding: 30px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        /* Footer */
        footer {
            background-color: #111;
            color: #fff;
            padding: 30px 0;
            margin-top: 50px;
        }
        
        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .footer-brand {
            display: flex;
            align-items: center;
        }
        
        .footer-brand-icon {
            color: #fff;
            background-color: transparent;
            margin-right: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .footer-brand-name {
            font-weight: bold;
            font-size: 20px;
        }
        
        .footer-highlight {
            color: #FFD700;
        }
        
        .footer-links {
            display: flex;
            gap: 20px;
        }
        
        .footer-link {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-link:hover {
            color: #FFD700;
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

    <div class="container">
        <div class="tenant-header">
            <h1>Tenants Management</h1>
        </div>
        
        <!-- Search Bar - For Name Only -->
        <div class="search-container">
            <h5 class="search-title">Search Tenants by Name</h5>
            <div class="search-form">
                <div class="search-input-group">
                    <i class="fas fa-search"></i>
                    <input type="text" id="nameSearchInput" class="search-input" placeholder="Search by tenant name...">
                </div>
                <div class="search-buttons">
                    <button type="button" id="searchButton" class="btn btn-search">
                        <i class="fas fa-search me-2"></i>Search
                    </button>
                    <button type="button" id="resetButton" class="btn btn-reset">
                        <i class="fas fa-times me-2"></i>Reset
                    </button>
                </div>
            </div>
            
            <!-- Filter badges - will appear when search is active -->
            <div class="filter-badges" id="filterBadges" style="display: none;">
                <!-- Dynamically generated badges will appear here -->
            </div>
        </div>
        
        <div class="row" id="tenantsContainer">
            <c:forEach var="tenant" items="${allTenants}">
                <div class="col-md-6 col-lg-4 tenant-card">
                    <div class="card">
                        <div class="card-header">
                            <img src="${tenant.image != null ? tenant.image : '/api/placeholder/90/90'}" 
                                 alt="${tenant.name}" class="tenant-image">
                            <h5 class="mb-0 tenant-name">${tenant.name}</h5>
                        </div>
                        <div class="card-body">
                            <span class="badge property-badge">${tenant.property}</span>
                            
                            <div class="mb-3">
                                <p class="card-text mb-2">
                                    <i class="fas fa-envelope"></i>${tenant.email}
                                </p>
                                <p class="card-text">
                                    <i class="fas fa-phone"></i>${tenant.phone}
                                </p>
                            </div>
                            
                            <div class="tenant-dates">
                                <p class="mb-1"><strong>Lease Start Date:</strong> ${tenant.startDate}</p>
                                <p><strong>Lease End Date:</strong> ${tenant.endDate}</p>
                            </div>
                            
                            <div class="notes-section">
                                <strong>Notes:</strong>
                                <p>${tenant.note}</p>
                            </div>
                            
                            <div class="action-buttons">
                                <a href="view/Tenant/updateTenant.jsp?id=${tenant.id}&name=${tenant.name}&email=${tenant.email}&phone=${tenant.phone}&property=${tenant.property}&startDate=${tenant.startDate}&endDate=${tenant.endDate}&note=${tenant.note}&image=${tenant.image}&userId=${tenant.userId}" class="btn btn-update">
                                    <i name="update" class="fas fa-edit me-1"></i>Update
                                </a>
                                
                                <form action="DeleteTenant" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this tenant?')">
                                    <input type="hidden" name="id" value="${tenant.id}">
                                    <input type="hidden" name="userId" value="${tenant.userId}">
                                    <button type="submit" class="btn btn-delete">
                                        <i class="fas fa-trash-alt me-1"></i> Delete
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <!-- Empty state message if no tenants -->
        <c:if test="${empty allTenants}">
            <div class="alert alert-info text-center mt-4">
                <h4>No tenants found</h4>
                <p>Click the "Add New Tenant" button to add your first tenant.</p>
            </div>
        </c:if>
        
        <!-- No search results message (hidden by default) -->
        <div id="noResultsContainer" class="no-results" style="display: none;">
            <i class="fas fa-search fa-4x text-muted mb-3"></i>
            <h3>No matching tenants found</h3>
            <p>Try searching for a different name</p>
            <button id="clearSearchButton" class="btn btn-search">
                <i class="fas fa-times me-2"></i>Clear Search
            </button>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-brand">
                    <div class="footer-brand-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                        </svg>
                    </div>
                    <div class="footer-brand-name">Property<span class="footer-highlight">Pro</span></div>
                </div>
                <div class="footer-links">
                    <a href="#" class="footer-link">Privacy Policy</a>
                    <a href="#" class="footer-link">Terms of Service</a>
                    <a href="#" class="footer-link">Contact</a>
                    <a href="#" class="footer-link">© 2025 PropertyPro</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    
    <!-- Name Search functionality -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const nameSearchInput = document.getElementById('nameSearchInput');
            const searchButton = document.getElementById('searchButton');
            const resetButton = document.getElementById('resetButton');
            const clearSearchButton = document.getElementById('clearSearchButton');
            const tenantCards = document.querySelectorAll('.tenant-card');
            const noResultsContainer = document.getElementById('noResultsContainer');
            const filterBadges = document.getElementById('filterBadges');
            const tenantsContainer = document.getElementById('tenantsContainer');
            
            // Function to perform name search
            function performNameSearch() {
                const searchName = nameSearchInput.value.toLowerCase().trim();
                
                if (searchName === '') {
                    resetSearch();
                    return;
                }
                
                // Show filter badges
                filterBadges.style.display = 'flex';
                filterBadges.innerHTML = `
                    <div class="filter-badge">
                        <span>Name: ${searchName}</span>
                        <button class="remove-filter" onclick="resetSearch()">×</button>
                    </div>
                `;
                
                // Count visible cards
                let visibleCount = 0;
                
                // Loop through all tenant cards and check if they match the name search
                tenantCards.forEach(card => {
                    const tenantName = card.querySelector('.tenant-name').textContent.toLowerCase();
                    if (tenantName.includes(searchName)) {
                        card.style.display = 'block';
                        visibleCount++;
                    } else {
                        card.style.display = 'none';
                    }
                });
                
                // Show/hide no results message
                if (visibleCount === 0) {
                    noResultsContainer.style.display = 'block';
                    tenantsContainer.style.display = 'none';
                } else {
                    noResultsContainer.style.display = 'none';
                    tenantsContainer.style.display = 'flex';
                }
            }
            
            // Function to reset search
            function resetSearch() {
                nameSearchInput.value = '';
                filterBadges.style.display = 'none';
                filterBadges.innerHTML = '';
                
                tenantCards.forEach(card => {
                    card.style.display = 'block';
                });
                
                noResultsContainer.style.display = 'none';
                tenantsContainer.style.display = 'flex';
            }
            
                       
            // Add event listeners
            searchButton.addEventListener('click', performNameSearch);
            resetButton.addEventListener('click', resetSearch);
            clearSearchButton.addEventListener('click', resetSearch);
            
            // Search when Enter key is pressed
            nameSearchInput.addEventListener('keyup', function(event) {
                if (event.key === 'Enter') {
                    performNameSearch();
                }
            });
        });
    </script>
</body>
</html>