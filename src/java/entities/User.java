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

    public User() {

    }

    public User(String username, String password, String salt) {
        this.username = username;
        this.password = password;
        this.salt = salt;
    }

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

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

}
