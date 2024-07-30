	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Utills.StringUtills"%>
<%
    // Get the session and request objects
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute(StringUtills.USERNAME);
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ABOUT US</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
	@charset "ISO-8859-1";
/* CSS styles for the description page */

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body{
    background: white;
    font-family: "Josefin Sans", sans-serif;
    color: black;
}

#header{
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: black;
    padding: 20px 15px;
    box-shadow: 0 5px 15px rgba(255,255,255, 0.25);/*reduce box shadow */
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

/*.wrapper h1{
    font-family: "Allura", cursive;
    font-size: 52px;
    margin-bottom: 60px;
    text-align: center;
    color: black;
}

.team{
    display: flex;
    text-align: center;
    width: auto;
    justify-content: center;
    flex-wrap: wrap;
    
}

.team .team_member{
    background: white;
    margin: 5px;
    margin-bottom: 50px;
    width: 300px;
    padding: 20px;
    line-height: 20px;
    color: black;
    position: relative;
}
.team .team_member h3{
    color: black;
    font-size: 26px;
    margin-top: 190px;
    margin-bottom: 0;
}

.team .team_member p.role{
    color: black;
    font-size: 12px;
    text-transform: uppercase;
    margin: 12px 0;
}

.team .team_member .team_img{
    width: 100px;
    height: 100px;
    border-radius: 50%;
    position: absolute;
    top: -50px;
    left: 50%;
    transform: translateX(-50%);  
}

.team .team_member .team_img img{
    width: 300px;
    height: 250px;
    padding: 10px;
}*/

#main {
    padding: 2rem 0rem;
    /* border: 1px solid black; */
    width: 100%;
}

.head {
    display: flex;
    justify-content: center;
}

.head p {
    font-size: 40px;
    font-weight:bolder;
    letter-spacing: 0.2rem;
    word-spacing: 0.3rem;
}

.member{
    height: 14rem;
    width: 13rem;
    border-radius: 1rem;
}

.image-division{
    margin-top: 3rem;
    display: flex;
    gap: 4rem;
    justify-content: center;
    flex-wrap: wrap;
    
}

.section{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap:1.3rem;
    font-size: 1.3rem;
    padding:1rem;
    max-width: 15rem;
    letter-spacing: 0.1rem;
}

.section p{
    font-size: 1.1rem;
    display: inline-block;
    text-align: center;
}
 

/*Footer Below*/
footer{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    background-color: black;
    margin-top: 0.5px;
    margin-top: 109px;
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
    <a href="<%=contextPath + StringUtills.HOMEPAGE%>"><img src="logo.png"class="logo"alt="logo"></a>
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
    
        <section id="main">
            
                <p>About Us</p>
                <div class="middle-section section">
                    <img src="<%=contextPath + StringUtills.MY_FOTO%>" alt="aayush foto not res" class="member">
                    <h3> Contribution: </h3>
                    <p>Everything</p>
                </div>
                
        </section>
    
<footer class="section-p1">
    <div class="col">
        <img src="<%=contextPath + StringUtills.LOGO_PATH%>"alt="logo">
    </div>
    <div class="col">
        <h4>Contact</h4>
        <p><strong>Address:</strong> Anamnagar,Kathmandu</p>
        <p><strong>Phone:</strong> 9765422698/ 0198562432</p> 
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