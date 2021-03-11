package address;

import entities.address.City;
import entities.address.District;
import entities.address.SubDistrict;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Address_Controller", urlPatterns = {"/address"})
public class Address_Controller extends HttpServlet {

    private Address_Service address_Service;

    @Override
    public void init() throws ServletException {
        address_Service = new Address_Service();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        ArrayList<City> cityList = (ArrayList<City>) session.getAttribute("cityList");
        ArrayList<District> districtList = (ArrayList<District>) session.getAttribute("districtList");
        ArrayList<SubDistrict> subDistrictList = (ArrayList<SubDistrict>) session.getAttribute("subDistrictList");

        if (cityList == null || districtList == null || subDistrictList == null) {
            cityList = this.address_Service.getCity();
            districtList = this.address_Service.getDistrict();
            subDistrictList = this.address_Service.getSubDistricts();

            session.setAttribute("cityList", cityList);
            session.setAttribute("districtList", districtList);
            session.setAttribute("subDistrictList", subDistrictList);
        }
        String redirectTo = (String) session.getAttribute("redirectTo");
        if (redirectTo == null) {
            response.sendRedirect(request.getContextPath());
        } else {
            response.sendRedirect(request.getContextPath() + redirectTo);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
