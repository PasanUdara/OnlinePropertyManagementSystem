<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Details - PropertyPro</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
</head>
<style>
@charset "ISO-8859-1";
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');

/* General body styling */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
  background-color: #f5f5f5;
  color: #142c3b;
  margin: 0;
  padding: 0;
  min-height: 100vh;
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
  text-decoration: none;
}

.btn-login {
  color: #111;
}

.user-bar {
  display: flex;
  gap: 15px;
  align-items: center;
}

.user-greeting {
  font-weight: 600;
  color: #111;
  font-size: 16px;
}

/* Main Content Section */
main {
  padding: 30px 0;
}

.content-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 15px;
}

h1 {
  color: #111;
  text-align: center;
  margin: 30px 0;
  font-weight: 600;
  font-size: 32px;
}

/* Search Input */
#SearchInput {
  display: block;
  width: 100%;
  max-width: 300px;
  margin: 20px auto;
  padding: 12px 15px;
  border: 1px solid #ddd;
  border-radius: 8px;
  font-size: 14px;
  transition: box-shadow 0.3s ease;
}

#SearchInput:focus {
  outline: none;
  box-shadow: 0 0 0 2px rgba(255, 215, 0, 0.3);
  border-color: #FFD700;
}

/* Table styling */
table {
  width: 100%;
  border-collapse: collapse;
  margin: 30px auto;
  background-color: white;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

th, td {
  padding: 15px;
  text-align: left;
  border-bottom: 1px solid #eee;
}

th {
  background-color: #111;
  color: #FFD700;
  text-transform: uppercase;
  font-size: 14px;
  font-weight: 500;
}

td {
  color: #333;
  font-size: 14px;
}

tr:hover td {
  background-color: rgba(255, 215, 0, 0.05);
}

/* Button styling inside the Actions column */
button {
  padding: 8px 15px;
  border: none;
  border-radius: 25px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s;
  color: white;
  margin-right: 5px;
  font-size: 13px;
}

button#update {
  background-color: #FFD700;
  color: #111;
}

button#delete {
  background-color: #ff3b30;
}

button:hover {
  opacity: 0.9;
}
</style>
<body>

<%
	String username = (String) session.getAttribute("username");
%>

  <header>
    <div class="container nav-container">
      <div class="logo-container">
        <a href="view/Tenant/home.jsp" class="logo">
          <span class="logo-icon">
            <i class="fa-solid fa-home"></i>
          </span>
          Property<span class="logo-highlight">Pro</span>
        </a>
      </div>
      
      <div class="nav-links">
        <a href="#" class="nav-link">To Rent</a>
        <a href="#" class="nav-link">Property</a>
        <a href="#" class="nav-link">Pricing</a>
      </div>
      
      <div class="auth-buttons user-bar">
      <span class="btn btn-signup">Hello, <%=username%></span>
        <a href="view/property/logout.jsp" class="btn btn-login">Log Out</a>
      </div>
    </div>
  </header>

  <main>
    <div class="content-container">
      <h1>Payment Details</h1>

      <input type="text" id="SearchInput" placeholder="Search...">

      <table>
        <tr>
          <th>ID</th>
          <th>Payment Option</th>
          <th>Name of Card</th>
          <th>Amount</th>
          <th>Expiration Month</th>
          <th>Expiration Year</th>
          <th>CVV</th>
          <th>Action</th>
        </tr>
        <c:forEach var="pay" items="${allpay}">
          <tr>
            <td>${pay.id}</td>
            <td>${pay.paymentoption}</td>
            <td>${pay.nameofCard}</td>
            <td>${pay.amount}</td>
            <td>${pay.expMonth}</td>
            <td>${pay.expYear}</td>
            <td>${pay.cvv}</td>
            <td>
              <a href="view/payment/UpdatePay.jsp?id=${pay.id}&paymentoption=${pay.paymentoption}&nameofCard=${pay.nameofCard}&amount=${pay.amount}&cardNumber=${pay.cardNumber}&expMonth=${pay.expMonth}&expYear=${pay.expYear}&cvv=${pay.cvv}&userId=${pay.userId}">
                <button id="update">Update</button>
              </a>
              
              <form action="DeletePayServlet" method="post" style="display: inline;">
                <input type="hidden" name="id" value="${pay.id}">
                <input type="hidden" name="userId" value="${pay.userId}">
                <button id="delete">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
  </main>
  
  <script>
    function filterTable() {
      var input, filter, table, tr, td, i, txtValue;
      input = document.getElementById("SearchInput");
      filter = input.value.toUpperCase();
      table = document.querySelector("table");
      tr = table.getElementsByTagName("tr");
      
      for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (var j = 0; j < td.length; j++) {
          if (td[j]) {
            txtValue = td[j].textContent || td[j].innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
              break;
            }
            else {
              tr[i].style.display = "none";
            }
          }
        }
      }
    }

    document.getElementById("SearchInput").addEventListener("input", filterTable);
  </script>
</body>
</html>