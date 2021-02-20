/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

/**
 *
 * @author Admin
 */
public class HashPassword {

    public static String getHashPassword(String password, String salt) {
        StringBuilder builder = new StringBuilder(Integer.toString(password.hashCode()));

        builder.insert(builder.length() / 2, salt);

        return builder.toString();
    }

    public static boolean validatePassword(String password, String salt, String inputPassword) {
        return password.equals(getHashPassword(inputPassword, salt));
    }

    public static void main(String[] args) {
        System.out.println(getHashPassword("damlan", "20"));
    }
}
