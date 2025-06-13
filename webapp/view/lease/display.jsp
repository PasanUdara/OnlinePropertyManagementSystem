<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PropertyPro - Lease Management</title>
  <!-- Include Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
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
  border: none;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
}

.btn-login {
  color: #111;
}

.btn-primary {
  background-color: #111;
  color: white;
}

.btn-primary:hover {
  background-color: #333;
}

.btn-create {
  background-color: #FFD700;
  color: #111;
}

.btn-create:hover {
  background-color: #f1c40f;
}

/* Main Content */
.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 30px 0;
}

.page-title {
  font-size: 32px;
  font-weight: 600;
  color: #111;
  display: flex;
  align-items: center;
  gap: 10px;
}

.search-container {
  margin-bottom: 30px;
  position: relative;
}

.search-input {
  width: 100%;
  padding: 15px 20px;
  border: none;
  border-radius: 10px;
  background-color: white;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  font-size: 16px;
}

.search-input:focus {
  outline: none;
  box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
}

.search-icon {
  position: absolute;
  right: 20px;
  top: 50%;
  transform: translateY(-50%);
  color: #777;
}

/* Lease Cards */
.lease-cards-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
  gap: 25px;
  margin-bottom: 50px;
}

.lease-card {
  background-color: white;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  transition: transform 0.3s, box-shadow 0.3s;
}

.lease-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
}

.lease-header {
  background-color: #111;
  color: white;
  padding: 15px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.lease-title {
  font-size: 18px;
  font-weight: 600;
  display: flex;
  align-items: center;
  gap: 8px;
}

.lease-id {
  background-color: #FFD700;
  color: #111;
  padding: 4px 10px;
  border-radius: 20px;
  font-size: 14px;
}

.lease-body {
  padding: 20px;
}

.lease-property {
  margin-bottom: 15px;
}

.property-title {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 5px;
  color: #111;
}

.tenant-name {
  color: #555;
  font-size: 16px;
  display: flex;
  align-items: center;
  gap: 5px;
  margin-bottom: 15px;
}

.lease-details {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
  margin-bottom: 15px;
}

.detail-item {
  display: flex;
  flex-direction: column;
}

.detail-label {
  font-size: 12px;
  color: #777;
  margin-bottom: 5px;
}

.detail-value {
  font-size: 16px;
  font-weight: 500;
  color: #333;
}

.detail-value.highlight {
  color: #FFD700;
  font-weight: 700;
}

.lease-terms {
  background-color: #f8f8f8;
  padding: 15px;
  border-radius: 8px;
  margin-bottom: 20px;
  max-height: 80px;
  overflow-y: auto;
}

.terms-label {
  font-size: 14px;
  font-weight: 600;
  margin-bottom: 5px;
  color: #555;
}

.terms-text {
  font-size: 14px;
  color: #555;
  line-height: 1.4;
}

.lease-footer {
  margin-top: auto;
  padding: 15px 20px;
  background-color: #f8f8f8;
  display: flex;
  justify-content: space-between;
  gap: 10px;
}

.btn-sm {
  padding: 8px 15px;
  font-size: 14px;
}

.btn-outline {
  background-color: transparent;
  border: 1px solid;
}

.btn-success {
  color: #2ecc71;
  border-color: #2ecc71;
}

.btn-success:hover {
  background-color: #2ecc71;
  color: white;
}

.btn-danger {
  color: #e74c3c;
  border-color: #e74c3c;
}

.btn-danger:hover {
  background-color: #e74c3c;
  color: white;
}

.btn-info {
  color: #3498db;
  border-color: #3498db;
}

.btn-info:hover {
  background-color: #3498db;
  color: white;
}

/* Form reset for delete button */
.delete-form {
  display: inline;
  margin: 0;
  padding: 0;
}

.delete-form button {
  width: 100%;
  height: 100%;
}

/* Modal */
.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: none;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal {
  background-color: white;
  border-radius: 10px;
  width: 500px;
  max-width: 90%;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  overflow: hidden;
}

.modal-header {
  background-color: #111;
  color: white;
  padding: 15px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.modal-title {
  font-size: 18px;
  font-weight: 600;
  display: flex;
  align-items: center;
  gap: 8px;
}

.close-btn {
  background: none;
  border: none;
  color: white;
  font-size: 24px;
  cursor: pointer;
}

.modal-body {
  padding: 20px;
}

.modal-footer {
  padding: 15px 20px;
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  background-color: #f8f8f8;
}

/* Responsive */
@media (max-width: 768px) {
  .lease-cards-container {
    grid-template-columns: 1fr;
  }
  
  .lease-details {
    grid-template-columns: 1fr;
  }
  
  .page-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 15px;
  }
  
  .nav-links {
    display: none;
  }
}
</style>
<body>

<% 
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
        <a href="#" class="nav-link">Dashboard</a>
        <a href="#" class="nav-link">Properties</a>
        <a href="#" class="nav-link active">Leases</a>
        <a href="#" class="nav-link">Tenants</a>
      </div>
      
      <div class="auth-buttons">
        <span class="btn btn-signup">Hello, <%=username%></span>
        <a href="view/property/logout.jsp" class="btn btn-signout">Logout</a>
      </div>
    </div>
  </header>
  
  <main>
    <div class="container">
      <div class="page-header">
        <h1 class="page-title">
          <i class="bi bi-file-earmark-text"></i> Lease Management
        </h1>
        
        <a href="view/lease/insert.jsp" class="btn btn-create">
          <i class="bi bi-plus-circle"></i> Create New Lease
        </a>
      </div>
      
      <div class="search-container">
        <input type="text" id="searchInput" class="search-input" placeholder="Search leases by property, tenant, or ID..." onkeyup="filterCards()">
        <span class="search-icon">
          <i class="bi bi-search"></i>
        </span>
      </div>
      
      <div class="lease-cards-container" id="leaseCardsContainer">
        <c:forEach var="lease" items="${allLease}">
          <div class="lease-card">
            <div class="lease-header">
              <div class="lease-title">
                <i class="bi bi-file-lock2-fill"></i> Lease Agreement
              </div>
              <span class="lease-id">LA_${lease.id}</span>
            </div>
            
            <div class="lease-body">
              <div class="lease-property">
                <div class="property-title">Property ID: ${lease.propertyId}</div>
                <div class="tenant-name">
                  <i class="bi bi-person-fill"></i> Tenant ID: ${lease.tenentId}
                </div>
              </div>
              
              <div class="lease-details">
                <div class="detail-item">
                  <span class="detail-label">START DATE</span>
                  <span class="detail-value">${lease.startDate}</span>
                </div>
                
                <div class="detail-item">
                  <span class="detail-label">END DATE</span>
                  <span class="detail-value">${lease.endDate}</span>
                </div>
                
                <div class="detail-item">
                  <span class="detail-label">MONTHLY RENT</span>
                  <span class="detail-value highlight">Rs ${lease.monthlyRent}</span>
                </div>
                
                <div class="detail-item">
                  <span class="detail-label">SECURITY DEPOSIT</span>
                  <span class="detail-value">Rs ${lease.securityDeposit}</span>
                </div>
              </div>
              
              <div class="lease-terms">
                <div class="terms-label">Lease Terms:</div>
                <p class="terms-text">${lease.terms}</p>
              </div>
            </div>
            
            <div class="lease-footer">
              <a href="view/lease/update.jsp?id=${lease.id}&propertyId=${lease.propertyId}&tenentId=${lease.tenentId}&startDate=${lease.startDate}&endDate=${lease.endDate}&monthlyRent=${lease.monthlyRent}&securityDeposit=${lease.securityDeposit}&terms=${lease.terms}" class="btn btn-sm btn-outline btn-success">
                <i class="bi bi-pencil-square"></i> Update
              </a>
              
              <form action="DeleteServlet" method="post" class="delete-form">
                <input type="hidden" name="id" value="${lease.id}">
                <button type="submit" class="btn btn-sm btn-outline btn-danger">
                  <i class="bi bi-trash-fill"></i> Delete
                </button>
              </form>
              
              <button class="btn btn-sm btn-outline btn-info" onclick="showLeaseModal('${lease.id}')">
                <i class="bi bi-eye-fill"></i> View Details
              </button>
            </div>
          </div>
          
          <!-- Modal for this lease -->
          <div id="leaseModal${lease.id}" class="modal-backdrop">
            <div class="modal">
              <div class="modal-header">
                <h5 class="modal-title">
                  <i class="bi bi-file-earmark-text"></i> Lease Agreement Details
                  <span class="lease-id">LA_${lease.id}</span>
                </h5>
                <button type="button" class="close-btn" onclick="closeLeaseModal('${lease.id}')">&times;</button>
              </div>
              <div class="modal-body">
                <div class="lease-details" style="grid-template-columns: 1fr;">
                  <div class="detail-item">
                    <span class="detail-label">PROPERTY ID</span>
                    <span class="detail-value">${lease.propertyId}</span>
                  </div>
                  
                  <div class="detail-item">
                    <span class="detail-label">TENANT ID</span>
                    <span class="detail-value">${lease.tenentId}</span>
                  </div>
                  
                  <div class="detail-item">
                    <span class="detail-label">START DATE</span>
                    <span class="detail-value">${lease.startDate}</span>
                  </div>
                  
                  <div class="detail-item">
                    <span class="detail-label">END DATE</span>
                    <span class="detail-value">${lease.endDate}</span>
                  </div>
                  
                  <div class="detail-item">
                    <span class="detail-label">MONTHLY RENT</span>
                    <span class="detail-value highlight">Rs ${lease.monthlyRent}</span>
                  </div>
                  
                  <div class="detail-item">
                    <span class="detail-label">SECURITY DEPOSIT</span>
                    <span class="detail-value">Rs ${lease.securityDeposit}</span>
                  </div>
                  
                  <div class="detail-item">
                    <span class="detail-label">TERMS & CONDITIONS</span>
                    <div class="lease-terms" style="max-height: none;">
                      <p class="terms-text">${lease.terms}</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-outline btn-info" onclick="closeLeaseModal('${lease.id}')">
                  <i class="bi bi-x-circle"></i> Close
                </button>
              </div>
            </div>
          </div>
          <!-- End Modal -->
        </c:forEach>
      </div>
    </div>
  </main>
  
  <script>
    function filterCards() {
      var input = document.getElementById("searchInput");
      var filter = input.value.toUpperCase();
      var cardsContainer = document.getElementById("leaseCardsContainer");
      var cards = cardsContainer.getElementsByClassName("lease-card");
      
      for (var i = 0; i < cards.length; i++) {
        var card = cards[i];
        var text = card.textContent || card.innerText;
        card.style.display = text.toUpperCase().indexOf(filter) > -1 ? "" : "none";
      }
    }
    
    function showLeaseModal(id) {
      document.getElementById("leaseModal" + id).style.display = "flex";
    }
    
    function closeLeaseModal(id) {
      document.getElementById("leaseModal" + id).style.display = "none";
    }
    
    // Close modals when clicking outside
    window.onclick = function(event) {
      if (event.target.classList.contains("modal-backdrop")) {
        event.target.style.display = "none";
      }
    }
  </script>
</body>
</html>