package Controller.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.Database.DatabaseController;
import model.CartModel;

@WebServlet(asyncSupported = true, urlPatterns = { "/addToCart" })
public class addToCart extends HttpServlet {
    private static final long serialVersionUID = 1L;
    DatabaseController DBController = new DatabaseController();

    public addToCart() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests if necessary
    	
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Use false to avoid creating a new session
        if (session == null || session.getAttribute("customerID") == null) {
            // Redirect to login page if no active session or no customerID
            response.sendRedirect("login.jsp"); // Adjust the path as needed
            return;
        }

        Integer customerID = (Integer) session.getAttribute("customerID");
        String productParam = request.getParameter("cartProduct");
        String cartAmountParam = request.getParameter("cartAmount");
        String cartQuantityParam = request.getParameter("cartQuantity");

        if (productParam == null || productParam.trim().isEmpty() ||
            cartAmountParam == null || cartAmountParam.trim().isEmpty() ||
            cartQuantityParam == null || cartQuantityParam.trim().isEmpty()) {
            // Redirect to the product page with an error message if any parameter is missing
            request.setAttribute("errorMessage", "All fields are required. Please fill out the form completely.");
            request.getRequestDispatcher("/JSP/product.jsp").forward(request, response);
            return;
        }

        try {
            int productID = Integer.parseInt(productParam);
            int cartAmount = Integer.parseInt(cartAmountParam);
            int cartQuantity = Integer.parseInt(cartQuantityParam);

            // Retrieve or create the cart ID associated with the customer
            int actualCartID = DBController.getOrCreateCartID(customerID);

            // Attempt to add the item to the cart
            boolean success = DBController.addToCart(new CartModel(customerID, actualCartID, productID, cartAmount, cartQuantity));

            if (!success) {
                // Handle failure to add item to cart
                request.setAttribute("errorMessage", "Failed to add item to cart. Please try again.");
                request.getRequestDispatcher("/JSP/product.jsp").forward(request, response);
                return;
            }

            // Redirect to the cart view page or another relevant page
            response.sendRedirect("ViewCart"); // Adjust the path as needed
        } catch (NumberFormatException e) {
            // Handle the NumberFormatException
            request.setAttribute("errorMessage", "Invalid input. Please enter valid numbers for product ID, cart amount, and cart quantity.");
            request.getRequestDispatcher("/JSP/product.jsp").forward(request, response);
        }
    }
}
