package users;

import entities.User;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "User_Controller", urlPatterns = "/user")
public class User_Controller extends HttpServlet {

    private User_Service user_Service;

    @Override
    public void init() throws ServletException {
        this.user_Service = new User_Service();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User currentUser = (User) session.getAttribute("user");

        String updatedEmail = request.getParameter("email");
        String updatedPhoneNum = request.getParameter("phoneNum");

        User updateUser = new User(
                currentUser.getUsername(),
                currentUser.getPassword(),
                updatedEmail,
                updatedPhoneNum,
                currentUser.getSalt());
        try {
            boolean isUpdated = this.user_Service.updateUser(updateUser);
            if (isUpdated) {
                session.setAttribute("user", this.user_Service.getUser(currentUser.getUsername()));
                response.sendRedirect(request.getContextPath() + "/user");
            } else {
                request.setAttribute("message", this.user_Service.getMessage());
                request.getRequestDispatcher(request.getContextPath() + "/user").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
