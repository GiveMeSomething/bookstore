package entities.address;

public class SubDistrict {

    private int id;
    private String name;
    private int districtId;

    public SubDistrict() {
    }

    public SubDistrict(int id, String name, int districtId) {
        this.id = id;
        this.name = name;
        this.districtId = districtId;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getDistrictId() {
        return districtId;
    }

}
