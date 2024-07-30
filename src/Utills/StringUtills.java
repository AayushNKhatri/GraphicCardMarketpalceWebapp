package Utills;

import java.io.File;

public class StringUtills {
	//Database Connection utills
	public static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
	public static final String LOCALHOST_URL = "jdbc:mysql://localhost:3306/graphicwala";
	public static final String LOCALHOST_USERNAME = "root";
	public static final String LOCALHOST_PASSWORD = "";
	//Querrys for CURD operation
	public static final String ADD_PRODUCT = "INSERT INTO `product`(`ProductID`, `ProductName`, `Price`, `Quantity`, `image`) VALUES (?,?,?,?,?)";
	public static final String GET_PRODUCT = "SELECT productID, productName, price, quantity, image FROM product";
	public static final String DELETE_PRODUCT = "DELETE FROM product WHERE ProductID = ?";
	public static final String USER_DETAIL = "INSERT INTO customer (" + "FirstName, LastName, Address, PhoneNumber, Email, Username, Password) "+ "VALUES (?,?,?,?,?,?,?)";
	public static final String LOGIN_CHECK = "SELECT * FROM customer WHERE Username = ?";
	public static final String UPDATE_QUERRY = "UPDATE product SET ProductName =?, Price =?, Quantity =? WHERE ProductID =?";
	public static final String ADD_CART = "INSERT INTO cart (CustomerID, CartID, ProductID, CartAmount, CartQuantity) VALUES (?, ?, ?, ?, ?)";

	public static final String UPDATE_CART = "UPDATE cart SET `Quantity`=? WHERE `Customer's Email`=? AND `Customer_Name`=? AND `Product_id`=?";
	public static final String GET_USER = "SELECT * FROM customer";
	//CURD operation Data's
	public static final String PRODUCT_ID = "Product ID";
	public static final String PRODUCT_NAME = "productName";
	public static final String PRICE = "price";
	public static final String QUANTITY = "quantity";
	
	
	public static final String FIRST_NAME = "firstname";
	public static final String LAST_NAME = "lastname";
	public static final String USERNAME = "username";
	public static final String ADDRESS = "address";
	public static final String PHONENUMBER = "phonenumber";
	public static final String EMAIL = "email";
	public static final String PASSWORD = "password";
	public static final String REPASS = "repass";
	//public static final String 
	public static final String IMAGE_DIR = "D:\\College\\AdvanceProgrammingandtech\\workshop\\GraphicCardMarketpalceWebapp\\WebContent\\images";
	public static final String PRODUCT_IMAGE = "D:" + File.separator + IMAGE_DIR;
	
	public static final String LOGIN_SERVLET = "/Login";
	public static final String REGISTER_SERVLET = "/UserRegister";
	public static final String HOME_SEVLET = "/HomeServlet";
	public static final String LOGOUT_SEVLET = "/LogoutServlet";
	public static final String LOGIN_SERVLET_SELF = "Login";
	public static final String REGISTER_SERVLET_SELF = "UserRegister";
	
	
	
		
	public static final String SUCESS_LOGIN = "Sucessfully Login";
	public static final String ERROR_LOGIN = "Either Username or password is incorrect";
	public static final String ACCOUNT_NOT_FOUND = "Accouct is not regiseter";
	public static final String MESSAGE_ERROR_REGISTER = "Enter the correct data";
	public static final String SERVER_ERROR = "Something wrong with the server";
	public static final String SUCESS_DELETE = "Sucessfully delete";
	
	public static final String HOMEPAGE = "/home.jsp";
	public static final String LOGINPAGE = "/JSP/Login.jsp";
	public static final String REGISTERPAGE = "/JSP/Register.jsp";
	public static final String USERPROFILE = "/JSP/userProfile.jsp";
	public static final String ERROR_LOGIN_PAGE = "/JSP/loginFali.jsp";
	public static final String ERROR_REGISTER_PAGE = "/JSP/registerFail.jsp";
	public static final String ABOUTUS_PAGE = "/JSP/aboutUs.jsp";
	public static final String PRODUCT_PAGE = "/JSP/product.jsp";
	public static final String LOGIN_FAIL = "/JSP/loginFail.jsp";
	public static final String REGISTER_FAIL = "/JSP/registerFail.jsp";
	public static final String LOGEDIN_HOME = "/logedInHome.jsp";
	
	
	public static final String MESSAGE_SUCCESS = "successMessage";
	public static final String MESSAGE_ERROR = "errorMessage";
	
	
	public static final String USER = "user";
	public static final String SUCCESS = "success";
	public static final String LOGIN = "Login";
	public static final String LOGOUT = "Logout";
	public static final String DELETE_ID= "deleteId";
	public static final String UPDATE_ID= "updateId";
	
	
	

	public static final String ADMIN_PANEL = "/JSP/adminPanel.jsp";
	public static final String ADMIN_PANEL_FOR_PAGE = "JSP/adminPanel.jsp";

	
	public static final String ADMIN_PANEL_EDIT= "ModifyProduct";
	public static final String ADMIN_PANEL_FOR_PAGE_EDIT = "/ModifyProduct";
	public static final String DISPALY_PRODUCT = "/DisplayProduct";
	public static final String LOGO_PATH = "/images/logo.png";
	public static final String BACKGROUND_IMAGE = "/images/background-images.jpg";
	public static final String MY_FOTO = "/images/aayush.jpg";
	public static final String USER_PROFILE_SERVLET = "/UserProfile";
	public static final String USER_PROFILE_SERVLET_PAGE = "UserProfilel";
	public static final String IMAGE_FILE = "../images/";
	public static final String ANALATIC_IM = "../images/Admin-Panel.jpg";
	public static final String PASSWORD_MISMATCH = "Passwords do not match. Please try again.";
	public static final String VIEW_CART_PAGE = "/JSP/ViewCart.jsp";
	public static final String SEARCH = "/Search";
	public static final String CART = "/ViewCart"; 
	public static final String ADD_TO_CART = "/addToCart";
	public static final String VIEW_ORDER_SERVLET = "/ViewOrder";
	public static final String VIEW_ORDER = "/JSP/Order.jsp";
	
}
