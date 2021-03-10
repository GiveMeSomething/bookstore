/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shippingInfo;

import entities.ShippingInfo;
import entities.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ShippingInfo_Controller extends HttpServlet {

    private ShippingInfo_Service shippingInfo_Service;

    @Override
    public void init() throws ServletException {
        shippingInfo_Service = new ShippingInfo_Service();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // process 4 work type (add, fetch, update, delete)

        String work = (String) request.getAttribute("work");
        switch (work) {
            case "add":
                this.addShippingInfo(request, response);
                break;
            case "fetch":
                this.getShippingInfo(request, response);
                break;
            case "udapte":
                this.updateShippingInfo(request, response);
                break;
            case "delete":
                this.deleteShippingInfo(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath());
                break;
        }
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
            String username = request.getParameter("username");
            ArrayList<ShippingInfo> addressList = this.shippingInfo_Service.getShippingAddress(username);

            request.setAttribute("addressList", addressList);
            request.getRequestDispatcher(request.getContextPath() + "/user").forward(request, response);

        } catch (ServletException | IOException | SQLException e) {
            System.out.println(e.getCause());
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
}
