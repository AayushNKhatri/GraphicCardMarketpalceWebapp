package Controller.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Controller.Database.DatabaseController;
import Utills.StringUtills;
import model.ProductModel;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AddProduct" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final DatabaseController DatabaseController;
    
    // Constructor to initialize DatabaseController
    public AddProduct() {
        this.DatabaseController = new DatabaseController();
    }
    
    // Handles GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forwards the request to adminPanel.jsp
        request.getRequestDispatcher("/JSP/adminPanel.jsp").forward(request, response);
    }
    
    // Handles POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter printOut = response.getWriter();
        // Retrieve parameters from the request
        int productID = Integer.parseInt(request.getParameter(StringUtills.PRODUCT_ID));
        String productName = request.getParameter(StringUtills.PRODUCT_NAME);
        int price = Integer.parseInt(request.getParameter(StringUtills.PRICE));
        int quantity = Integer.parseInt(request.getParameter(StringUtills.QUANTITY));
        Part imagePart = request.getPart("image");
        
        
        // Create a ProductModel object with the retrieved parameters
        ProductModel product = new ProductModel(productID, productName, price, quantity, imagePart);
        
        
        // Add the product to the database and get the result
        int result =  DatabaseController.addProduct(product);
        System.out.println("Rows affected: " + result);
        
        // If the product was added successfully, redirect to the admin page
        if(result <= 1 ) {
			String fileName = product.getImageUrlFromPart();

			// Check if a filename exists (not empty or null)
			if (!fileName.isEmpty() && fileName != null) {
			  // Construct the full image save path by combining the directory path and filename
			  String savePath = "D:\\Software\\Xamp\\tomcat\\webapps\\images";
			  imagePart.write(savePath + fileName);  // Save the uploaded image to the specified path
			}
			printOut.println("<h1> Product is added<h1>");
            response.sendRedirect(request.getContextPath() + StringUtills.ADMIN_PANEL_FOR_PAGE_EDIT);
        } else {
            // If the product was not added, print an error message
            printOut.println("<h1> Your product is Not added<h1>");
        }
    }

}
