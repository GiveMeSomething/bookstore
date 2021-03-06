/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import entities.User;
import infrastructure.database.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import utility.HashPassword;

/**
 *
 * @author Admin
 */
public class Auth_Repository {

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

    public boolean login(User user) throws SQLException {
        initConnection();

        String username = user.getUsername();
        String password = user.getPassword();

        User loginUser = getUser(username);
        if (loginUser == null) {
            disconnect();
            return false;
        } else {
            disconnect();
            return HashPassword.validatePassword(loginUser.getPassword(), loginUser.getSalt(), password);
        }
    }

    public boolean register(User user) throws SQLException {
        initConnection();

        String username = user.getUsername();
        String password = user.getPassword();
        String email = user.getEmail();
        String phoneNum = user.getPhoneNum();

        if (isDuplicateUsername(username)) {
            disconnect();
            return false;
        } else {
            Random rand = new Random();

            String salt = Integer.toString(rand.nextInt(90) + 9);
            String hashPassword = HashPassword.getHashPassword(password, salt);

            return addUser(new User(username, hashPassword, email, phoneNum, salt));
        }
    }

    private boolean addUser(User user) throws SQLException {
        initConnection();

        String sql = "INSERT INTO HE150277_HoangTienMinh_Users (Email, Password, PhoneNum, Salt, Username, Role) VALUES (?, ?, ?, ?, ?, ?)";
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
        }
        return isInserted;
    }

    public User getUser(String username) throws SQLException {
        initConnection();

        String sql = "SELECT Username, Password, Salt FROM HE150277_HoangTienMinh_Users WHERE Username=?";
        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setString(1, username);

        ResultSet result = statement.executeQuery();

        if (result.next()) {
            String password = result.getString("Password");
            String salt = result.getString("Salt");
            result.close();
            return new User(username, password, salt);
        } else {
            result.close();
            return null;
        }
    }

    private boolean isDuplicateUsername(String username) throws SQLException {
        String sql = "SELECT Username FROM HE150277_HoangTienMinh_Users WHERE Username=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);

        // ResultSet return by executeQuery is empty or not
        // read more about ResultSet.next()
        return statement.executeQuery().next();
    }
}
