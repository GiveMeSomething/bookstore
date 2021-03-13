package books;

// specified to error handling
import category.Category_Repository;
import entities.Book;
import entities.Category;
import java.util.ArrayList;
import java.util.HashMap;

public class Books_Service {

    private final Books_Repository books_Repository;
    private final Category_Repository category_Repository;

    public Books_Service() {
        this.books_Repository = new Books_Repository();
        this.category_Repository = new Category_Repository();
    }

    public HashMap<Integer, ArrayList<Book>> getAllBooks(String keyword) {
        HashMap<Integer, ArrayList<Book>> bookMap = new HashMap<>();
        try {
            bookMap = this.books_Repository.getAllBooks(keyword);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookMap;
    }

    public ArrayList<Category> getBookCategory() {
        ArrayList<Category> categoryList = new ArrayList<>();
        try {
            categoryList = this.category_Repository.getCategories();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return categoryList;
    }
}
