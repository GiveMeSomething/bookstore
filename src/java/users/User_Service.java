/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import entities.User;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class User_Service {

    private final User_Repository user_Repository;
    private String message;

    public User_Service() {
        this.user_Repository = new User_Repository();
    }

    public boolean updateUser(User user) throws SQLException {
        boolean success = user_Repository.updateUser(user);

        if (!success) {
            this.message = "Có lỗi khi thay đổi thông tin. Vui lòng thử lại sau.";
        }

        return success;
    }

    public User getUser(String username) throws SQLException {
        return this.user_Repository.getUserSecure(username);
    }

    public String getMessage() {
        return message;
    }
}
