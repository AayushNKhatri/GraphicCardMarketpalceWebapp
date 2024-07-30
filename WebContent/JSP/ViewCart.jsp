<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="Utills.StringUtills"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%
    // Get the session and request objects
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute(StringUtills.USERNAME);
    String contextPath = request.getContextPath();
    Integer customerID = (Integer) userSession.getAttribute("customerID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/addToCart.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>
<style>
	@charset "ISO-8859-1";

/* CSS styles for the description page */

	/* General CSS reset */
	    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Main content area */
    main {
        padding: 20px;
    }

    /* Shopping cart heading */
    h1 {
        font-size: 2em;
        margin-bottom: 20px;
        text-align: center;
        color: #333;
    }

    /* Shopping cart table styles */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }

    th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    /* Button styles */
    button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background-color: #0056b3;
    }

    /* Input styles */
    input[type="number"] {
        width: 60px;
        padding: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
        text-align: center;
    }

    /* Empty cart message */
    p {
        text-align: center;
        font-size: 1.2em;
        color: #666;
    }
	#header{
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: black;
    padding: 20px 15px;
    box-shadow: 0 5px 15px rgba(255,255,255, 0.4);
    height: 17vh;
    position: sticky;
    top: 0;
    left: 0;
}
.logo{
    width: 260px;
    height: 118px;
    
}
#navbar{
    display: flex;
    align-items: center;
    justify-content: center;
}
#navbar li{
    list-style: none;
    padding: 0px 20px;

}
#navbar li a{
    text-decoration: none;
    font-size: 16px;
    font-weight: 600px;
    color: #f5f5f5; 
}
#navbar li a:hover{
    text-decoration: underline;
    transition: 0.25s ease-out;
}

#navbar li a:active{
    opacity: 0.7;
}
.searchbar{
    width: 380px;
    height: 42px;
    border-radius: 10px;
    border-color: #f5f5f5;
    background-color: black;
    color: #f5f5f5;
    font-size: 18px;
    padding: 0 12px;
}
::placeholder{
    font-size: 18px;
    font-weight: 100px;
    color: #f5f5f5;
    padding-left: 1px;
}
	
	*{
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	
	/* Left section */
	.left-section {
	    display: flex;
	    align-items: center;
	    cursor: pointer;
	}

	/* Middle section */
	.middle-section {
	    display: flex;
	    margin-left: 70px;
	    align-items: center;
	}

	.middle-section img {
	    width: 650px;
	    height: 450px;
	}

	/* Right section */
	.right-section {
	    min-width: 700px;
	    margin-right: 10px;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    flex-shrink: 0;
	    padding-top: 15px;
	}

	/* Header styles */
	.headers {
	    height: 100%;
	    display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	    top: 0;
	    left: 0;
	    right: 0;
	    background-color: white; /* Keeping background color white for header */
	    border-bottom: 1px solid rgb(228,228,228); /* Adding bottom border */
	}

	/* Description border */
	.description-border {
	    border-radius: 15px;
	    width: 500px;
	    height: 500px;
	    margin-bottom: 100px;
	    margin-right: 100px;
	    
	}

	/* Quantity buttons */
	.decrease-button, .increase-button {
	    width: 35px;
	    height: 35px;
	    border-radius: 15px;
	    font-weight: bold;
	    font-size: 20px;
	    margin: 0 5px 0 5px;
	    border: none;
	}

	/* Additional styles */
	.right-section span {
	    font-size: 20px;
	}

	.addToCart {
	    width: 260px;
	    height: 50px;
	    border: none;
	    border-radius: 15px;
	    font-weight: bold;
	    margin-bottom: 15px;
	}

	.description-border button {
	    cursor: pointer;
	}

	.description-border strong {
	    font-size: 25px;
	}

	.in_stock {
	    font-size: 15px;
	    color: green;
	}

	p {
	    margin-top: 20px;
	}

	/* Footer styles */
	footer{
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	    background-color: black;
	    margin-top: 0.5px;
	}

	footer .col{
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	    margin-bottom: 20px;   
	}

	footer .col a{
	    color: #f5f5f5;
	    font-size: 13px;
	    text-decoration: none;
	    margin-bottom: 10px;
	}

	footer .col h4{
	    color: #f5f5f5;
	    font-size: 14px;
	    padding-bottom: 20px;
	}

	footer .col p{
	    color: #f5f5f5;
	    font-size: 13px;
	    margin: 0 0 8px 0;
	}

	footer .copyright {
	    width: 100%;
	    text-align:center;
	}

	footer .copyright p{
	  color: #f5f5f5;
	}

	footer .col img{
	    width: 260px;
	    height: 120px;
	    margin-bottom: 30px;
	}

	/* Additional CSS for the section-p1 class */
	.section-p1{
	    padding: 40px 80px;
	} 
</style>
<body>
<section id="header">
    <a href="<%=contextPath + StringUtills.HOMEPAGE%>"><img src="<%=contextPath + StringUtills.LOGO_PATH%>"class="logo"alt="logo"></a>
    <div>
        <form action="">
            <input type="text" name="search" class="searchbar" placeholder="Search...">
        </form>
    </div>
    <div>
        <ul id="navbar">
            <li><a href="<%=contextPath + StringUtills.HOMEPAGE%>">HOME</a></li>
            <li><a href="<%=contextPath + StringUtills.DISPALY_PRODUCT%>">PRODUCTS</a></li>
            <li><a href="<%=contextPath + StringUtills.ABOUTUS_PAGE%>">ABOUT US</a></li>
            <li>
				 <form action="<%
                    // Conditionally set the action URL for user profile
                    if (currentUser != null) {
                        out.print(contextPath + StringUtills.USERPROFILE);
                    } else {
                        out.print(contextPath + StringUtills.LOGINPAGE);
                    }
                %>" method="post">
                    <input type="submit" value="<%
                        // Conditionally set the button label for user profile
                        if (currentUser != null) {
                            out.print("USER PROFILE");
                        } else {
                            out.print("LOGIN TO VIEW PROFILE");
                        }
                    %>"/>
                </form>
			</li>
            <li>
            <form action="<%
                    // Conditionally set the action URL based on user session
                    if (currentUser != null) {
                        out.print(contextPath + StringUtills.LOGOUT_SEVLET);
                    } else {
                        out.print(contextPath + StringUtills.LOGINPAGE);
                    }
                %>" method="post">
                    <input type="submit" value="<%
                        // Conditionally set the button label based on user session
                        if (currentUser != null) {
                            out.print(StringUtills.LOGOUT);
                        } else {
                            out.print(StringUtills.LOGIN);
                        }
                    %>"/>
                </form>
                </li>
        </ul>
    </div>
</section>

    <h1>Shopping Cart</h1>

    <c:if test="${not empty cartItems}">
        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Amount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cartItem" items="${cartItems}">
                    <tr>
                        <td>
                            <c:forEach var="product" items="${productList}">
                                <c:if test="${cartItem.productId == product.productID}">
                                    ${product.productName}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="product" items="${productList}">
                                <c:if test="${cartItem.productId == product.productID}">
                                    <fmt:formatNumber value="${product.price}" type="currency"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <form action="UpdateCart" method="post">
                                <input type="hidden" name="cartID" value="${cartItem.cartId}">
                                <input type="number" name="quantity" value="${cartItem.cartQuantity}" min="1">
                                <button type="submit">Update</button>
                            </form>
                        </td>
                        <td>
                            <c:forEach var="product" items="${productList}">
                                <c:if test="${cartItem.productId == product.productID}">
                                    <fmt:formatNumber value="${product.price * cartItem.cartQuantity}" type="currency"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <form action="RemoveCart" method="post">
                                <input type="hidden" name="cartID" value="${cartItem.cartId}">
                                <button type="submit">Remove</button>
                            </form>
                        </td>
                        <td>
                            <form action="Order" method="post" onsubmit="return confirmOrder()">
                                <input type="hidden" name="cartID" value="${cartItem.cartId}">
                                <button type="submit">Order</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty cartItems}">
        <p>Your cart is empty.</p>
    </c:if>
<footer class="section-p1">
    <div class="col">
        <img src="<%=contextPath + StringUtills.LOGO_PATH%>"alt="logo">
    </div>
    <div class="col">
        <h4>Contact</h4>
        <p><strong>Address:</strong> Anamnagar,Kathmandu</p>
        <p><strong>Phone:</strong> 0142368980/ 0198562432</p> 
        <P><strong>Hours:</strong>10.00AM-20.00PM Sun-Fri</P>
    </div>
    <div class="col">
        <h4>About</h4>
        <a href="<%=contextPath + StringUtills.ABOUTUS_PAGE%>">About us</a>

    </div>
    <div class="col">
        <h4>My Account</h4>
        <a href="<%=contextPath + StringUtills.LOGINPAGE%>">Sign In</a>
        <a href="<%=contextPath + StringUtills.CART %>">View Cart</a>
        
    </div>
    <div class="copyright">
        <p>&#169 2024 Graphics Wala. All rights reserved. Text, graphics, and other content on this website are protected by copyright.</p>
    </div>
</footer>
    
</body>
<script>
function confirmOrder() {
    return confirm("Are you sure you want to place this order?");
}
</script>
</html>