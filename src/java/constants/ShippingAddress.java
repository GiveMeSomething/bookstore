/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package constants;

import infrastructure.database.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class ShippingAddress {

    HashMap<String, String> cities;
    HashMap<String, ArrayList<String>> districts;
    HashMap<String, ArrayList<String>> subDistricts;

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

    public String[] getCityList() {
        return new String[]{};
    }

    public String[] getDistrictList(String cityId) {
        return new String[]{};
    }

    public String[] getSubDistrictList(String districtId) {
        return new String[]{};
    }

    private void getCities() throws SQLException {
        initConnection();

        String sql = "SELECT CityName FROM HE150277_HoangTienMinh_City";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                cities.put(result.getString("CityId"), result.getString("CityName"));
            }
        }

        disconnect();
    }

    private void getDistricts(String cityId) {
        initConnection();
        String sql = "";

        // read db here
        disconnect();
    }

    private void getSubDistrict(String districtId) {
        initConnection();
        String sql = "";

        // read db here
        disconnect();
    }
}
