/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import entities.User;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class Auth_Service {

    private final Auth_Repository auth_Repository;
    private String message;

    public Auth_Service() {
        this.auth_Repository = new Auth_Repository();
        this.message = "";
    }

    public boolean login(User user) throws SQLException {
        boolean success = auth_Repository.login(user);
        if (!success) {
            this.message = "Sai tên đăng nhập hoặc mật khẩu.";
        }
        return success;
    }

    public boolean register(User user) throws SQLException {
        boolean success = auth_Repository.register(user);
        if (!success) {
            this.message = "Tên đăng nhập đã trùng. Vui lòng chọn lại";
        }
        return success;
    }

    public User getUser(String username) throws SQLException {
        return auth_Repository.getUserSecure(username);
    }

    public String getMessage() {
        return message;
    }

}
