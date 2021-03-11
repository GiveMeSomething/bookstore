package entities.address;

public class District {

    private int districtId;
    private String districtName;
    private int cityId;

    public District() {
    }

    public District(int districtId, String districtName, int cityId) {
        this.districtId = districtId;
        this.districtName = districtName;
        this.cityId = cityId;
    }

    public int getDistrictId() {
        return districtId;
    }

    public String getDistrictName() {
        return districtName;
    }

    public int getCityId() {
        return cityId;
    }

}
