package address;

import entities.address.City;
import entities.address.District;
import entities.address.SubDistrict;
import java.sql.SQLException;
import java.util.ArrayList;

public class Address_Service {

    private final Address_Repository address_Repository;

    public Address_Service() {
        this.address_Repository = new Address_Repository();
    }

    public ArrayList<City> getCity() {
        ArrayList<City> cityList;
        try {
            cityList = this.address_Repository.getCity();
            return cityList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<District> getDistrict() {
        ArrayList<District> districtList;
        try {
            districtList = this.address_Repository.getDistrict();
            return districtList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<SubDistrict> getSubDistricts() {
        ArrayList<SubDistrict> subDistrictList;
        try {
            subDistrictList = this.address_Repository.getSubDistricts();
            return subDistrictList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
