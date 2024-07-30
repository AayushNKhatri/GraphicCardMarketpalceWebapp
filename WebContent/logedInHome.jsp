<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="Utills.StringUtills"%>
<%
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
    background-image: url(background-images.jpg);
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


</style>
<body>
<section id="header">
        <a href="home.jsp"><img src="logo.png"class="logo"alt="logo"></a>
        <div>
            <form action="">
                <input type="text" name="search" class="searchbar" placeholder="Search...">
                <i class="a-thin fa-magnifying-glass" style="font-size:30px;color: #f5f5f5;"></i>
            </form>
        </div>
    <div>
        <ul id="navbar">
            
            <li><a href="home.jsp">HOME</a></li>
            <li><a href="product.jsp">PRODUCTS</a></li>
            <li><a href="aboutUs.jsp">ABOUT US</a></li>
            <div class="dropdown">
                    <li><button><i class="fa fa-user" style="font-size:30px;color: #f5f5f5;"></i></button></li>
                    <div class="dropdown-content">
                        <a href="JSP/Login.jsp">Profile</a>
                        <a href="JSP/Register.jsp">Logout</a>
                    </div>
            </div>
        </ul>
    </div>
</section>
<section id="hero">
    <h4>Gear Up for Glory</h4>
    <h2>Shop the Latest Graphics Cards</h2>
    <h1>Unlock Stunning Visuals</h1>
    <p>Find the perfect card for your budget and gaming needs.</p>
    <button>SHOP NOW</button>
</section>
<section id="product1" class="section-p1">
    <h2>Unleash the Power: Featured Graphics Cards</h2>
    <p>Dive in to find your perfect match!</p>
    <div class="pro-container">
        <div class="pro">
            <img src="RTX-4070-SUPER-Back.png" alt="pro1">
            <div class="desc">
                <span>NVIDIA GeForce RTX 4070 SUPER</span>
                <h5>Boost Clock Speed: 2.48 GHz</h5>
                <h5>GPU Memory Size: 12 GB</h5>
                <h4>$599</h4>
            </div>
            <button>Buy Now</button>
        </div>
        <div class="pro">
            <img src="intel-arc-a40-pro-002.png" alt="pro1">
            <div class="desc">
                <span>Intel Arc Pro A40 Graphics</span>
                <h5>4x mini-DP 2.0 Ready with Audio & Dolby Vision Support</h5>
                <h5>GPU Memory Type: 6GB GDDR6</h5>
                <h4>$395</h4>
            </div>
            <button>Buy Now</button>
        </div>
        <div class="pro">
            <img src="AMD Radeon RX 6800 XT.png" alt="pro1">
            <div class="desc">
                <span>Radeon RX 6800 XT Graphics</span>
                <h5>GPU Memory Size: 16 GB</h5>
                <h5>GPU Memory Type: GDDR6</h5>
                <h4>$834</h4>
            </div>
            <button>Buy Now</button>
        </div>
    </div>
</section>
<footer class="section-p1">
    <div class="col">
       <a href="home.jsp"><img src="logo.png"alt="logo"></a>
    </div>
    <div class="col">
        <h4>Contact</h4>
        <p><strong>Address:</strong> Anamnagar;Kathmandu</p>
        <p><strong>Phone:</strong> 0142368980/ 0198562432</p> 
        <p><strong>Email:</strong> Graphicswala82@gmail.com</p> 
        <P><strong>Hours:</strong>10.00AM-20.00PM Sun-Fri</P>
    </div>
    <div class="col">
        <h4>About</h4>
        <a href="JSP/aboutUs.jsp">About us</a>
    </div>
    <div class="col">
        <h4>My Account</h4>
        <a href="Register.jsp">Sign In</a>
        <a href="addToCart.jsp">View Cart</a>
        <a href="userProfile.jsp">Profile</a>
        
    </div>
    <div class="copyright">
        <p>&#169 2024 Graphics Wala. All rights reserved. Text, graphics, and other content on this website are protected by copyright.</p>
    </div>
</footer>
</body>
</html>