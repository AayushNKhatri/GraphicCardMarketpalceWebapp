<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
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
    <title>Document</title>
    <style>
            @charset "ISO-8859-1";
        
    *{
    margin:0;
    padding: 0;
    box-sizing: border-box;
    font-family:'Times New Roman', Times, serif;
    background-color: black;
    color: white;
   
} 
.img{
    width: 200px; /* Set the desired width */
    height: 150px; /* Set the desired height */
    object-fit: cover; /* Ensures the image covers the container without distortion */
}   
table, th, td {
  border: 1px solid white;
  text-align: center;
  
}
table {
  width: 100%;
}

th {
  height: 70px;
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

.sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: #ecf0f1;
            padding: 20px;
        }

        .sidebar h2 {
            margin-bottom: 20px;
        }

        .sidebar nav {
            display: flex;
            flex-direction: column;
        }

        .sidebar nav .nav-button {
            color: #ecf0f1;
            text-decoration: none;
            padding: 10px;
            border: none;
            background: none;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 10px;
            transition: background-color 0.3s;
        }

        .sidebar nav .nav-button:hover {
            background-color: #34495e;
        }

        #CurdOpretion {
            margin: 30px;
            display: flex;
            
        }
        
        .AdminHead li button{
            border: none;
            font-size: 15px;
            border-radius: 15px;
            margin-top: 50px;
            margin-left: 15px;
            width: 120px;
            cursor: pointer;
        }
        
        .Analytics {
            margin: 25px;
        }
        
        .Analytics img {
            margin-left: 300px;
        }
        
        #CurdList button{
            background-color: black;
            width: 140px;
            margin-left: 15px;
            transition: transform .2s; /*Animation*/
        }
        
        #CurdList p {
            background-color: black;
            transition: transform .2s;
            font-size: 20px;
            margin-top: 5px;
        }
        
        #CurdList li :hover {
            transform: scale(1.1);
        }

        .product-box-border {
            width: 400px;
            height: 400px;
            background-color: black;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            right: 0;
            margin-left: 550px;
            padding: 20px;
        }

        .row {
            display: flex;
            margin-bottom: 25px;
        }
        
        .col {
            flex: 1;
            margin-right: 20px;
        }

        .product-box-border button{
            margin-top: 15px;
            height: 30px;
            width: 60px;
            background-color: green;
        }

        .view-product-main {
            display: flex;
            width: 150vh;
            justify-content: space-between;
            padding-right: 15px;
        }

        .heading{
            display: flex;
            font-size: 25px;
            align-items: center;
            margin: 50px auto;
        }
        .profile-info {
	margin: 5px 0px 5px 0;
	font-size: 20px;
}

.profile-info p {
	margin: 15px;
}
        
    </style>
</head>
<body>
    <section id="header">
    <div>
        <ul id="navbar">
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
    <section id="CurdOpretion">
        <div class = "AdminHead">
            <h1>Admin Dashboard</h1>
            <ul id="CurdList">
                <li><a href="#"><button class = "Profile" onclick="showSection('profile')"><i class="fa fa-user" style="font-size:38px;color: white;"></i> <p>Profile</p></button></a></li>
                <li><a href="#"><button id="add-button" class= "AddProduct" onclick="showSection('addNextProduct')"><i class="fa fa-plus-square" style="font-size:38px;color:white"></i> <p>Add Product</p></button></a></li>
                <li><a href="#"><button class= "View" onclick="showSection('viewProducts')"><i class="fa fa-folder-open" style="font-size:38px;color:white"></i><p>View Products</p></button></a></li>
                <li><a href="#"><button class= "Update" onclick="showSection('updateProduct')"><i class="fa fa-upload" style="font-size:38px;color:white"></i> <p> Update</p></button></a></li>
                <li><a href="#"><button id="delete-button" onclick="showSection('deleteProduct')"><p>Delete</p></button></a></li>
                <li><a href="#"><button class= "ViewOrder" onclick="showSection('viewOrder')"><i class="fa fa-folder-open" style="font-size:38px;color:white"></i><p>View Order</p></button></a></li>
            </ul>
    
        </div>
        <div id="profile" class="profile" hidden>
        	<h2>INFO</h2>
        	<div class="profile-info">
            <p><strong>First Name:</strong> <%= fName %></p>
            <p><strong>Last Name:</strong> <%= lName %></p>
            <p><strong>Username:</strong> <%= currentUser %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Phone Number:</strong> <%= pnumber %></p>
            <p><strong>Address:</strong> <%= address %></p>
        </div>
        </div>

        <div id="addNextProduct" class="product-box-border" hidden>
            <h2>Add Product</h2>
            <form action="AddProduct" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col">
                        <label for="productID">Product ID</label> 
                        <input type="text" id="Product ID" name="Product ID" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="productName">Product Name: </label> 
                        <input type="text" id="productName" name="productName" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="price">Price</label> 
                        <input type="text" id="price" name="price" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="quantity">Quantity</label> 
                        <input type="text" id="quantity" name="quantity" required>
                    </div>
                </div>
                <div class = "row">
                	<div class = "col">
                		<label for="image">Image</label>
                		<input type="file" id="image" name="image" required>
                	</div>
                </div>
                <button type="submit">ADD</button>
            </form>
            <!--Creating the button below to return to the admin page from add to product page-->
            <button onclick="showSection('dashboardContent')"> Return </button>
        
        </div>

        <div id="deleteProduct" class="product-box-border" hidden>
            <h2>Delete Product</h2>
            <form action="ModifyProduct" method="post">
                <div class="row">
                    <div class="col">
                        <label for="productID">Product ID</label> 
                     	<input type="text" name="deleteId" required/>
                    </div>
                </div>
                <button type="submit">Delete</button>
            </form>
            <!--Creating the button below to return to the admin page from add to product page-->
            <button onclick="showSection('dashboardContent')"> Return </button>
        </div> 

        <div id="updateProduct" class="product-box-border" hidden>
            <h2>Update Product</h2>
                <form action="ModifyProduct" method="post">
                    <!-- Input field for product ID -->
                    <!-- Other input fields for the updated product details -->
                    <div class="row">
                    <div class="col">
                        <label for="productID">Product ID</label> 
                        <input type="text" id="Product ID" name="productIdToUpdate" required>
    
                    </div>    
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="updatedProductName">Product Name: </label> 
                            <input type="text" id="updatedProductName" name="updatedProductName" required>
                            </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="updatedProductPrice">Product Price: </label> 
                            <input type="text" id="updatedProductName" name="updatedProductPrice" required>
                            </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="updatedProductName">Product Quantity: </label> 
                            <input type="text" id="updatedProductName" name="updatedProductQuantity" required>
                            </div>
                    </div>
                        <!-- Add other input fields for the rest of the product details to be updated -->
                        <button type="submit">Update</button>
                        <button onclick="showSection('updateProductNext')" style="margin-top:150px"> Return </button>
                    </form>
                <!-- Button to return to the admin page -->

        </div>
        <div class="heading" id="viewProducts" hidden>           
            <div class="view-product-main" hidden>            
                <c:if test = "${empty productList}">
                    <h1>No Product Found</h1>
                </c:if>
                
                <c:if test = "${not empty productList }">
                    <table class="producttable">
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Image</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${productList}">
                                
                                <tr>
                                <td><fmt:formatNumber value="${product.productID}" type="number" /></td>
                                <td>${product.productName}</td>
                                <td><fmt:formatNumber value="${product.price}" type="currency" /></td>
                                <td><fmt:formatNumber value="${product.quantity}" type="number" /></td>
                                <td><img src="${pageContext.request.contextPath}/images/${product.imageUrlFromPart}"class="img" alt="..."></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    
                </c:if>
            </div>
        </div>
        
       	<div id="viewOrder" class="section" hidden>
       		
            <h2>View Orders</h2>
            <div class="pro-container">
                <c:forEach var="order" items="${orders}">
                    <div class="pro">
                        <h4>Order ID: ${order.orderID}</h4>
                        <p>Product Name:
                            <c:forEach var="product" items="${productList}">
                                <c:if test="${order.productID == product.productID}">
                                    ${product.productName}
                                </c:if>
                            </c:forEach>
                        </p>
                        <p>Customer ID: ${order.customerID}</p>
                        <p>Order Date: ${order.orderDate}</p>
                        <p>Total Amount: ${order.totalAmount}</p>
                        <p>Is Delivered: ${order.isDelivered == 1 ? "Yes" : "No"}</p>
                    </div>
                </c:forEach>
            </div>
            </div>
      
        
        
    </section>
    
</body>
<script>
    document.addEventListener("DOMContentLoaded", function() {
            function showSection(sectionId) {
                const sections = ['profile', 'formContainer', 'updateProduct', 'deleteProduct', 'updateProductNext', 'addNextProduct', 'viewProducts','viewOrder'];
                sections.forEach(id => {
                    const element = document.getElementById(id);
                    if (element) {
                        element.style.display = 'none';
                    }
                });

                const section = document.getElementById(sectionId);
                if (section) {
                    section.style.display = 'block';
                }
            }

            window.showSection = showSection;
        });
</script>
</html>