package orders;

import entities.Book;
import entities.Order;
import infrastructure.database.DBContext;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class Orders_Repository {

    private Connection connection;

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

    public void addOrder() {

    }

    private boolean addNewOrder() {

    }

    private boolean addOrderDetail(ArrayList<Book> cartItems, Order order) {

    }

}
