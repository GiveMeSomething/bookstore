/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import entities.User;
import infrastructure.database.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class User_Repository {

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

    public boolean addUser(User user) throws SQLException {
        initConnection();

        String sql = "INSERT INTO HE150277_HoangTienMinh_Users (Email, Password, PhoneNum, Salt, Username, Role) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        boolean isInserted;
        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getPhoneNum());
            statement.setString(4, user.getSalt());
            statement.setString(5, user.getUsername());
            statement.setString(6, "USER");

            // if affected row = 0 -> error and will be handle at service
            isInserted = (statement.executeUpdate() > 0);
            disconnect();
            return isInserted;
        }
    }

    public boolean updateUser(User user) throws SQLException {
        initConnection();

        String sql = "UPDATE HE150277_HoangTienMinh_Users SET Email=?, PhoneNum=? "
                + "WHERE Username=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPhoneNum());
            statement.setString(3, user.getUsername());

            boolean isUpdated = statement.executeUpdate() > 0;
            disconnect();
            return isUpdated;
        }
    }

    // get user used for validate login
    public User getUser(String username) throws SQLException {
        initConnection();

        String sql = "SELECT Username, Password, Salt FROM HE150277_HoangTienMinh_Users "
                + "WHERE Username=?";
        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setString(1, username);

        ResultSet result = statement.executeQuery();

        if (result.next()) {
            String password = result.getString("Password");
            String salt = result.getString("Salt");

            result.close();
            disconnect();

            return new User(username, password, salt);
        } else {
            result.close();
            disconnect();

            return null;
        }
    }

    // get user without sensitive data as property
    public User getUserSecure(String username) throws SQLException {
        initConnection();

        String sql = "SELECT Username, Email, PhoneNum FROM HE150277_HoangTienMinh_Users "
                + "WHERE Username=?";
        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setString(1, username);

        ResultSet result = statement.executeQuery();

        if (result.next()) {
            String email = result.getString("email");
            String phoneNum = result.getString("phoneNum");

            result.close();
            // without password and salt (sensitive data)
            return new User(username, "", email, phoneNum, "");
        } else {
            result.close();
            return null;
        }
    }
}
