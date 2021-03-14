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

        bookMap = new HashMap<>();
        bookMap.put(0, new ArrayList<>());
    }

    // need some criteria as paramter to filter the Book Map and return a result list
    // actually getBooks and getCategory to form a data structure
    public HashMap<Integer, ArrayList<Book>> getAllBooks(String keyword) throws SQLException {
        initConnection();

        String sql;
        boolean haveKeyword = !((keyword == null) || (keyword.trim().equals("")));
        if (haveKeyword) {
            sql = "SELECT BookId, BookName, Brand, UnitPrice, UnitsInStock, Supplier, CategoryId, ImageUrl\n"
                    + "FROM HE150277_HoangTienMinh_Books\n"
                    + "WHERE LOWER(BookName) LIKE ? OR LOWER(Brand) LIKE ? OR LOWER(Supplier) LIKE ?";
        } else {
            sql = "SELECT BookId, BookName, Brand, UnitPrice, UnitsInStock, Supplier, CategoryId, ImageUrl\n"
                    + "FROM HE150277_HoangTienMinh_Books";

        }
        bookMap = new HashMap<>();
        bookMap.put(0, new ArrayList<>());

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            if (haveKeyword) {
                statement.setString(1, "%" + keyword.toLowerCase() + "%");
                statement.setString(2, "%" + keyword.toLowerCase() + "%");
                statement.setString(3, "%" + keyword.toLowerCase() + "%");
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
                        result.getInt("UnitsInStock"),
                        result.getString("Supplier"),
                        result.getString("ImageUrl")
                );
                bookMap.get(categoryId).add(book);

                // key 0 return a list that contain all books (ignore tag)
                bookMap.get(0).add(book);
            }
        }
        return bookMap;
    }
}
