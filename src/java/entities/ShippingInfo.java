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
public class ShippingInfo {

    private int shippingInfoId;
    private String city;
    private String district;
    private String subDistrict;
    private String address;
    private String phoneNum;

    public ShippingInfo(int shippingInfoId, String city, String district, String subDistrict, String address, String phoneNum) {
        this.shippingInfoId = shippingInfoId;
        this.city = city;
        this.district = district;
        this.subDistrict = subDistrict;
        this.address = address;
        this.phoneNum = phoneNum;
    }

    public int getShippingInfoId() {
        return shippingInfoId;
    }

    public String getCity() {
        return city;
    }

    public String getDistrict() {
        return district;
    }

    public String getSubDistrict() {
        return subDistrict;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public String getFullAddress() {
        return address + ", " + subDistrict + ", " + district + ", " + city;
    }
}
