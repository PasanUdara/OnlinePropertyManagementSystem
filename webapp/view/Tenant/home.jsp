<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PropertyPro - Your Property Management Solution</title>
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
    
    /* Hero Section */
    .hero {
      position: relative;
      height: 600px;
      overflow: hidden;
      border-radius: 10px;
      margin-top: 20px;
    }
    
    .hero-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
    }
    
    .hero-content {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.6));
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 0 20px;
      color: white;
    }
    
    .hero-title {
      font-size: 48px;
      margin-bottom: 20px;
      font-weight: 600;
    }
    
    .hero-subtitle {
      font-size: 20px;
      max-width: 700px;
      margin-bottom: 40px;
      line-height: 1.5;
    }

    
    
    /* Search Box */
    .search-box {
      background-color: white;
      border-radius: 10px;
      padding: 20px;
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      max-width: 900px;
      width: 100%;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
    }
    
    .search-option {
      flex: 1;
      min-width: 150px;
      display: flex;
      flex-direction: column;
      border-right: 1px solid #eee;
      padding: 0 15px;
    }
    
    .search-option:last-child {
      border-right: none;
    }
    
    .search-label {
      font-size: 12px;
      color: #777;
      margin-bottom: 8px;
    }
    
    .search-input {
      border: none;
      font-size: 16px;
      color: #333;
      width: 100%;
    }
    
    .search-input:focus {
      outline: none;
    }
    
    .search-button {
      background-color: #FFD700;
      color: #111;
      border: none;
      padding: 12px 25px;
      border-radius: 25px;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s;
      display: flex;
      align-items: center;
      justify-content: center;
      min-width: 150px;
    }
    
    .search-button:hover {
      background-color: #f1c40f;
    }
    
    .location-icon {
      margin-right: 5px;
    }
    
    select.search-input {
      appearance: none;
      background-image: url("data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23131313%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E");
      background-repeat: no-repeat;
      background-position: right 0.5rem center;
      background-size: 0.65rem auto;
      padding-right: 20px;
      cursor: pointer;
    }
    
    /* Property Cards Section */
    .section-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin: 50px 0 30px;
    }
    
    .section-title {
      font-size: 32px;
      font-weight: 600;
      color: #111;
    }
    
    .view-all {
      color: #111;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }
    
    .view-all:hover {
      color: #FFD700;
    }
    
    /* Slider Styles */
    .property-slider {
      position: relative;
      width: 100%;
      overflow: hidden;
    }
    
    .slider-container {
      display: flex;
      transition: transform 0.5s ease;
    }
    
    .property-card {
      flex: 0 0 calc(33.333% - 20px);
      margin: 0 10px;
      background-color: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    
    .property-image {
      width: 100%;
      height: 220px;
      object-fit: cover;
    }
    
    .property-details {
      padding: 20px;
    }
    
    .property-price {
      font-size: 24px;
      font-weight: 700;
      margin-bottom: 5px;
    }
    
    .property-location {
      display: flex;
      align-items: center;
      font-size: 14px;
      color: #555;
      margin-bottom: 15px;
    }
    
    .location-pin {
      color: #FFD700;
      margin-right: 5px;
    }
    
    .property-features {
      display: flex;
      gap: 10px;
      margin-bottom: 15px;
    }
    
    .feature {
      display: flex;
      align-items: center;
      background-color: #f5f5f5;
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 12px;
      color: #555;
    }
    
    .feature svg {
      margin-right: 5px;
    }
    
    .property-description {
      font-size: 14px;
      color: #555;
      line-height: 1.5;
      margin-bottom: 15px;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }
    
    .property-footer {
      display: flex;
      justify-content: space-between;
      font-size: 12px;
      color: #777;
    }
    
    .slider-controls {
      display: flex;
      justify-content: center;
      margin-top: 30px;
      gap: 10px;
    }
    
    .slider-dot {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      background-color: #ddd;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    
    .slider-dot.active {
      background-color: #111;
    }
    
    .slider-arrow {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      width: 40px;
      height: 40px;
      background-color: white;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      cursor: pointer;
      z-index: 10;
    }
    
    .slider-prev {
      left: -20px;
    }
    
    .slider-next {
      right: -20px;
    }

    .bottom {
      background-color: #f5f5f5;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      position: relative;
    }

    .bottom-top{
        width: 70%;
        height: 250px;
        background-color: #fff;
        box-shadow: -3px 6px 14px 8px rgba(153,142,142,0.69);
        -webkit-box-shadow: -3px 6px 14px 8px rgba(153,142,142,0.69);
        -moz-box-shadow: -3px 6px 14px 8px rgba(153,142,142,0.69);
        margin-top: 100px;
        margin-bottom: 50px;
        border-radius: 20px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        
    }

    .bottom-top .btn-signup{
        background-color: #FFD700;
        color: #111;
        border: none;
        padding: 12px 25px;
        font-weight: 600;
        width: 200px;
    }

    .bottom-top img{
        width: 280px;
        height: 280px;
        border-radius: 50%;
        margin-left: 20px;
        position: absolute;
        right: 100px;
        top: 85px;
    }

    .bottom-top-card{
        margin-left: 50px;
        display: flex;
        flex-direction: column;
    }

    .bottom-top-card span{
        font-size: 14px;
        color: #777;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    
   

     .footer {
            background-color: #000;
            color: #fff;
            width: 100%;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
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
            background-color: #ffde00;
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
            background-color: #ffde00;
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
            color: #ffde00;
        }

        .yellow-underline::after {
            background-color: #ffde00;
        }
  </style>
</head>
<body>
	<%
    
    String userId = request.getParameter("userId");
	String username = (String) session.getAttribute("username");
    
    
    %>
  <header>
    <div class="container nav-container">
      <div class="logo-container">
        <a href="#" class="logo">
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
        <a href="../property/logout.jsp" class="btn btn-login">Log Out</a>
        <span class="btn btn-signup">Welcome, <%=username%></span>
      </div>
    </div>
  </header>
  
  <main>
    <div class="container">
      <section class="hero">
        <img src="assest/pool.jpg" alt="Modern interior design" class="hero-image">
        <div class="hero-content">
          <h1 class="hero-title">Discover your perfect space</h1>
          <p class="hero-subtitle">Effortless Rentals and Expert Property Management Tailored Just for You</p>
          
          <div class="search-box">
            <div class="search-option">
              <label class="search-label">
                <img src="assest/kitchen.jpg" width="55px" height="55px" style="border-radius: 50%;" alt="Kitchen">
              </label>
            </div>
            
            <div class="search-option">
              <label class="search-label">TYPE</label>
              <select class="search-input">
                <option value="flat">Tenant</option>
                <option value="house">Property</option>
              </select>
            </div>
            
            <div class="search-option">
              <label class="search-label">LOCATION</label>
              <div style="display: flex; align-items: center;">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#777" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="location-icon">
                  <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                  <circle cx="12" cy="10" r="3"></circle>
                </svg>
                <input type="text" class="search-input" placeholder="Enter location" value="Brixton, London">
              </div>
            </div>
            
            <div class="search-option">
              <label class="search-label">MAX PRICE</label>
              <input type="text" class="search-input" placeholder="£" value="£3,500">
            </div>
            
            <button class="search-button">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="margin-right: 8px;">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
              </svg>
              Search
            </button>
          </div>
        </div>
      </section>
      
      <section class="property-section">
        <div class="section-header">
          <h2 class="section-title">Recently added</h2>
          <a href="#" class="view-all">VIEW ALL</a>
        </div>
          
          <div class="slider-container" id="propertySlider">
            <div class="property-card">
              <img src="assest/property.jpg" alt="Property" class="property-image">
              <div class="property-details">
                <h3 class="property-price">£2,950 pcm</h3>
                <div class="property-location">
                  <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="#FFD700" stroke="#FFD700" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="location-pin">
                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                    <circle cx="12" cy="10" r="3"></circle>
                  </svg>
                  Brixton Road, London SW9
                </div>
                
                <div class="property-features">
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                      <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                    3 bed
                  </div>
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M22 2H2v20h20V2zM2 12h20M7 12v10M17 12v10"></path>
                    </svg>
                    1 bat
                  </div>
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                    </svg>
                    85 m²
                  </div>
                </div>
                
                <p class="property-description">
                  Stylish 2-bedroom flat nestled in the heart of Brixton Hill. Boasting modern interiors and an excellent location.
                </p>
                
                <div class="property-footer">
                  <span>Available immediately</span>
                  <span>Listed 5 days ago</span>
                </div>
              </div>
            </div>
            
            <!-- Property Card 2 -->
            <div class="property-card">
              <img src="assest/pool.jpg" alt="Property" class="property-image">
              <div class="property-details">
                <h3 class="property-price">£2,700 pcm</h3>
                <div class="property-location">
                  <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="#FFD700" stroke="#FFD700" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="location-pin">
                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                    <circle cx="12" cy="10" r="3"></circle>
                  </svg>
                  Kintyre Court, London SW2
                </div>
                
                <div class="property-features">
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                      <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                    2 bed
                  </div>
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M22 2H2v20h20V2zM2 12h20M7 12v10M17 12v10"></path>
                    </svg>
                    1 bat
                  </div>
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                    </svg>
                    75 m²
                  </div>
                </div>
                
                <p class="property-description">
                  The flat offers a well-appointed kitchen, a cozy living area, and a tranquil bedroom retreat. With Brixton's vibrant scene nearby.
                </p>
                
                <div class="property-footer">
                  <span>Available immediately</span>
                  <span>Listed 5 days ago</span>
                </div>
              </div>
            </div>
            
            <!-- Property Card 3 -->
            <div class="property-card">
              <img src="assest/garden.jpg" alt="Property" class="property-image">
              <div class="property-details">
                <h3 class="property-price">£2,600 pcm</h3>
                <div class="property-location">
                  <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="#FFD700" stroke="#FFD700" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="location-pin">
                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                    <circle cx="12" cy="10" r="3"></circle>
                  </svg>
                  Josh Avenue, London SW2
                </div>
                
                <div class="property-features">
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                      <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                    3 bed
                  </div>
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M22 2H2v20h20V2zM2 12h20M7 12v10M17 12v10"></path>
                    </svg>
                    1 bat
                  </div>
                  <div class="feature">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                    </svg>
                    98 m²
                  </div>
                </div>
                
                <p class="property-description">
                  Discover the perfect family home in Brixton Hill with this generously sized 3-bedroom flat with modern amenities.
                </p>
                
                <div class="property-footer">
                  <span>Available immediately</span>
                  <span>Listed 6 days ago</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </section>

      <div class="bottom">
        <div class="bottom-top">
            <div class="bottom-top-card">
                <h2>Want to rent your property?</h2>
                <span>Get your property instantly valued online today!</span>
                <button class="btn btn-signup">Sign Up Now</button>
            </div>
            <img src="assest/logo.jpg" alt="">
        <div class="bottom-middle">
        </div>
      </div>
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
    </div>
  </main>
  
</body>
</html>