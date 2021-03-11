package shippingInfo;

import entities.ShippingInfo;
import entities.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ShippingInfo_Controller", urlPatterns = "/shippingInfo")
public class ShippingInfo_Controller extends HttpServlet {

    private ShippingInfo_Service shippingInfo_Service;

    @Override
    public void init() throws ServletException {
        shippingInfo_Service = new ShippingInfo_Service();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.getShippingInfo(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("request run in POST");
//        String work = (String) request.getAttribute("work");
//        switch (work) {
//            case "add":
//                this.addShippingInfo(request, response);
//                break;
//            case "udapte":
//                this.updateShippingInfo(request, response);
//                break;
//            case "delete":
//                this.deleteShippingInfo(request, response);
//                break;
//            default:
//                response.sendRedirect(request.getContextPath());
//                break;
//        }
    }

    private void addShippingInfo(HttpServletRequest request, HttpServletResponse response) {
        try {
            String city = request.getParameter("city");
            String district = request.getParameter("district");
            String subDistrict = request.getParameter("subDistrict");
            String address = request.getParameter("address");
            String phoneNum = request.getParameter("phoneNum");

            User currentUser = (User) request.getSession().getAttribute("user");

            boolean isAdded = shippingInfo_Service.addShippingAddress(
                    new ShippingInfo(city, district, subDistrict, address, phoneNum),
                    currentUser.getUsername());

            // process base on query result
            if (!isAdded) {
                request.setAttribute("message", this.shippingInfo_Service.getMessage());
                request.getRequestDispatcher(request.getContextPath() + "/user");
            } else {
                response.sendRedirect(request.getContextPath() + "/user");
            }
        } catch (IOException | SQLException e) {
            System.out.println(e.getCause());
        }
    }

    private void getShippingInfo(HttpServletRequest request, HttpServletResponse response) {
        try {
            User currentUser = this.getCurrentUser(request, response);
            ArrayList<ShippingInfo> addressList = this.shippingInfo_Service.getShippingAddress(currentUser.getUsername());

            request.getSession().setAttribute("addressList", addressList);
            response.sendRedirect(request.getContextPath() + "/user/shipping.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateShippingInfo(HttpServletRequest request, HttpServletResponse response) {
        try {
            int shippingInfoId = Integer.parseInt(request.getParameter("shippingInfoId"));
            String city = request.getParameter("city");
            String district = request.getParameter("district");
            String subDistrict = request.getParameter("subDistrict");
            String address = request.getParameter("address");
            String phoneNum = request.getParameter("phoneNum");

            boolean isUpdated = this.shippingInfo_Service.updateShippingAddress(
                    new ShippingInfo(shippingInfoId, city, district, subDistrict, address, phoneNum)
            );

            if (!isUpdated) {
                request.setAttribute("message", this.shippingInfo_Service.getMessage());
                request.getRequestDispatcher(request.getContextPath() + "/user");
            } else {
                response.sendRedirect(request.getContextPath() + "/user");
            }
        } catch (IOException | SQLException e) {
            System.out.println(e.getCause());
        }
    }

    private void deleteShippingInfo(HttpServletRequest request, HttpServletResponse response) {
        try {
            int shippingInfoId = Integer.parseInt(request.getParameter("shippingInfoId"));
            boolean isDeleted = shippingInfo_Service.deleteShippingAddress(shippingInfoId);

            if (!isDeleted) {
                request.setAttribute("message", this.shippingInfo_Service.getMessage());
                request.getRequestDispatcher(request.getContextPath() + "/user");
            } else {
                response.sendRedirect(request.getContextPath() + "/user");
            }
        } catch (IOException | SQLException e) {
            System.out.println(e.getCause());
        }
    }

    private User getCurrentUser(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        try {
            if (currentUser == null) {
                response.sendRedirect(request.getContextPath() + "/auth/login");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return currentUser;
    }
}
