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
    private HashMap<Integer, Book> books;

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
    public ArrayList<Book> getBooks() {
        String sqlBook
        return null;
    }

//    public void getAllBooks() {
//        books = new HashMap<>();
//        String sql = "select * from HE150277_HoangTienMinh_Books";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ResultSet result = ps.executeQuery();
//            while (result.next()) {
//                String id = result.getString("BookId");
//                String bookName = result.getString("BookName");
//                String brand = result.getString("Brand");
//
//                double unitPrice;
//                int unitInStock;
//                int supplier;
//
//                try {
//                    unitPrice = Double.parseDouble(result.getString("UnitPrice"));
//                    unitInStock = Integer.parseInt(result.getString("UnitInStock"));
//                    supplier = Integer.parseInt(result.getString("Supllier"));
//                } catch (NumberFormatException e) {
//                    // set default value if can't parse
//                    unitPrice = 0.0;
//                    unitInStock = 0;
//                    supplier = 0;
//
//                    System.err.println(e.getMessage());
//                }
//                books.put(id, new Book(bookName, brand, unitPrice, unitInStock, supplier));
//            }
//        } catch (SQLException e) {
//            this.status = "Error " + e.getMessage();
//        }
//    }
}
