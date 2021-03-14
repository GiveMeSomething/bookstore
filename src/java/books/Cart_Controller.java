/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package books;

import entities.Book;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Cart_Controller", urlPatterns = {"/cart"})
public class Cart_Controller extends HttpServlet {

    private Books_Service books_Service;

    @Override
    public void init() throws ServletException {
        books_Service = new Books_Service();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Book> cart = (ArrayList<Book>) session.getAttribute("cart");

        String bookId = request.getParameter("id");
        // if it is null -> checkout
        if (bookId != null) {
            cart.add(this.books_Service.getBook(Integer.parseInt(bookId)));

            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/store");
        } else {
            response.sendRedirect(request.getContextPath() + "/store/checkout.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String work = (String) request.getParameter("work");

        HttpSession session = request.getSession();
        ArrayList<Book> cart = (ArrayList<Book>) session.getAttribute("cart");
        if (work == null) {
            response.sendRedirect(request.getContextPath() + "/store");
        } else if (work.equals("delete")) {
            int removeIndex = Integer.parseInt(request.getParameter("index"));
            cart.remove(removeIndex);

            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/store/checkout.jsp");
        }
    }
}
