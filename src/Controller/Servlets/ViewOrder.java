package Controller.Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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

@WebServlet(asyncSupported = true, urlPatterns = { "/ViewOrder" })
public class ViewOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DatabaseController DBController = new DatabaseController();

    public ViewOrder() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerID");

        if (customerId == null) {
            response.sendRedirect(StringUtills.LOGINPAGE);
            return;
        }

        ArrayList<OrderModel> orderItems = DBController.getOrders(customerId);
        ArrayList<ProductModel> products = DBController.getProductInfo();

        request.setAttribute("orders", orderItems);
        request.setAttribute("productList", products);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/Order.jsp");
        dispatcher.forward(request, response);
    }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession userSession = request.getSession(true);
        String userName = request.getParameter(StringUtills.USERNAME);
        int customerID = DBController.getCustomerIDByUserName(userName);
        userSession.setAttribute("customerID", customerID);
        doGet(request, response);
    }
}
