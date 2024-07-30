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
 * Servlet implementation class UpdateUserDetail
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateUserDetail" })
public class UpdateUserDetail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateUserDetail() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DatabaseController dbController = new DatabaseController();

        // Update user profile
        String username = (String) session.getAttribute(StringUtills.USERNAME);
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        UserModel user = new UserModel();
        user.setUserName(username);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);

        String updateMessage;
        int result = dbController.updateUserDetails(user);
        if (result == 1) {
            // Update session attributes
            session.setAttribute("firstName", firstName);
            session.setAttribute("lastName", lastName);
            session.setAttribute("email", email);
            session.setAttribute("phoneNumber", phoneNumber);
            session.setAttribute("address", address);
            updateMessage = "Profile updated successfully.";
        } else {
            updateMessage = "Profile update failed.";
        }

        // Set the message in session
        session.setAttribute("updateMessage", updateMessage);
        response.sendRedirect(request.getContextPath() + StringUtills.USER_PROFILE_SERVLET);
    }
}
