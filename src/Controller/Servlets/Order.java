package Controller.Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.Database.DatabaseController;
import Utills.StringUtills;
import model.CartModel;
import model.OrderModel;

/**
 * Servlet implementation class Order
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Order" })
public class Order extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartID = Integer.parseInt(request.getParameter("cartID"));
        HttpSession session = request.getSession();
        Integer customerID = (Integer) session.getAttribute("customerID");

        if (customerID != null) {
            DatabaseController dbController = new DatabaseController();
            
            // Retrieve cart items
            ArrayList<CartModel> cartItems = dbController.getCartItems(cartID);
            int totalAmount = 0;
            
            // Calculate total amount and insert orders
            for (CartModel item : cartItems) {
                int itemTotal = item.getCartAmount() * item.getCartQuantity();
                totalAmount += itemTotal;
                
                // Add each cart item to order
                boolean orderPlaced = dbController.addOrder(customerID, item.getProductId(), totalAmount, item.getCartQuantity());
                
                if (!orderPlaced) {
                    // Handle failure to place order
                    response.sendRedirect("ErrorPage.jsp");
                    return; // Exit early if any failure occurs
                } else {
                    // Remove item from cart
                	 boolean itemRemoved = dbController.deleteCartItem(item.getCartId());
                    if (!itemRemoved) {
                        // Handle failure to remove cart item
                        response.sendRedirect("ErrorPage.jsp");
                        return; // Exit early if any failure occurs
                    }
                }
            }
            
            // If all orders were placed and cart items removed successfully
            response.sendRedirect("ViewOrder");
        } else {
            response.sendRedirect("Login.jsp"); // Redirect to login if not authenticated
        }
    }
}
