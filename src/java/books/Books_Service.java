package books;

// specified to error handling
import entities.Book;
import java.util.ArrayList;
import java.util.HashMap;

public class Books_Service {

    private final Books_Repository books_Repository;

    public Books_Service() {
        this.books_Repository = new Books_Repository();
    }

    public HashMap<Integer, ArrayList<Book>> getAllBooks(String keyword) {
        try {
            return this.books_Repository.getAllBooks(keyword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
