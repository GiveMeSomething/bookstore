/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package books;

import infrastructure.database.DBContext;
import java.sql.Connection;
import java.util.HashMap;

import entities.Book;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// Specified to handling db action
public class Books_Repository {

    private Connection connection;

    // Map<CategoryId, ArrayList<Book>>
    private HashMap<Integer, ArrayList<Book>> bookMap;

    private void initConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = new DBContext().getConnection();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private void disconnect() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Books_Repository() {
        initConnection();
    }

    // need some criteria as paramter to filter the Book Map and return a result list
    // actually getBooks and getCategory to form a data structure
    public HashMap<Integer, ArrayList<Book>> getAllBooks(String keyword) throws SQLException {
        initConnection();

        bookMap = new HashMap<>();
        String sql;
        boolean haveKeyword = !((keyword == null) || (keyword.trim().equals("")));
        if (haveKeyword) {
            sql = "SELECT BookId, BookName, Brand, UnitPrice, UnitsInStock, Suppliers FROM HE150277_HoangTienMinh_Books";
        } else {
            sql = "SELECT BookId, BookName, Brand, UnitPrice, UnitsInStock, Suppliers FROM HE150277_HoangTienMinh_Books"
                    + "WHERE BookName LIKE ? OR Brand LIKE ? OR Suppliers LIKE ?";
        }

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            if (haveKeyword) {
                statement.setString(1, "%" + keyword + "%");
                statement.setString(2, "%" + keyword + "%");
                statement.setString(3, "%" + keyword + "%");
            }
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int categoryId = result.getInt("CategoryId");
                if (!bookMap.containsKey(categoryId)) {
                    bookMap.put(categoryId, new ArrayList<>());
                }

                Book book = new Book(
                        result.getInt("BookId"),
                        result.getString("BookName"),
                        result.getString("Brand"),
                        result.getDouble("UnitPrice"),
                        result.getInt("UnitInStock"),
                        result.getString("Supplier")
                );
                bookMap.get(categoryId).add(book);

                // key 0 return a list that contain all books (ignore tag)
                bookMap.get(0).add(book);
            }
        }
        return bookMap;
    }
}
