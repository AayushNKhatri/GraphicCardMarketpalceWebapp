package Controller.Servlets;

import java.io.IOException;



import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.Database.DatabaseController;
import model.ProductModel;


/**
 * Servlet implementation class DisplayProduct
 */
@WebServlet (asyncSupported = true, urlPatterns = {"/DisplayProduct"})
public class DisplayProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DatabaseController dbcontroller = new DatabaseController();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String searchTerm = request.getParameter("search"); // Get search term
            ArrayList<ProductModel> products;
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                products = dbcontroller.getProductInfo(searchTerm); // Pass search term to database controller
            } else {
                products = dbcontroller.getProductInfo(); // Get all products if no search term
            }

            request.setAttribute("productList", products);
            request.getRequestDispatcher("/JSP/product.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // This servlet does not handle POST requests, so this method is left empty
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

}
    
}
