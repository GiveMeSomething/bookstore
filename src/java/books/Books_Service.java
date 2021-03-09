package books;

// specified to error handling
public class Books_Service {

    private final Books_Repository books_Repository;

    public Books_Service() {
        this.books_Repository = new Books_Repository();
    }

}
