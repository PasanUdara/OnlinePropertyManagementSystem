<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PropertyPro - Tenant Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
        
        /* Tenant Details Styles */
        .page-title {
            font-size: 32px;
            font-weight: 600;
            color: #111;
            margin: 40px 0 30px;
        }
        
        .tenant-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 40px;
        }
        
        .tenant-header {
            background-color: #111;
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .tenant-header h1 {
            font-size: 1.8rem;
            font-weight: 600;
        }
        
        .status-badge {
            background-color: #FFD700;
            color: #111;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
        }
        
        .tenant-body {
            display: flex;
            padding: 30px;
        }
        
        .tenant-image {
            flex: 0 0 220px;
            margin-right: 30px;
        }
        
        .tenant-image img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .tenant-info {
            flex: 1;
        }
        
        .info-section {
            margin-bottom: 25px;
        }
        
        .info-section h2 {
            font-size: 1.3rem;
            color: #111;
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 1px solid #eee;
            position: relative;
        }
        
        .info-section h2::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -1px;
            width: 40px;
            height: 3px;
            background-color: #FFD700;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        
        .info-item {
            margin-bottom: 10px;
        }
        
        .info-label {
            font-size: 0.85rem;
            color: #777;
            margin-bottom: 5px;
            text-transform: uppercase;
        }
        
        .info-value {
            font-size: 1.1rem;
            font-weight: 500;
            color: #333;
        }
        
        .contact-icons {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }
        
        .contact-icon {
            background-color: #f2f2f2;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #111;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .contact-icon:hover {
            background-color: #FFD700;
        }
        
        .lease-status {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 4px;
            font-size: 0.85rem;
            font-weight: 600;
            margin-left: 10px;
        }
        
        .active {
            background-color: #d5f5e3;
            color: #27ae60;
        }
        
        .expiring {
            background-color: #ffeaa7;
            color: #fdcb6e;
        }
        
        .expired {
            background-color: #ffe5e5;
            color: #e74c3c;
        }
        
        .note-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            border-left: 4px solid #FFD700;
        }
        
        .note-section h3 {
            color: #111;
            margin-bottom: 10px;
            font-size: 1.1rem;
        }
        
        .note-content {
            color: #555;
            font-size: 0.95rem;
            line-height: 1.7;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .action-btn {
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-primary {
            background-color: #FFD700;
            color: #111;
            border: none;
        }
        
        .btn-primary:hover {
            background-color: #f1c40f;
        }
        
        .btn-secondary {
            background-color: #fff;
            color: #111;
            border: 1px solid #ddd;
        }
        
        .btn-secondary:hover {
            background-color: #f5f5f5;
        }
        
        .btn-icon {
            margin-right: 8px;
        }
        
        /* Footer */
        .footer {
            background-color: #000;
            color: #fff;
            width: 100%;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            margin-top: 50px;
        }
        
        .left-section {
            display: flex;
            flex-direction: column;
        }
        
        .brand {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .brand-icon {
            font-size: 24px;
            margin-right: 10px;
        }
        
        .brand-name {
            font-size: 24px;
            font-weight: bold;
        }
        
        .social-icons {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .social-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .social-icon:hover {
            background-color: #555;
        }
        
        .social-icon i {
            color: #fff;
            font-size: 16px;
        }
        
        .newsletter {
            margin-top: 10px;
        }
        
        .newsletter h3 {
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: normal;
        }
        
        .newsletter-form {
            display: flex;
        }
        
        .newsletter-input {
            padding: 10px;
            border: none;
            border-radius: 4px 0 0 4px;
            width: 200px;
            background-color: #222;
            color: #fff;
        }
        
        .newsletter-button {
            padding: 10px 15px;
            border: none;
            border-radius: 0 4px 4px 0;
            background-color: #FFD700;
            color: #000;
            cursor: pointer;
            font-weight: bold;
        }
        
        .footer-divider {
            width: 1px;
            background-color: #333;
            margin: 0 20px;
        }
        
        .footer-links {
            display: flex;
            gap: 40px;
        }
        
        .link-column {
            display: flex;
            flex-direction: column;
        }
        
        .column-title {
            color: #fff;
            margin-bottom: 20px;
            font-size: 18px;
            position: relative;
            padding-bottom: 5px;
        }
        
        .column-title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 40px;
            height: 3px;
            background-color: #FFD700;
        }
        
        .column-links {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .column-link {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .column-link:hover {
            color: #FFD700;
        }
        
        @media (max-width: 768px) {
            .tenant-body {
                flex-direction: column;
            }
            
            .tenant-image {
                margin-right: 0;
                margin-bottom: 20px;
                max-width: 200px;
                align-self: center;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .footer {
                flex-direction: column;
            }
            
            .footer-divider {
                width: 100%;
                height: 1px;
                margin: 20px 0;
            }
            
            .footer-links {
                flex-direction: column;
                gap: 20px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container nav-container">
            <div class="logo-container">
                <a href="#" class="logo">
                    <span class="logo-icon">
                        <i class="fas fa-home"></i>
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
                <a href="#" class="btn btn-login">Log In</a>
                <a href="#" class="btn btn-signup">Sign Up</a>
            </div>
        </div>
    </header>
    
    <!-- Main Content -->
    <main>
        <div class="container">
            <h1 class="page-title">Tenant Details</h1>
            
            <div class="tenant-card">
                <c:choose>
                    <c:when test="${empty tenant}">
                        <div class="tenant-header">
                            <h1>Tenant Not Found</h1>
                        </div>
                        <div class="tenant-body">
                            <p>No tenant details available for this ID.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="t" items="${tenant}">
                            <div class="tenant-header">
                                <h1>${t.name}</h1>
                            </div>
                            
                            <div class="tenant-body">
                                <div class="tenant-image">
                                    <c:choose>
                                        <c:when test="${empty t.image}">
                                            <img src="/api/placeholder/400/500" alt="${t.name}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${t.image}" alt="${t.name}">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                
                                <div class="tenant-info">
                                    <div class="info-section">
                                        <h2>Personal Information</h2>
                                        <div class="info-grid">
                                            <div class="info-item">
                                                <div class="info-label">FULL NAME</div>
                                                <div class="info-value">${t.name}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Email Address</div>
                                                <div class="info-value">${t.email}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Phone Number</div>
                                                <div class="info-value">${t.phone}</div>
                                            </div>
                                        </div>
                                        
                                        <div class="contact-icons">
                                            <a href="tel:${t.phone}" class="contact-icon">
                                                <i class="fas fa-phone"></i>
                                            </a>
                                            <a href="mailto:${t.email}" class="contact-icon">
                                                <i class="fas fa-envelope"></i>
                                            </a>
                                            <a href="#" class="contact-icon">
                                                <i class="fas fa-comment"></i>
                                            </a>
                                        </div>
                                    </div>
                                    
                                    <div class="info-section">
                                        <h2>Lease Information</h2>
                                        <div class="info-grid">
                                            <div class="info-item">
                                                <div class="info-label">Property</div>
                                                <div class="info-value">${t.property}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Lease Start Date</div>
                                                <div class="info-value">${t.startDate}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Lease End Date</div>
                                                <div class="info-value">${t.endDate}</div>
                                            </div>
                                            <div class="info-item">
                                                <div class="info-label">Payment Status</div>
                                                <div class="info-value">Up to date</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <c:if test="${not empty t.note}">
                                        <div class="info-section note-section">
                                            <h3>Notes</h3>
                                            <div class="note-content">
                                                ${t.note}
                                            </div>
                                        </div>
                                    </c:if>
                                    
                                    <div class="action-buttons">
                                        <a href="editTenantProfile.jsp?id=${t.id}&name=${t.name}&email=${t.email}&phone=${t.phone}&note=${t.note}&image=${t.image}" class="action-btn btn-primary">
                                            <i class="fas fa-edit btn-icon"></i> Edit Tenant
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="left-section">
            <div class="brand">
                <div class="brand-icon">
                    <i class="fas fa-home"></i>
                </div>
                <div class="brand-name">PropertyPro</div>
            </div>
            
            <div class="social-icons">
                <div class="social-icon">
                    <i class="fab fa-instagram"></i>
                </div>
                <div class="social-icon">
                    <i class="fab fa-snapchat-ghost"></i>
                </div>
                <div class="social-icon">
                    <i class="fab fa-linkedin-in"></i>
                </div>
                <div class="social-icon">
                    <i class="fab fa-google-plus-g"></i>
                </div>
                <div class="social-icon">
                    <i class="fab fa-facebook-f"></i>
                </div>
                <div class="social-icon">
                    <i class="fab fa-twitter"></i>
                </div>
            </div>
            
            <div class="newsletter">
                <h3>Join our newsletter</h3>
                <form class="newsletter-form">
                    <input type="email" placeholder="email@address.com" class="newsletter-input">
                    <button type="submit" class="newsletter-button">Subscribe</button>
                </form>
            </div>
        </div>
        
        <div class="footer-divider"></div>
        
        <div class="footer-links">
            <div class="link-column">
                <h3 class="column-title">For sale</h3>
                <div class="column-links">
                    <a href="#" class="column-link">Homes</a>
                    <a href="#" class="column-link">Commercial Properties</a>
                    <a href="#" class="column-link">Overseas</a>
                </div>
            </div>
            
            <div class="link-column">
                <h3 class="column-title">To rent</h3>
                <div class="column-links">
                    <a href="#" class="column-link">Homes</a>
                    <a href="#" class="column-link">Commercial Properties</a>
                </div>
            </div>
            
            <div class="link-column">
                <h3 class="column-title">Services</h3>
                <div class="column-links">
                    <a href="#" class="column-link">Property Valuation</a>
                    <a href="#" class="column-link">Agents</a>
                    <a href="#" class="column-link">Mortgage Calculator</a>
                    <a href="#" class="column-link">Guides</a>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>