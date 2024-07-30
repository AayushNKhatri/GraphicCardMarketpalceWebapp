package Controller.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utills.StringUtills;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization method, not used in this implementation
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);
        boolean isLoggedIn = session != null && session.getAttribute(StringUtills.USERNAME) != null;

        // Retrieve is_admin attribute safely
        int isAdmin = 0; // Default value
        if (isLoggedIn) {
            Object isAdminObj = session.getAttribute("is_admin");
            if (isAdminObj instanceof Integer) {
                isAdmin = (Integer) isAdminObj;
            }
        }

        // Allow access to static resources and public pages without authentication
        if (uri.endsWith(".css") || uri.endsWith(StringUtills.HOMEPAGE) || 
            uri.endsWith(StringUtills.LOGINPAGE) || uri.endsWith(StringUtills.REGISTERPAGE) || 
            uri.endsWith(StringUtills.ABOUTUS_PAGE) || uri.endsWith(StringUtills.DISPALY_PRODUCT) || 
            uri.endsWith(StringUtills.LOGOUT_SEVLET) || uri.equals(req.getContextPath() + "/")) {
            chain.doFilter(request, response);
            return;
        }

        // Check for protected resources and redirect if not logged in
        if (!isLoggedIn && (uri.endsWith(StringUtills.VIEW_CART_PAGE) || 
                            uri.endsWith(StringUtills.USER_PROFILE_SERVLET))) {
            chain.doFilter(request, response);
            return;
        }

        // Prevent logged-in users from accessing login and registration pages
        boolean isLoginPage = uri.endsWith(StringUtills.LOGINPAGE);
        boolean isLoginServlet = uri.endsWith(StringUtills.LOGIN_SERVLET);
        boolean isRegisterPage = uri.endsWith(StringUtills.REGISTERPAGE);
        boolean isRegisterServlet = uri.endsWith(StringUtills.REGISTER_SERVLET);

        if (isLoggedIn && (isLoginPage || isLoginServlet || isRegisterPage || isRegisterServlet)) {
            res.sendRedirect(req.getContextPath() + StringUtills.HOMEPAGE);
            return;
        }

        // Check for admin role and restrict access to non-admin pages
        boolean isAdminPage = uri.endsWith(StringUtills.ADMIN_PANEL_FOR_PAGE_EDIT) || uri.endsWith(StringUtills.ADMIN_PANEL);

        if (isAdmin == 1 && !isAdminPage) {
            res.sendRedirect(req.getContextPath() + StringUtills.ADMIN_PANEL_FOR_PAGE_EDIT);
            return;
        }

        // Check for regular customer role and restrict access to admin pages
        if (isAdmin != 1 && isAdminPage) {
            res.sendRedirect(req.getContextPath() + StringUtills.HOMEPAGE); // Redirect regular users from admin pages to home
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Destruction method, not used in this implementation
    }
}
