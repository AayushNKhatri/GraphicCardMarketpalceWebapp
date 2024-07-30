package Controller.Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.Database.DatabaseController;
import model.ProductModel;

/**
 * Servlet implementation class ProductPage
 */
@WebServlet("/ProductPage")
public class ProductPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DatabaseController dbcontroller = new DatabaseController();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductPage() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve product information from the database
            ArrayList<ProductModel> products = dbcontroller.getProductInfo();
            
            // Set the product list as an attribute in the request
            request.setAttribute("productList", products);
            
            // Forward the request to product.jsp
            request.getRequestDispatcher("/JSP/product.jsp").forward(request, response);
        } catch (Exception ex) {
            // Print stack trace if an exception occurs
            ex.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Call the doGet method to handle post requests
        doGet(request, response);
    }

}
