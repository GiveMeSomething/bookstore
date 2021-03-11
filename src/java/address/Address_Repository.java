/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package address;

import entities.address.City;
import entities.address.District;
import entities.address.SubDistrict;
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
public class Address_Repository {

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

    public ArrayList<City> getCity() throws SQLException {
        initConnection();

        String sql = "SELECT CityId, CityName FROM HE150277_HoangTienMinh_City";
        ArrayList<City> cityList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                cityList.add(new City(
                        result.getInt("CityId"),
                        result.getString("CityName")
                ));
            }

            disconnect();
            return cityList;
        }
    }

    public ArrayList<District> getDistrict() throws SQLException {
        initConnection();

        String sql = "SELECT DistrictId, DistrictName, CityId FROM HE150277_HoangTienMinh_District";
        ArrayList<District> districtList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                districtList.add(new District(
                        result.getInt("DistrictId"),
                        result.getString("DistrictName"),
                        result.getInt("CityId")
                ));
            }

            disconnect();
            return districtList;
        }
    }

    public ArrayList<SubDistrict> getSubDistricts() throws SQLException {
        initConnection();

        String sql = "SELECT SubDistrictId, SubDistrictName, DistrictId FROM HE150277_HoangTienMinh_SubDistrict";
        ArrayList<SubDistrict> subDistrictList = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                subDistrictList.add(new SubDistrict(
                        result.getInt("SubDistrictId"),
                        result.getString("SubDistrictName"),
                        result.getInt("DistrictId")
                ));
            }

            disconnect();
            return subDistrictList;
        }
    }
}
