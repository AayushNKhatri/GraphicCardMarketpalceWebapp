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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Graphics Wala</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
h1{
    font-size:50px;
    line-height: 64px;
    color: #222;
}
h2{
    font-size: 46px;
    line-height: 54px;
    color: #222;
}
h4{
    font-size: 20px;
    color: #222;
}
h6{
    font-weight: 700px;
    font-size: 12px;
}
p{
    font-size: 16px;
    color: #465b52;
    margin: 15px 0 20px 0;
}
.section-p1{
    padding: 40px 80px;
}
.section-m1{
    margin: 40px 0;
}
body{
  width: 100%;
}

/* Header Start*/
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
/*home page*/
#hero{
    background-image: url(<%=contextPath + StringUtills.BACKGROUND_IMAGE%>);
    height: 90vh;
    width: 100%;
    background-repeat: no-repeat;
    background-position: top 25% right 0; 
    background-size: cover;
    padding: 0px 70px;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
}
#hero h4{
    padding-bottom: 15px;
    color: #f5f5f5;
    font-weight: bolder;
}
#hero h1{
    color: #f5f5f5dc;
    font-weight: bolder;
}
#hero h2{
    color: #f5f5f5;
    font-weight: bolder;
}
#hero p{
    color: #f5f5f5; 
    font-weight: bolder;
}
#hero button{
    background-color: #222;
    padding: 14px 80px 14px 65px;
    border-radius: 20px;
    border-color: #f5f5f5;
    font-weight: bolder;
    font-size: 14px;
    text-decoration: none;
    color: #f5f5f5;
    cursor: pointer;
}
#hero button:hover:active{
    opacity: 0.9;
}
#product1{
    background-color: black;
    text-align: center;    
}
#product1 h2{
    color: #f5f5f5;
}
#product1 p{
    color: #f5f5f5;
}
.desc{
    color: #f5f5f5;
}
.desc h4{
    color: #f5f5f5;
}
.pro img{
    width:300px;
    height: 191px;

}
.pro-container{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 20px;
    flex-wrap: wrap;
}
.pro button{
    background-color: #222;
    padding: 14px 80px 14px 65px;
    border-radius: 20px;
    border-color: #f5f5f5;
    font-weight: bolder;
    font-size: 14px;
    text-decoration: none;
    color: #f5f5f5;
    cursor: pointer;
    margin-top:10px;
}
.pro button:hover{
    background-color: #f5f5f5;
    color: #000;
    transition: 0.25s ease-out;
    opacity: 0.7;
    border-radius: 20px;
}
.pro button:hover:active{
    opacity: 1;
}
.pro-container .pro:hover{
    box-shadow: 0px 0px 25px rgba(255,255,255, 0.4);
    transition: box-shadow .3s ease-out;
}
.pro-container .pro:active{
    box-shadow: none;
    transition: 0.25s ease-out;
}
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
.dropdown {
    position: relative;
    display: inline-block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 100px;
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    z-index: 1;
}
.dropdown:hover .dropdown-content {
    display: block;
}
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
.dropdown-content a:hover {
    background-color: #ddd;
}
.button {
    background-color: #f9f9f9;
    color: black;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
}

form {
    display: flex;
    flex-direction: column;
    gap: 15px;
  			  
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
<div class="section-p1">
    <h2>Orders</h2>
    <div class="pro-container">
        <c:forEach var="order" items="${orders}">
            <div class="pro">
                <h4>Order ID: ${order.orderID}</h4>
                <p>Product Name:                             
                <c:forEach var="product" items="${productList}">
                    <c:if test="${order.productID == product.productID}">
                                  ${product.productName}
                   </c:if>
                            </c:forEach></p>
                <p>Order Date: ${order.orderDate}</p>
                <p>Total Amount: ${order.totalAmount}</p>
                <p>Is Delivered: ${order.isDelivered == 1 ? "Yes" : "No"}</p>
                
                <form action="OrderUpdate" method="post">
                    <input type="hidden" name="orderId" value="${order.orderID}">
                    <input type="hidden" name="isDelivered" value="${order.isDelivered == 1 ? 0 : 1}">
                    <button type="submit" class="button">
                        ${order.isDelivered == 1 ? "Mark as Not Delivered" : "Mark as Delivered"}
                    </button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
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
</body>
</html>