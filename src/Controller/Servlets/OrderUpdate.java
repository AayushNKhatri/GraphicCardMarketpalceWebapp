package Controller.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Database.DatabaseController;

/**
 * Servlet implementation class OrderUpdate
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/OrderUpdate" })
public class OrderUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderUpdate() {
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
	        int orderId = Integer.parseInt(request.getParameter("orderId"));
	        int isDelivered = Integer.parseInt(request.getParameter("isDelivered"));

	        DatabaseController dbController = new DatabaseController();
	        boolean isUpdated = dbController.updateOrderStatus(orderId, isDelivered);

	        if (isUpdated) {
	            response.sendRedirect("ViewOrder"); // Redirect to the order view page
	        } else {
	            response.sendRedirect("error.jsp"); // Redirect to an error page
	        }
	    }

}
