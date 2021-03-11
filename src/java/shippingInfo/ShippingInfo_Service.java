package shippingInfo;

import entities.ShippingInfo;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShippingInfo_Service {

    private final ShippingInfo_Repository shipping_Repository;
    private String message;

    public ShippingInfo_Service() {
        this.shipping_Repository = new ShippingInfo_Repository();
    }

    public boolean addShippingAddress(ShippingInfo shippingInfo, String username) throws SQLException {
        boolean isAdded = this.shipping_Repository.addShippingAddress(shippingInfo, username);
        if (!isAdded) {
            this.message = "Thêm địa chỉ thất bại. Vui lòng thử lại sau.";
        }
        return isAdded;
    }

    public ArrayList<ShippingInfo> getShippingAddress(String username) throws SQLException {
        return this.shipping_Repository.getShippingAddress(username);
    }

    public boolean updateShippingAddress(ShippingInfo shippingInfo) throws SQLException {
        boolean isUpdated = this.shipping_Repository.updateShippingAddress(shippingInfo);
        if (!isUpdated) {
            this.message = "Cập nhập địa chỉ thất bại.";
        }
        return isUpdated;
    }

    public boolean deleteShippingAddress(int shippingInfoId) throws SQLException {
        boolean isDeleted = this.shipping_Repository.deleteShippingAddress(shippingInfoId);
        if (!isDeleted) {
            this.message = "Xóa địa chỉ thất bại";
        }
        return isDeleted;
    }

    public String getMessage() {
        return message;
    }
}
