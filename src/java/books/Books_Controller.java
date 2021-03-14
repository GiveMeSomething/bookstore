package books;

import entities.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Books_Controller", urlPatterns = "/books")
public class Books_Controller extends HttpServlet {

    private Books_Service books_Service;

    @Override
    public void init() throws ServletException {
        books_Service = new Books_Service();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // 0 is the default list that contain all books
        session.setAttribute("bookList", this.books_Service.getAllBooks("").get(0));
        session.setAttribute("categoryList", this.books_Service.getBookCategory());
        session.setAttribute("cart", new ArrayList<>());

        response.sendRedirect(request.getContextPath() + "/store");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String keyword = request.getParameter("keyword");
        String[] tags = request.getParameterValues("tag");

        try {
            if (tags != null && tags.length > 1) {
                session.setAttribute("bookList", new ArrayList<>());
            } else {
                Map<Integer, ArrayList<Book>> bookMap = this.books_Service.getAllBooks(keyword);
                ArrayList<Book> bookList = bookMap.get(tags != null ? Integer.parseInt(tags[0]) : 0);
                if (bookList == null) {
                    session.setAttribute("bookList", new ArrayList<>());
                } else {
                    session.setAttribute("bookList", bookList);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (session.getAttribute("categoryList") == null) {
            session.setAttribute("categoryList", this.books_Service.getBookCategory());
        }

        response.sendRedirect(request.getContextPath() + "/store");
    }
}
