<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Utills.StringUtills"%>
<%
    // Get the session and request objects
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute(StringUtills.USERNAME);
    String contextPath = request.getContextPath();
    String fName = (String) userSession.getAttribute("firstName");
    String lName = (String) userSession.getAttribute("lastName");
    String email = (String) userSession.getAttribute("email");
    String pnumber = (String) userSession.getAttribute("phoneNumber");
    String address = (String) userSession.getAttribute("address");
    String password = (String) userSession.getAttribute("password");
    String updateMessage = (String) request.getAttribute("updateMessage");
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="../CSS/userProfile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        @charset "ISO-8859-1";
		*{
	    margin:0;
	    padding: 0;
	    box-sizing: border-box;
	    font-family:'Times New Roman', Times, serif;
		}

        /* Header */
        #header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: black;
            padding: 20px 15px;
            box-shadow: 0 5px 15px rgba(255,255,255, 0.4);
            height: 17vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000; /* Ensures header is above other elements */
        }
        .logo {
            width: 260px;
            height: 118px;
        }
        #navbar {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #navbar li {
            list-style: none;
            padding: 0px 20px;
        }
        #navbar li a {
            text-decoration: none;
            font-size: 16px;
            font-weight: 600;
            color: #f5f5f5; 
        }
        #navbar li a:hover {
            text-decoration: underline;
            transition: 0.25s ease-out;
        }
        #navbar li a:active {
            opacity: 0.7;
        }
        .searchbar {
            width: 380px;
            height: 42px;
            border-radius: 10px;
            border-color: #f5f5f5;
            background-color: black;
            color: #f5f5f5;
            font-size: 18px;
            padding: 0 12px;
        }
        ::placeholder {
            font-size: 18px;
            font-weight: 100;
            color: #f5f5f5;
        }
        	form {
    		display: flex;
    		flex-direction: column;
    		gap: 15px;
  			  
			}

			form label {
			    font-size: 16px;
			    font-weight: bold;
			    color: #333;
			}
			
			form input[type="text"],
			form input[type="email"],
			form input[type="password"] {
			    width: 100%;
			    padding: 10px;
			    border: 1px solid #ddd;
			    border-radius: 5px;
			    font-size: 16px;
			    box-sizing: border-box; /* Ensure padding is included in width */
			}
			
			form input[type="submit"] {
			    background-color: #222;
			    color: #f5f5f5;
			    border: none;
			    padding: 10px 20px;
			    border-radius: 5px;
			    font-size: 16px;
			    cursor: pointer;
			    transition: background-color 0.3s ease;
			}
			
			form input[type="submit"]:hover {
			    background-color: #333;
			}
			
			form input[type="submit"]:active {
			    opacity: 0.7;
			}
			
			form p {
			    color: #f00;
			    font-size: 14px;
			}



        /* Main Content */
        .main-content {
            
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            /*min-height: calc(100vh - 17vh - 60px); /* Full height minus header and footer */
            margin-top: 17vh; /* Space for header */
        }

        /* Modals */
.main-content {
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    margin-top: 17vh; /* Space for header */
    position: relative; /* Allow absolute positioning of child elements */
}

/* Hide sections */
.hidden {
    display: none;
}

.section {
    margin-bottom: 100px;
    height: 50vh;
    top: 50%;
    left: 40%;
    position: relative;
    max-width: 700px;
    margin-right:100px; 
    font-family: 'Arial';
}

.profile-info {
	margin: 5px 0px 5px 0;
	font-size: 20px;
}

.profile-info p {
	margin: 15px;
}

/* Position buttons correctly */
.buttons {
    margin-top: 20px; /* Space between profile info and buttons */
}

.modal-button {
    display: inline-block;
    background-color: #222;
    color: #f5f5f5;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s ease;
    margin-right: 10px; /* Space between buttons */
    margin-top: 10px;
   
}

.modal-button:hover {
    background-color: #333;
}

        /* Footer */
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
    </style>
</head>
<body>
    <section id="header">
        <a href="<%=contextPath + StringUtills.HOMEPAGE%>"><img src="<%=contextPath + StringUtills.LOGO_PATH%>" class="logo" alt="logo"></a>
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
                <li><a href="<%=contextPath + StringUtills.USER_PROFILE_SERVLET%>">USER PROFILE</a></li>
                <li>
                    <form action="<%= currentUser != null ? contextPath + StringUtills.LOGOUT_SEVLET : contextPath + StringUtills.LOGINPAGE %>" method="post">
                        <input type="submit" value="<%= currentUser != null ? "Logout" : "Login" %>" class="nav-button">
                    </form>
                </li>
            </ul>
        </div>
    </section>

    
   <main class="main-content">
    <!-- Profile Information -->
    <div id="profile" class="section">
        <h2>Profile Information</h2>
        <div class="profile-info">
            <p><strong>First Name:</strong> <%= fName %></p>
            <p><strong>Last Name:</strong> <%= lName %></p>
            <p><strong>Username:</strong> <%= currentUser %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Phone Number:</strong> <%= pnumber %></p>
            <p><strong>Address:</strong> <%= address %></p>
            
        </div>
        <div class="buttons">
            <a href="#" class="modal-button" onclick="showSection('update')">Edit Profile</a>
            <a href="#" class="modal-button" onclick="showSection('changePassword')">Change Password</a>
        </div>
    </div>

    <!-- Update Details Form -->
    <div id="update" class="section hidden">
        <h2>Update Details</h2>
        <form action="UpdateUserDetail" method="post">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName"required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName"  required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email"  required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber"  required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address"  required>
            </div>
            <input type="submit" value="Update Profile">
        </form>
       <c:if test="${not empty sessionScope.updateMessage}">
    <p style="color: red;">${sessionScope.updateMessage}</p>
    <% session.removeAttribute("updateMessage"); %>
</c:if>
       
        <button onclick="showSection('profile')" class="modal-button">Return to Profile</button>
    </div>

    <!-- Change Password Form -->
    <div id="changePassword" class="section hidden">
        <h2>Change Password</h2>
        <form action="ChangePassword" method="post">
            <div class="form-group">
                <label for="currentPassword">Current Password:</label>
                <input type="password" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm New Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <input type="submit" value="Change Password">
        </form>
        <c:if test="${not empty sessionScope.updateMessage}">
    		<p style="color: red;">${sessionScope.updateMessage}</p>
    		<% session.removeAttribute("updateMessage"); %>
		</c:if>
        
        <button onclick="showSection('profile')" class="modal-button">Return to Profile</button>
    </div>
</main>	
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

    <script>
        function showSection(sectionId) {
            document.querySelectorAll('.section').forEach(section => {
                section.classList.add('hidden');
            });
            document.getElementById(sectionId).classList.remove('hidden');
        }

        // By default, show the profile section
        showSection('profile');
    </script>
</body>
</html>
