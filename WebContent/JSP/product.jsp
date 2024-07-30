<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ page import="Utills.StringUtills"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
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
<meta charset="UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Graphics Wala</title>
<link rel="stylesheet" href="../CSS/product.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
@charset "ISO-8859-1";

*{
    margin:0;
    padding: 0;
    box-sizing: border-box;
    font-family:'Times New Roman', Times, serif;
    
}
   
.product {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}


.product img {
    width: 200px; /* Set the desired width */
    height: 150px; /* Set the desired height */
    object-fit: cover; /* Ensures the image covers the container without distortion */
    margin-right: 20px;
}

.product .text {
    display: flex;
    flex-direction: column;
}

.product button {
    background-color: #222;
    border-radius: 20px;
    border-color: #f5f5f5;
    font-weight: bolder;
    font-size: 14px;
    text-decoration: none;
    color: #f5f5f5;
    cursor: pointer;
    margin-top: 10px;
}

.product button:hover {
    background-color: #f5f5f5;
    color: #000;
    transition: 0.25s ease-out;
    opacity: 0.7;
    border-radius: 20px;
}

.product button:hover:active {
    opacity: 1;
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
/*footer start*/
footer{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    background-color: black;
    margin-top: 0.5px;
    margin-top: 1px;
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
.section-p1{
    padding: 40px 80px;
} 

.Product {
	margin-top: 24px;
	margin-bottom: 24px;
	display: grid;
}

.Product button {
	border: none;
	border-radius: 5px;
	background-color: black;
	color: white;
	width: 100px;
	height: 30px;
	margin-left: 15px;
	margin-top: 15px;
}

.Product span{
	margin-left: 15px;
	height: 10px;
	margin-top: 10px;
}



.card {
	width: 100%;
	
	justify-content: space-around;
}


</style>
<body>
<section id="header">
    <a href="<%=contextPath + StringUtills.HOMEPAGE%>"><img src="<%=contextPath + StringUtills.LOGO_PATH%>"class="logo"alt="logo"></a>
    <div>
        <form action="<%=contextPath + StringUtills.DISPALY_PRODUCT%>">
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
<c:if test="${not empty errorMessage}">
    <div class="error-message" style="color: red; text-align: center; margin-top: 10px;">
        ${errorMessage}
    </div>
</c:if>
<section id="product" class="Product">
<c:choose>
   <c:when test="${not empty productList}">
	<div class="card">
		<c:forEach var="product" items="${productList}">
		<div class = "product">
		<img src="${pageContext.request.contextPath}/images/${product.imageUrlFromPart}"class="img" alt="...">
		<div class = "text">
		 <span>Product Name: ${product.productName}</span>
         <span>Price: <fmt:formatNumber value="${product.price}" ></fmt:formatNumber></span>
			 <form action="addToCart" method="post">
                <input type="hidden" name="cartProduct" value="${product.productID}">
                <input type="hidden" name="cartAmount" value="${product.price}">
                <input type="hidden" name="cartQuantity" value="1">
                <button type="submit">Buy Now</button>
            </form>
			</div>
	
		
      </div>
	</c:forEach>
		
	</div>
	</c:when>
            <c:otherwise>
                <p>No products found for the search term. Please try another search.</p>
            </c:otherwise>
        </c:choose>
	
</section>
<footer class="section-p1" id="footer">
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