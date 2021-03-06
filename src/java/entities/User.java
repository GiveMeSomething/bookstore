/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Admin
 */
public class User {

    private String username;
    private String password;
    private String email;
    private String phoneNum;
    private String salt;
    private String role = "USER";

    public User() {

    }

    // Use when login
    public User(String username, String password, String salt) {
        this.username = username;
        this.password = password;
        this.salt = salt;

        this.email = "";
        this.phoneNum = "";
    }

    // Use when register
    public User(String username, String password, String email, String phoneNum) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNum = phoneNum;

        this.salt = "";
    }

    // Use when adding entry into db
    public User(String username, String password, String email, String phoneNum, String salt) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNum = phoneNum;
        this.salt = salt;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public String getSalt() {
        return salt;
    }
}
