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
import java.sql.SQLException;
import java.util.Random;
import users.User_Repository;
import utility.HashPassword;

/**
 *
 * @author Admin
 */
public class Auth_Repository {

    private final User_Repository user_Repository;

    private Connection connection;

    public Auth_Repository() {
        this.user_Repository = new User_Repository();
    }

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

        User loginUser = user_Repository.getUser(username);
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

            return user_Repository.addUser(new User(username, hashPassword, email, phoneNum, salt));
        }
    }

    public User getUser(String username) throws SQLException {
        return this.user_Repository.getUserSecure(username);
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
