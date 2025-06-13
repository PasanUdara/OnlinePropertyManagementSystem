<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Form</title>
  
    
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

.error-message {
    color: red;
    font-size: 12px;
    margin-top: 5px;
}

.input-error {
    border: 2px solid red !important;
}

	
</style>
<body>

	<%
    
    String userId = request.getParameter("userId");
    
    %>
  <form method="POST" action="../../InserServlet" onsubmit="return validateForm()">
        <div class="details">
            <h1>PAYMENT OPTION</h1>
            <h3>Please choose your payment option here.</h3>
            <p>
                <input type="radio" name="paymentoption" value="CreditCards" required>Credit Cards 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/cards_img.jpg" width="30%" alt="image"><br>

                <input type="radio" name="paymentoption" value="PayPal">PayPal 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/PayPal-Logo.png" width="30%"><br>

                <input type="radio" name="paymentoption" value="BankDeposit">Bank Deposit/Bank Transfer 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/images_bank.jpg" width="30%">
            </p>
            <div id="paymentError" class="error-message"></div>

            <h3>Please enter your credit card details below.</h3>
            <p>Name of Card Holder: <input type="text" name="NameofCard" id="NameofCard" placeholder="Mr. John Doe" required></p>
            <div id="nameError" class="error-message"></div>
            
            <p>Amount: <input type="number" name="Amount" id="Amount" placeholder="Rs." required></p>
            <div id="amountError" class="error-message"></div>

            <p>Card Number: <input type="text" name="CardNumber" id="CardNumber" placeholder="1111-2222-3333-4444" maxlength="19" required></p>
            <div id="cardError" class="error-message"></div>
            
            <p>
                ExpMonth:
                <select name="ExpMonth" id="ExpMonth" required>
                    <option value="">Select Month</option>
                    <option value="January">January</option>
                    <option value="February">February</option>
                    <option value="March">March</option>
                    <option value="April">April</option>
                    <option value="May">May</option>
                    <option value="June">June</option>
                    <option value="July">July</option>
                    <option value="August">August</option>
                    <option value="September">September</option>
                    <option value="October">October</option>
                    <option value="November">November</option>
                    <option value="December">December</option>
                </select>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ExpYear:
                <select name="ExpYear" id="ExpYear" required>
                    <option value="">Select Year</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                </select>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br><br>CVV:
                <input type="text" name="cvv" id="cvv" placeholder="123" maxlength="3" required>
                
               
                <input type="hidden" name="userId" value="<%=userId%>"  required>
            </p>
            <div id="expiryError" class="error-message"></div>
            <div id="cvvError" class="error-message"></div>
            
            <button type="submit">Confirm</button>
        </div>
    </form> 

<script>
function validateForm() {
    let isValid = true;
    
    // Clear previous error messages and styles
    clearErrors();
    
    // Validate payment option
    const paymentOptions = document.getElementsByName('paymentoption');
    let paymentSelected = false;
    for (let i = 0; i < paymentOptions.length; i++) {
        if (paymentOptions[i].checked) {
            paymentSelected = true;
            break;
        }
    }
    if (!paymentSelected) {
        showError('paymentError', 'Please select a payment option');
        isValid = false;
    }
    
    // Validate name
    const name = document.getElementById('NameofCard').value.trim();
    if (name === '') {
        showError('nameError', 'Name is required');
        addErrorStyle('NameofCard');
        isValid = false;
    } else if (name.length < 2) {
        showError('nameError', 'Name must be at least 2 characters');
        addErrorStyle('NameofCard');
        isValid = false;
    } else if (!/^[a-zA-Z\s.]+$/.test(name)) {
        showError('nameError', 'Name should contain only letters, spaces, and dots');
        addErrorStyle('NameofCard');
        isValid = false;
    }
    
    // Validate amount
    const amount = document.getElementById('Amount').value;
    if (amount === '') {
        showError('amountError', 'Amount is required');
        addErrorStyle('Amount');
        isValid = false;
    } else if (parseFloat(amount) <= 0) {
        showError('amountError', 'Amount must be greater than 0');
        addErrorStyle('Amount');
        isValid = false;
    } else if (parseFloat(amount) > 100000) {
        showError('amountError', 'Amount cannot exceed Rs. 100,000');
        addErrorStyle('Amount');
        isValid = false;
    }
    
    // Validate card number
    const cardNumber = document.getElementById('CardNumber').value.replace(/\s|-/g, '');
    if (cardNumber === '') {
        showError('cardError', 'Card number is required');
        addErrorStyle('CardNumber');
        isValid = false;
    } else if (!/^\d{13,19}$/.test(cardNumber)) {
        showError('cardError', 'Card number must be 13-19 digits');
        addErrorStyle('CardNumber');
        isValid = false;
    } else if (!isValidCardNumber(cardNumber)) {
        showError('cardError', 'Please enter a valid card number');
        addErrorStyle('CardNumber');
        isValid = false;
    }
    
    // Validate expiry month and year
    const expMonth = document.getElementById('ExpMonth').value;
    const expYear = document.getElementById('ExpYear').value;
    
    if (expMonth === '' || expYear === '') {
        showError('expiryError', 'Please select expiry month and year');
        if (expMonth === '') addErrorStyle('ExpMonth');
        if (expYear === '') addErrorStyle('ExpYear');
        isValid = false;
    } else {
        // Check if card is not expired
        const currentDate = new Date();
        const currentYear = currentDate.getFullYear();
        const currentMonth = currentDate.getMonth() + 1;
        
        const monthNames = ['', 'January', 'February', 'March', 'April', 'May', 'June',
                          'July', 'August', 'September', 'October', 'November', 'December'];
        const selectedMonth = monthNames.indexOf(expMonth);
        const selectedYear = parseInt(expYear);
        
        if (selectedYear < currentYear || (selectedYear === currentYear && selectedMonth < currentMonth)) {
            showError('expiryError', 'Card has expired');
            addErrorStyle('ExpMonth');
            addErrorStyle('ExpYear');
            isValid = false;
        }
    }
    
    // Validate CVV
    const cvv = document.getElementById('cvv').value;
    if (cvv === '') {
        showError('cvvError', 'CVV is required');
        addErrorStyle('cvv');
        isValid = false;
    } else if (!/^\d{3,4}$/.test(cvv)) {
        showError('cvvError', 'CVV must be 3 or 4 digits');
        addErrorStyle('cvv');
        isValid = false;
    }
    
    return isValid;
}

function isValidCardNumber(cardNumber) {
    // Luhn algorithm for card validation
    let sum = 0;
    let isEven = false;
    
    for (let i = cardNumber.length - 1; i >= 0; i--) {
        let digit = parseInt(cardNumber.charAt(i));
        
        if (isEven) {
            digit *= 2;
            if (digit > 9) {
                digit -= 9;
            }
        }
        
        sum += digit;
        isEven = !isEven;
    }
    
    return sum % 10 === 0;
}

function showError(elementId, message) {
    document.getElementById(elementId).textContent = message;
}

function addErrorStyle(elementId) {
    document.getElementById(elementId).classList.add('input-error');
}

function clearErrors() {
    const errorElements = document.getElementsByClassName('error-message');
    for (let i = 0; i < errorElements.length; i++) {
        errorElements[i].textContent = '';
    }
    
    const inputElements = document.querySelectorAll('input, select');
    inputElements.forEach(element => {
        element.classList.remove('input-error');
    });
}

// Format card number as user types
document.getElementById('CardNumber').addEventListener('input', function(e) {
    let value = e.target.value.replace(/\s/g, '').replace(/[^0-9]/gi, '');
    let formattedValue = value.match(/.{1,4}/g)?.join('-') || value;
    if (formattedValue !== e.target.value) {
        e.target.value = formattedValue;
    }
});

// Only allow numbers in CVV
document.getElementById('cvv').addEventListener('input', function(e) {
    e.target.value = e.target.value.replace(/[^0-9]/g, '');
});

// Only allow positive numbers in amount
document.getElementById('Amount').addEventListener('input', function(e) {
    if (e.target.value < 0) {
        e.target.value = 0;
    }
});
</script>

</body>
</html>