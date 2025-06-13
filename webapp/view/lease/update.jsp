<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PropertyPro - Update Lease Agreement</title>
  <style>
  
  /* Global Styles - Updated Path */
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

/* Form Section */
.form-section {
  padding: 40px 0;
}

.form-card {
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
  max-width: 700px;
  margin: 0 auto;
  overflow: hidden;
}

.form-header {
  background-color: #111;
  color: white;
  padding: 20px;
  text-align: center;
}

.form-header h2 {
  font-size: 24px;
  font-weight: 600;
}

.form-body {
  padding: 30px;
}

.form-group {
  margin-bottom: 20px;
}

.form-label {
  display: block;
  font-size: 14px;
  color: #555;
  margin-bottom: 8px;
  font-weight: 500;
}

.form-control {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 16px;
  transition: border-color 0.3s;
}

.form-control:focus {
  outline: none;
  border-color: #FFD700;
  box-shadow: 0 0 0 2px rgba(255, 215, 0, 0.2);
}

.form-row {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -10px;
}

.form-col {
  flex: 1;
  padding: 0 10px;
  min-width: 200px;
}

.input-group {
  display: flex;
  align-items: center;
}

.input-group-text {
  padding: 12px 15px;
  background-color: #f5f5f5;
  border: 1px solid #ddd;
  border-right: none;
  border-radius: 5px 0 0 5px;
  color: #555;
}

.input-group .form-control {
  border-radius: 0 5px 5px 0;
}

textarea.form-control {
  resize: vertical;
  min-height: 100px;
}

.invalid-feedback {
  display: none;
  color: #dc3545;
  font-size: 12px;
  margin-top: 5px;
}

.form-control.is-invalid {
  border-color: #dc3545;
}

.form-control.is-invalid + .invalid-feedback {
  display: block;
}

.submit-btn {
  background-color: #FFD700;
  color: #111;
  border: none;
  border-radius: 25px;
  width: 100%;
  padding: 14px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.3s;
  margin-top: 10px;
}

.submit-btn:hover {
  background-color: #f1c40f;
}

/* Media Queries */
@media (max-width: 768px) {
  .form-row {
    flex-direction: column;
  }
  
  .form-col {
    width: 100%;
    margin-bottom: 15px;
  }
  
  .form-col:last-child {
    margin-bottom: 0;
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
      
      
    </div>
  </header>
  
  <main>
    <div class="container">
      <section class="form-section">
        <div class="form-card">
          <div class="form-header">
            <h2>Update Lease Agreement</h2>
          </div>
          <div class="form-body">
            <%
                String id = request.getParameter("id");
                String propertyId = request.getParameter("propertyId");
                String tenentId = request.getParameter("tenentId");
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                String monthlyRent = request.getParameter("monthlyRent");
                String securityDeposit = request.getParameter("securityDeposit");
                String terms = request.getParameter("terms");
            %>
            <form action="../../UpdateServlet" method="post" class="needs-validation" novalidate>
              <input type="hidden" name="id" value="<%= id %>">
              
              <div class="form-group">
                <label for="propertyId" class="form-label">Property ID</label>
                <input type="text" class="form-control" id="propertyId" name="propertyId" value="<%= propertyId %>" required>
                <div class="invalid-feedback">Please provide a property ID.</div>
              </div>
              
              <div class="form-group">
                <label for="tenentId" class="form-label">Tenant ID</label>
                <input type="text" class="form-control" id="tenentId" name="tenentId" value="<%= tenentId %>" required>
                <div class="invalid-feedback">Please provide a tenant ID.</div>
              </div>
              
              <div class="form-row">
                <div class="form-col">
                  <div class="form-group">
                    <label for="startDate" class="form-label">Start Date</label>
                    <input type="date" class="form-control" id="startDate" name="startDate" value="<%= startDate %>" required>
                    <div class="invalid-feedback">Please select a start date.</div>
                  </div>
                </div>
                <div class="form-col">
                  <div class="form-group">
                    <label for="endDate" class="form-label">End Date</label>
                    <input type="date" class="form-control" id="endDate" name="endDate" value="<%= endDate %>" required>
                    <div class="invalid-feedback">Please select an end date.</div>
                  </div>
                </div>
              </div>
              
              <div class="form-row">
                <div class="form-col">
                  <div class="form-group">
                    <label for="monthlyRent" class="form-label">Monthly Rent</label>
                    <div class="input-group">
                      <span class="input-group-text">Rs</span>
                      <input type="number" class="form-control" id="monthlyRent" name="monthlyRent" value="<%= monthlyRent %>" required>
                    </div>
                    <div class="invalid-feedback">Please enter the monthly rent amount.</div>
                  </div>
                </div>
                <div class="form-col">
                  <div class="form-group">
                    <label for="securityDeposit" class="form-label">Security Deposit</label>
                    <div class="input-group">
                      <span class="input-group-text">Rs</span>
                      <input type="number" class="form-control" id="securityDeposit" name="securityDeposit" value="<%= securityDeposit %>" required>
                    </div>
                    <div class="invalid-feedback">Please enter the security deposit amount.</div>
                  </div>
                </div>
              </div>
              
              <div class="form-group">
                <label for="terms" class="form-label">Terms</label>
                <textarea class="form-control" id="terms" name="terms" rows="3" required><%= terms %></textarea>
                <div class="invalid-feedback">Please provide the lease terms.</div>
              </div>
              
              <button type="submit" class="submit-btn">Update Agreement</button>
            </form>
          </div>
        </div>
      </section>
    </div>
  </main>
  
  <script>
    // Form validation
    (function() {
      'use strict';
      
      const forms = document.querySelectorAll('.needs-validation');
      
      Array.prototype.slice.call(forms).forEach(function(form) {
        form.addEventListener('submit', function(event) {
          if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
          }
          
          const inputs = form.querySelectorAll('.form-control');
          inputs.forEach(input => {
            if (!input.checkValidity()) {
              input.classList.add('is-invalid');
            } else {
              input.classList.remove('is-invalid');
            }
            
            input.addEventListener('input', function() {
              if (this.checkValidity()) {
                this.classList.remove('is-invalid');
              }
            });
          });
          
          form.classList.add('was-validated');
        }, false);
      });
    })();
  </script>
</body>
</html>