package Controller.Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import Controller.Database.DatabaseController;
import Utills.StringUtills;
import model.ProductModel;
import model.UserLoginModel;
import model.UserModel;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/Login"})
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DatabaseController dbController;

    /**
     * Constructor initializes the database controller.
     */
    public UserLoginServlet() {
        this.dbController = new DatabaseController();
    }

    /**
     * Handles HTTP GET requests.
     * Displays the login page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(StringUtills.LOGINPAGE).forward(request, response);
    }

    /**
     * Handles HTTP POST requests.
     * Processes user login form submission.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute(StringUtills.MESSAGE_ERROR);

        String userName = request.getParameter(StringUtills.USERNAME);
        String password = request.getParameter(StringUtills.PASSWORD);

        if (!dbController.isUserExists(userName)) {
            session.setAttribute(StringUtills.MESSAGE_ERROR, "Username does not exist.");
            session.setAttribute(StringUtills.USERNAME, userName);
            response.sendRedirect(request.getContextPath() + StringUtills.LOGINPAGE);
            return;
        }

        UserLoginModel loginModel = new UserLoginModel(userName, password);

        if (dbController.validateUser(loginModel)) {
            UserModel loggedInUser = dbController.getUserByUsername(userName);
            
            
            

            if (loggedInUser != null) {
                HttpSession userSession = request.getSession(true);
                userSession.setAttribute(StringUtills.USERNAME, loggedInUser.getUserName());
                userSession.setAttribute("firstName", loggedInUser.getFirstName());
                userSession.setAttribute("lastName", loggedInUser.getLastName());
                userSession.setAttribute("email", loggedInUser.getEmail());
                userSession.setAttribute("phoneNumber", loggedInUser.getPhoneNumber());
                userSession.setAttribute("address", loggedInUser.getAddress());
                userSession.setAttribute("password", loggedInUser.getPassword());
                
                
                
                int customerID = dbController.getCustomerIDByUserName(userName);
                userSession.setAttribute("customerID", customerID);
                
                // Store admin flag in session
                boolean isAdmin = dbController.isUserAdmin(userName);
                userSession.setAttribute("is_admin", isAdmin ? 1 : 0);
                
                userSession.setMaxInactiveInterval(30 * 60);

                Cookie userCookie = new Cookie(StringUtills.USER, loggedInUser.getUserName());
                userCookie.setMaxAge(30 * 60);
                response.addCookie(userCookie);

                if (isAdmin) {
                    response.sendRedirect(request.getContextPath() + StringUtills.ADMIN_PANEL_FOR_PAGE_EDIT);
                } else {
                    response.sendRedirect(request.getContextPath() + StringUtills.HOMEPAGE);
                }
            } else {
                session.setAttribute(StringUtills.MESSAGE_ERROR, "User details not found.");
                session.setAttribute(StringUtills.USERNAME, userName);
                response.sendRedirect(request.getContextPath() + StringUtills.LOGINPAGE);
            }
        } else {
            session.setAttribute(StringUtills.MESSAGE_ERROR, "Incorrect password.");
            session.setAttribute(StringUtills.USERNAME, userName);
            response.sendRedirect(request.getContextPath() + StringUtills.LOGINPAGE);
        }
    }
}
