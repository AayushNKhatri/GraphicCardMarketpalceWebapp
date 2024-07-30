package Controller.Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Database.DatabaseController;

@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateCart" })
public class UpdateCart extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController dbController = new DatabaseController();

    public UpdateCart() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartID = Integer.parseInt(request.getParameter("cartID"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        // Update the cart item quantity
        boolean success = dbController.updateCartItemQuantity(cartID, newQuantity);

        if (success) {
            // Redirect to ViewCart servlet to refresh the cart view
            response.sendRedirect(request.getContextPath() + "/ViewCart");
        } else {
            // Handle update failure (e.g., show an error message)
            request.setAttribute("errorMessage", "Failed to update cart item quantity.");
            request.getRequestDispatcher("/JSP/ViewCart.jsp").forward(request, response);
        }
    }
}
