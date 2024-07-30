<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Message</title>
<link rel="stylesheet" href="../CSS/message.css">
</head>
<style>
	@charset "ISO-8859-1";

*{
    margin:0;
    padding: 0;
    box-sizing: border-box;
    font-family:'Times New Roman', Times, serif;
}

.size {
	font-size: 20px;
	margin: 20px;
}    

button {
	height: 50px;
	width: 230px;
	margin-left: 20px;
	margin-bottom: 20px;
	font-size: 20px;
	background-color: red;
	border-radius: 15px;
	border: none;
	color: white;
	cursor: pointer;
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
}
#navbar li a:active{
    opacity: 0.5;
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
#navbar li a:hover{
    text-decoration: underline;
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
	
</style>
<body>
	<section id="header">
        <a href="home.html"><img src="../images/logo.png"class="logo"alt="logo"></a>
        <div>
            <form action="">
                <input type="text" name="search" class="searchbar" placeholder="Search...">
            </form>
        </div>
        <div>
            <ul id="navbar">
                <li><button>HOME</button></li>
            	<li><button>PRODUCTS</button></li>
            	<li><button>ABOUT US</button></li>
            	<li><button><i class="fa fa-user" style="font-size:30px;color: #f5f5f5;"></i></button></li>
                <li><button><i class="fa-solid fa-cart-shopping" style="font-size: 30px;color: white;"></i></button></li>
            </ul>
        </div>
    </section>
    
	<strong class="size"> ERROR MESSAGE !!!!</strong>
	<p class="size"> The provided credentials for the product does not exists.</p>
	<button> Return to the Update Page</button>
</body>
</html>