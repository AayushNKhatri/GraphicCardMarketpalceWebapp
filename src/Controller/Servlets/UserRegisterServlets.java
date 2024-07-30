package Controller.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.Database.DatabaseController;
import Utills.StringUtills;
import model.UserModel;

/**
 * Servlet implementation class UserRegisterServlets
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/UserRegister"})
public class UserRegisterServlets extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DatabaseController dbController;

    public UserRegisterServlets() {
        this.dbController = new DatabaseController();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter(StringUtills.FIRST_NAME);
        String lastName = request.getParameter(StringUtills.LAST_NAME);
        String address = request.getParameter(StringUtills.ADDRESS);
        String phoneNumber = request.getParameter(StringUtills.PHONENUMBER);
        String email = request.getParameter(StringUtills.EMAIL);
        String userName = request.getParameter(StringUtills.USERNAME);
        String password = request.getParameter(StringUtills.PASSWORD);
        String repassword = request.getParameter(StringUtills.REPASS);

        if (password == null || !password.equals(repassword)) {
            HttpSession session = request.getSession();
            session.setAttribute(StringUtills.MESSAGE_ERROR, StringUtills.PASSWORD_MISMATCH);
            response.sendRedirect(request.getContextPath() + StringUtills.REGISTERPAGE);
            return;
        }

        if (dbController.isUsernameTaken(userName)) {
            HttpSession session = request.getSession();
            session.setAttribute(StringUtills.MESSAGE_ERROR, "Username already taken.");
            response.sendRedirect(request.getContextPath() + StringUtills.REGISTERPAGE);
            return;
        }

        if (dbController.isEmailTaken(email)) {
            HttpSession session = request.getSession();
            session.setAttribute(StringUtills.MESSAGE_ERROR, "Email already registered.");
            response.sendRedirect(request.getContextPath() + StringUtills.REGISTERPAGE);
            return;
        }

        UserModel user = new UserModel(firstName, lastName, address, phoneNumber, email, userName, password, repassword);
        int result = dbController.userRegister(user);

        switch (result) {
            case 1:
                // Retrieve customerID and store it in session
                int customerID = dbController.getCustomerIDByUserName(userName);
                HttpSession session = request.getSession();
                session.setAttribute("customerID", customerID);
                session.setAttribute(StringUtills.SUCESS_LOGIN, StringUtills.MESSAGE_SUCCESS);
                response.sendRedirect(request.getContextPath() + StringUtills.LOGINPAGE);
                break;

            case 0:
                session = request.getSession();
                session.setAttribute(StringUtills.MESSAGE_ERROR, StringUtills.MESSAGE_ERROR_REGISTER);
                response.sendRedirect(request.getContextPath() + StringUtills.REGISTERPAGE);
                break;

            default:
                session = request.getSession();
                session.setAttribute(StringUtills.MESSAGE_ERROR, StringUtills.SERVER_ERROR);
                response.sendRedirect(request.getContextPath() + StringUtills.REGISTERPAGE);
                break;
        }
    }
}
