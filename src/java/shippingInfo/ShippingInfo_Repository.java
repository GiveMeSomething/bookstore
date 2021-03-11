package shippingInfo;

import entities.ShippingInfo;
import infrastructure.database.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShippingInfo_Repository {

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

    public boolean addShippingAddress(ShippingInfo shippingInfo, String username) throws SQLException {
        initConnection();

        String sql = "INSERT INTO HE150277_HoangTienMinh_ShippingAddress (UserId, ThanhPho, Quan, Phuong, DiaChi, Receiver, PhoneNum) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        boolean isInserted;
        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, userId);
            statement.setString(2, shippingInfo.getCity());
            statement.setString(3, shippingInfo.getDistrict());
            statement.setString(4, shippingInfo.getSubDistrict());
            statement.setString(5, shippingInfo.getAddress());
            statement.setString(7, shippingInfo.getPhoneNum());

            // if affected row = 0 -> error and will be handle at service
            isInserted = (statement.executeUpdate() > 0);
        }
        return isInserted;
    }

    public ArrayList<ShippingInfo> getShippingAddress(String username) throws SQLException {
        initConnection();

        ArrayList<ShippingInfo> addressList = new ArrayList<>();
        String sql = "SELECT si.DiaChi, si.Phuong, si.Quan, si.ThanhPho, si.PhoneNum, si.ShippingInfoId\n"
                + "FROM HE150277_HoangTienMinh_ShippingInfo si INNER JOIN HE150277_HoangTienMinh_Users u\n"
                + "ON si.UserId = u.UserId\n"
                + "WHERE u.Username = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                addressList.add(new ShippingInfo(
                        result.getInt("ShippingInfoId"),
                        result.getString("ThanhPho"),
                        result.getString("Quan"),
                        result.getString("Phuong"),
                        result.getString("DiaChi"),
                        result.getString("PhoneNum")
                ));
            }
            return addressList;
        }
    }

    public boolean updateShippingAddress(ShippingInfo shippingInfo) throws SQLException {
        initConnection();

        String sql = "UPDATE HE150277_HoangTienMinh_ShippingInfo\n"
                + "SET ThanhPho = ?, Quan = ?, Phuong = ?, DiaChi = ?, PhoneNum = ?\n"
                + "WHERE ShippingInfoId = ?";

        boolean isUpdated;
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, shippingInfo.getCity());
            statement.setString(2, shippingInfo.getDistrict());
            statement.setString(3, shippingInfo.getSubDistrict());
            statement.setString(4, shippingInfo.getAddress());
            statement.setString(5, shippingInfo.getPhoneNum());
            statement.setInt(6, shippingInfo.getShippingInfoId());

            isUpdated = statement.executeUpdate() > 0;
            disconnect();
            return isUpdated;
        }
    }

    public boolean deleteShippingAddress(int shippingInfoId) throws SQLException {
        initConnection();

        String sql = "DELETE FROM HE150277_HoangTienMinh_ShippingInfo WHERE ShippingInfoId = ?";

        boolean isDeleted;
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, shippingInfoId);

            isDeleted = statement.executeUpdate() > 0;
            disconnect();
            return isDeleted;
        }
    }

}
