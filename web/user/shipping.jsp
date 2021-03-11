<%@page import="java.util.List"%>
<%@page import="entities.ShippingInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/style/main-page-style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/style/user-menu-style.css" rel="stylesheet">
    </head>
    <body>
        <!--Navbar will be put here-->
        <%
            boolean hasLogin = (session.getAttribute("user") != null);
            if (!hasLogin) {
                response.sendRedirect(request.getContextPath() + "/auth/login");
            }
        %>
        <c:set var="addressList" value='${sessionScope.addressList}' />
        <div class="container my-5" data-aos="fade-up" data-aos-duration="1000">
            <h2>Sổ địa chỉ</h2>
            <c:choose>
                <c:when test="${empty addressList}">
                    <div class="row mt-5">
                        <div class="col-12" style="font-size:1.5rem">
                            Danh sách địa chỉ đang trống.
                            <a class="link-like-btn" type="button" href="${pageContext.request.contextPath}/user/shipping/add.jsp">
                                Thêm ngay
                            </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action="${pageContext.request.contextPath}" method="POST">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">STT</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="address" items='${addressList}' varStatus="counter">
                                    <tr>
                                        <th scope="row">${counter.index}</th>
                                        <td>${address.getFullAddress()}</td>
                                        <td>${address.phoneNum}</td>
                                        <td>
                                            <button type="submit" name="shipping-info-action" value="update" class="btn btn-primary">
                                                Sửa
                                            </button>
                                            <button type="submit" name="shipping-info-action" value="delete" class="btn btn-danger">
                                                Xóa
                                            </button>
                                        </td>
                                        <td>${address}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/controller/validation.js"></script>
    <script>
        AOS.init();
    </script>
</html>
