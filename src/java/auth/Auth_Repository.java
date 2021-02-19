/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package auth;

import entities.User;
import infrastructure.database.DBContext;
import java.sql.Connection;
import java.util.Random;

/**
 *
 * @author Admin
 */
public class Auth_Repository {

    private Connection connection;
    private String status;

    public Auth_Repository() {
        initConnection();
    }

    private void initConnection() {
        try {
            connection = new DBContext().getConnection();
            this.status = "OK";
        } catch (Exception e) {
            this.status = "Error " + e.getMessage();
        }
    }

    public void login(String username, String password) {

    }

    public void register(String username, String password, String email, String phoneNum) {
        Random rand = new Random();

        String salt = Integer.toString(rand.nextInt(90) + 9);

        User user = new User(username, password, email, phoneNum, salt);

    }

    private boolean checkDuplicateUsername(String username) {

    }
}
