package Controller.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Database.DatabaseController;

/**
 * Servlet implementation class RemoveCart
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/RemoveCart" })
public class RemoveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseController dbController = new DatabaseController(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        int cartID = Integer.parseInt(request.getParameter("cartID"));
        
        // Remove item from the cart
        boolean success = dbController.deleteCartItem	(cartID);

        if (success) {
            // Redirect to ViewCart servlet to refresh the cart view
            response.sendRedirect(request.getContextPath() + "/ViewCart");
        } else {
            // Handle removal failure (e.g., show an error message)
            request.setAttribute("errorMessage", "Failed to remove item from cart.");
            request.getRequestDispatcher("/JSP/ViewCart.jsp").forward(request, response);
        }
		doGet(request, response);
	}

}
