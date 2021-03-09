/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shippingAddr;

import entities.ShippingAddress;
import infrastructure.database.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Shipping_Repository {

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

    public boolean addShippingAddress(ShippingAddress address, String userId) throws SQLException {
        initConnection();

        String sql = "INSERT INTO HE150277_HoangTienMinh_ShippingAddress (UserId, ThanhPho, Quan, Phuong, DiaChi, Receiver, PhoneNum) VALUES (?, ?, ?, ?, ?, ?, ?)";

        boolean isInserted;
        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, userId);
            statement.setString(2, address.getCity());
            statement.setString(3, address.getDistrict());
            statement.setString(4, address.getSubDistrict());
            statement.setString(5, address.getAddress());
            statement.setString(6, address.getReceiver());
            statement.setString(7, address.getPhoneNum());

            // if affected row = 0 -> error and will be handle at service
            isInserted = (statement.executeUpdate() > 0);
        }
        return isInserted;
    }

    public ShippingAddress[] getShippingAddress(String userId) {
        initConnection();

        ArrayList<ShippingAddress> addresses = new ArrayList<>();
        String sql = "SELECT (DiaChi + ' ' + Phuong + ' ' + Quan + ' ' + ThanhPho) AS [ShippingAddr], Receiver, PhoneNum \n"
                + "FROM HE150277_HoangTienMinh_ShippingInfo\n"
                + "WHERE UserId = ?;";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, userId);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                addresses.add(new ShippingAddress(sql, userId, userId, userId, userId))
            }
        }
    }

}
