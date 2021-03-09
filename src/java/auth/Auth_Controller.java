/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import entities.User;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// specified for receiving and forwarding request and response
public class Auth_Controller extends HttpServlet {

    Auth_Service auth_Service;

    @Override
    public void init() throws ServletException {
        auth_Service = new Auth_Service();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("signout").equals("1")) {
            request.getSession().removeAttribute("user");
            response.sendRedirect(request.getContextPath());
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String email = request.getParameter("email");
        String phoneNum = request.getParameter("phoneNum");

        User user = new User(username, password, email, phoneNum);
        boolean result;
        String work;
        try {
            if (phoneNum != null && email != null) {
                result = auth_Service.register(user);
                work = "register";
            } else {
                result = auth_Service.login(user);
                work = "login";
            }

            if (result) {
                HttpSession session = request.getSession();
                session.setAttribute("user", auth_Service.getUser(username));
                response.sendRedirect(request.getContextPath());
            } else {
                if (work.equals("register")) {
                    request.setAttribute("message", auth_Service.getMessage());
                    request.getRequestDispatcher("/auth/register").forward(request, response);
                } else {
                    request.setAttribute("message", auth_Service.getMessage());
                    request.getRequestDispatcher("/auth/login").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
