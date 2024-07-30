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
import Utills.StringUtills;
import model.UserLoginModel;
import model.UserModel;

/**
 * Servlet implementation class UserDetail
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/UserProfile" })
public class UserDetail extends HttpServlet {
    private static final long serialVersionUID = 1L;
    DatabaseController dbcontroller = new DatabaseController();

    public UserDetail() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ArrayList<UserModel> user = dbcontroller.getUserInfo();
            request.setAttribute("userInfo", user);
            request.getRequestDispatcher("/JSP/userProfile.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        
        DatabaseController dbController = new DatabaseController();

        if ("updateProfile".equals(action)) {
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


            int result = dbController.updateUserDetails(user);
            if (result == 1) {
                // Update session attributes
                session.setAttribute("firstName", firstName);
                session.setAttribute("lastName", lastName);
                session.setAttribute("email", email);
                session.setAttribute("phoneNumber", phoneNumber);
                session.setAttribute("address", address);    

                
                request.setAttribute("updateMessage", "Profile updated successfully.");
            } else {
                request.setAttribute("updateMessage", "Profile update failed.");
            }
            request.getRequestDispatcher(StringUtills.USERPROFILE).forward(request, response);

        } else if ("changePassword".equals(action)) {
            // Change user password
            String username = (String) session.getAttribute(StringUtills.USERNAME);
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            
            if (dbController.validateUser(new UserLoginModel(username, currentPassword))) {
                int result = dbController.changeUserPassword(username, newPassword);
                if (result == 1) {
                    request.setAttribute("updateMessage", "Password changed successfully.");
                } else {
                    request.setAttribute("updateMessage", "Password change failed.");
                }
            } else {
                request.setAttribute("updateMessage", "Current password is incorrect.");
            }
            request.getRequestDispatcher(StringUtills.USERPROFILE).forward(request, response);
        }
    }

}
