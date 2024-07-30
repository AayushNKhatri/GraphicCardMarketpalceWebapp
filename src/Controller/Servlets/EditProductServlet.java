package Controller.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.Database.DatabaseController;
import Utills.StringUtills;
import model.OrderModel;
import model.ProductModel;

/**
 * Servlet implementation class DeleteProductServelet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ModifyProduct" })
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final DatabaseController dbcontroller; 
    
    public EditProductServlet() {
        this.dbcontroller = new DatabaseController();
    }

    // Handles GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieves product information from the database and forwards to adminPanel.jsp

  

        ArrayList<ProductModel> products = dbcontroller.getProductInfo();
        ArrayList<OrderModel> orders = dbcontroller.getAllOrders();

        request.setAttribute("orders", orders);
        request.setAttribute("productList", products);
        request.getRequestDispatcher("/JSP/adminPanel.jsp").forward(request, response);
      
    }

    // Handles POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieves product ID for updating from request parameters
        String productToUpdateId = request.getParameter("productIdToUpdate");
        
        // Checks if product ID for updating is provided and not empty
        if (productToUpdateId!= null &&!productToUpdateId.isEmpty()) {
	            try {
	                // Parses product ID for updating to an integer
	                int parsedProductIdToUpdate = Integer.parseInt(productToUpdateId);
	                
	                // Fetches updated product details from request parameters
	                String productNameToUpdate = request.getParameter("updatedProductName");
	                int updatedProductPrice = Integer.parseInt(request.getParameter("updatedProductPrice"));
	                int updatedProductQuantity = Integer.parseInt(request.getParameter("updatedProductQuantity"));
	
	                // Proceeds to update product information
	                dbcontroller.updateProductInfo(parsedProductIdToUpdate, productNameToUpdate, updatedProductPrice, updatedProductQuantity);
	
	                // Redirects user to admin page or another relevant page
	                response.sendRedirect(StringUtills.ADMIN_PANEL_EDIT);
	            } catch (NumberFormatException e) {
	                // Handles cases where product ID for update is not a valid integer
	                response.sendRedirect(request.getContextPath() + "ModifyProduct");
	                return;
	            }
	        } else if (request.getParameter("deleteId")!= null &&!request.getParameter("deleteId").isEmpty()) {
	            try {
	                // Parses product ID for deletion to an integer
	            	String unParsendDeleteID = request.getParameter("deleteId");
	            	int parsedProductIdToDelete = Integer.parseInt(unParsendDeleteID);
	            	dbcontroller.deleteProductInfo(parsedProductIdToDelete);
	
	                // Redirects user to admin page or another relevant page
	                response.sendRedirect(StringUtills.ADMIN_PANEL_EDIT);
	            } catch (NumberFormatException e) {
	                // Handles cases where product ID for deletion is not a valid integer
	                response.sendRedirect(request.getContextPath() + "ModifyProduct?error=invalid_input");
	                return;
	            }
	        } else {
	            // Handles scenarios where neither product ID for update nor deletion is provided
	            response.sendRedirect(request.getContextPath() + "ModifyProduct?error=no_action_specified");
	            return;
	        }
        
    }

    // Handles PUT requests
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read request parameters for update
        PrintWriter printOut = response.getWriter();
        int productID = Integer.parseInt(request.getParameter("productIdToUpdate"));
        String productName = request.getParameter("updatedProductName");
        int price = Integer.parseInt(request.getParameter("updatedProductPrice"));
        int quantity = Integer.parseInt(request.getParameter("updatedProductQuantity"));

        // Call the updateProductInfo method
        int result = dbcontroller.updateProductInfo(productID, productName, price, quantity);
        
        if(result == 1) {
            response.sendRedirect(request.getContextPath() + StringUtills.ADMIN_PANEL_EDIT);
        } else {
            printOut.println("<h1> Your product is Not been update<h1>");
        }

        // Redirect or forward to another page based on your application's flow
        response.sendRedirect(StringUtills.ADMIN_PANEL_EDIT); // Example redirect
    }


}
