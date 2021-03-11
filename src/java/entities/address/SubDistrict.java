package entities.address;

public class SubDistrict {

    private int subDistrictId;
    private String sudDistrictName;
    private int districtId;

    public SubDistrict() {
    }

    public SubDistrict(int subDistrictId, String sudDistrictName, int districtId) {
        this.subDistrictId = subDistrictId;
        this.sudDistrictName = sudDistrictName;
        this.districtId = districtId;
    }

    public int getSubDistrictId() {
        return subDistrictId;
    }

    public String getSudDistrictName() {
        return sudDistrictName;
    }

    public int getDistrictId() {
        return districtId;
    }

}
