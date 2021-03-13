package category;

import entities.Category;
import infrastructure.database.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Category_Repository {

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

    public ArrayList<Category> getCategories() throws SQLException {
        initConnection();

        String sql = "SELECT CategoryId, CategoryName, [Description] FROM HE150277_HoangTienMinh_Categories";

        ArrayList<Category> categoryList = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                categoryList.add(new Category(
                        result.getInt("CategoryId"),
                        result.getString("CategoryName"),
                        result.getString("Description")
                ));
            }

            result.close();
            disconnect();
        }

        return categoryList;
    }

    public Category getCategory(int categoryId) throws SQLException {
        initConnection();

        String sql = "SELECT CategoryId, CategoryName, [Description] FROM HE150277_HoangTienMinh_Categories"
                + "WHERE CategoryId = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, categoryId);
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                return new Category(
                        result.getInt("CategoryId"),
                        result.getString("CategoryName"),
                        result.getString("Description")
                );
            } else {
                return null;
            }
        }
    }
}
