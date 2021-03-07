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
public class ShippingAddress {

    private String city;
    private String district;
    private String subDistrict;
    private String address;
    private String phoneNum;
    private String receiver;

    public ShippingAddress(String city, String district, String subDistrict, String address, String phoneNum) {
        this.city = city;
        this.district = district;
        this.subDistrict = subDistrict;
        this.address = address;
        this.phoneNum = phoneNum;
        this.receiver = receiver;
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

    public String getReceiver() {
        return receiver;
    }

    public String getFullAddress() {
        return this.address + ", " + this.subDistrict + ", " + this.district + ", " + this.city;
    }

}
