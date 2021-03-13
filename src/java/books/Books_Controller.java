package books;

import entities.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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

        session.setAttribute("shoppingCart", new ArrayList<>());

        // 0 is the default list that contain all books
        session.setAttribute("bookList", this.books_Service.getAllBooks("").get(0));

        response.sendRedirect(request.getContextPath() + "/store");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String keyword = request.getParameter("keyword");
        List<String> tags = Arrays.asList(request.getParameterValues("tag"));

        try {
            if (tags.size() > 1) {
                session.setAttribute("bookList", new ArrayList<>());
            } else {
                Map<Integer, ArrayList<Book>> bookMap = this.books_Service.getAllBooks(keyword);

                int tagId = Integer.parseInt(tags.get(0));
                session.setAttribute("bookList", bookMap.get(tagId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/store");
    }
}
