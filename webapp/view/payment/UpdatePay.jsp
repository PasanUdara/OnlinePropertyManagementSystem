<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    
</head>

<style>
	@charset "ISO-8859-1";

@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');


body{
    margin:0;
    padding:4px;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color:#f5f5f5;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    font-family: "Montserrat", sans-serif;
    /*background-image: url(Image/Backgg.jpg);*/
    
}

img{
    margin-right:40px;
}
.details h1{
    font-size: 30px;
    color: black;
    text-align: center;
}
.details h4{
    color:black;
}

.payment{
    justify-content: space-around;
    max-width: 1200px;
    width: 40% 60%;
    margin-bottom: 40px;;
}

.details{
    background-color: #fff;
    border: none;
    border-radius: 2px;
    height: 90%;
    width:40%;
    text-align:center;
    position:absolute;
    top:50%;
    left:50%;
    transform: translate(-50%,-50%);
}

.details button{
    background-color: rgb(244, 203, 37);
    color: rgb(0, 0, 0);
    border: none;
    border-radius:10px;
    margin-bottom: 20px;
    margin-left:auto;
    padding:10px;
    cursor:pointer;
    align-content: center;
}

.details h3,h4{
    color:rgb(244, 203, 37);
    text-align: center;
}


	
</style>




<body>
	<%
		
	String id = request.getParameter("id");
	String paymentoption = request.getParameter("paymentoption");  // Match form field name exactly
    String NameofCard = request.getParameter("nameofCard");
    String Amount = request.getParameter("amount");
    String CardNumber = request.getParameter("cardNumber");
    String ExpMonth = request.getParameter("expMonth");
    String ExpYear = request.getParameter("expYear");
    String cvv = request.getParameter("cvv");
    String userId = request.getParameter("userId");
	%>

<form method="POST" action="../../UpdatePayServlet">
        <div class="details">
        
        	<p>Id: <input type="text" name="id" value="<%=id%>" readonly></p>
            <h1>PAYMENT OPTION</h1>
            
            <h3>Please choose your payment option here.</h3>
            
            
            
            <p>
                <input type="radio" name="paymentoption" value="<%=paymentoption%>" required>Credit Cards 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/cards_img.jpg" width="30%" alt="image"><br>

                <input type="radio" name="paymentoption" value="<%=paymentoption%>">PayPal 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/PayPal-Logo.png" width="30%"><br>

                <input type="radio" name="paymentoption" value="<%=paymentoption%>">Bank Deposit/Bank Transfer 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/images_bank.jpg" width="30%">
            </p>

            <h3>Please enter your credit card details below.</h3>
            <p>Name of Card Holder: <input type="text" name="NameofCard" value="<%=NameofCard%>" placeholder="Mr.John Doe" required></p>
            <p>Amount: <input type="number" name="Amount" value="<%=Amount%>" placeholder="Rs." required></p>

            <p>Card Number: <input type="text" name="CardNumber" value="<%=CardNumber%>" placeholder="1111-2222-3333-4444" maxlength="19" required></p>
            
            <p>
                ExpMonth:
                <select name="ExpMonth"  value="<%=ExpMonth%>" required>
                    <option value="">Select Month</option>
                    <option value="January"<%="January".equals(ExpMonth) ? "selected" : "" %>> January</option>
                    <option value="February"<%="February".equals(ExpMonth) ? "selected" : "" %>>February</option>
                    <option value="March"<%="March".equals(ExpMonth) ? "selected" : "" %>>March</option>
                    <option value="April"<%="April".equals(ExpMonth) ? "selected" : "" %>>April</option>
                    <option value="May"<%="May".equals(ExpMonth) ? "selected" : "" %>>May</option>
                    <option value="June"<%="June".equals(ExpMonth) ? "selected" : "" %>>June</option>
                    <option value="July" <%="July".equals(ExpMonth) ? "selected" : "" %>>July</option>
                    <option value="August" <%="August".equals(ExpMonth) ? "selected" : "" %>>August</option>
                    <option value="September"<%="September".equals(ExpMonth) ? "selected" : "" %>>September</option>
                    <option value="October"<%="October".equals(ExpMonth) ? "selected" : "" %>>October</option>
                    <option value="November"<%="November".equals(ExpMonth) ? "selected" : "" %>>November</option>
                    <option value="December"<%="December".equals(ExpMonth) ? "selected" : "" %>>December</option>
                </select>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ExpYear:
                <select name="ExpYear"  value="<%=ExpYear%>" required>
                    <option value="">Select Year</option>
                    <option value="2023" <%="2023".equals(ExpYear) ? "selected" : "" %>>2023</option>
                    <option value="2024" <%="2024".equals(ExpYear) ? "selected" : "" %>>2024</option>
                    <option value="2025" <%="2025".equals(ExpYear) ? "selected" : "" %>>2025</option>
                  
                </select>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br><br>CVV:
                <input type="text" name="cvv" value="<%=cvv%>" placeholder="123" maxlength="3" required>
                
                
                <input type="text" name="userId" value="<%=userId%>"  required>
            </p>
            
            <button type="submit">Confirm</button>
        </div>
    </form>

</body>
</html>`,