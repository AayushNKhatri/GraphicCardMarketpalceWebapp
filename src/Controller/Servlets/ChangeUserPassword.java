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
import model.UserLoginModel;

/**
 * Servlet implementation class ChangeUserPassword
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ChangePassword" })
public class ChangeUserPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUserPassword() {
        super();
        // TODO Auto-generated constructor stub
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
        HttpSession session = request.getSession();
        
        DatabaseController dbController = new DatabaseController();

        // Change user password
        String username = (String) session.getAttribute(StringUtills.USERNAME);
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        String updateMessage;
        if (dbController.validateUser(new UserLoginModel(username, currentPassword))) {
            int result = dbController.changeUserPassword(username, newPassword);
            if (result == 1) {
                updateMessage = "Password changed successfully.";
            } else {
                updateMessage = "Password change failed.";
            }
        } else {
            updateMessage = "Current password is incorrect.";
        }
        
        session.setAttribute("updateMessage", updateMessage);
        response.sendRedirect(request.getContextPath() + StringUtills.USER_PROFILE_SERVLET);
    }
}
