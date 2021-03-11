<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entities.address.SubDistrict"%>
<%@page import="entities.address.District"%>
<%@page import="entities.address.City"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/style/main-page-style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/style/user-menu-item.css" rel="stylesheet">
    </head>
    <body>
        <%
            boolean hasLogin = (session.getAttribute("user") != null);
            if (!hasLogin) {
                response.sendRedirect(request.getContextPath() + "/auth/login");
            }
        %>
        <c:set var="cityList" value="${sessionScope.cityList}" />
        <c:set var="districtList" value="${sessionScope.districtList}" />
        <c:set var="subDistrictList" value="${sessionScope.subDistrictList}" />
        <div class="container mt-5">
            <h2>Thêm địa chỉ</h2>
            <form action="${pageContext.request.contextPath}/shippingInfo"
                  method="POST"
                  class="needs-validation mt-5"
                  novalidate>
                <div class="row" gaps="2">
                    <div class="col-4 px-2">
                        <label for="">Thành phố</label>
                        <select class="form-select mt-2" id="citySelect" name="city">
                            <c:forEach var="city" items="${cityList}" begin="0" varStatus="counter">
                                <option value="${counter.index}">${city.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-4 px-2">
                        <label for="">Quận</label>
                        <select class="form-select mt-2" id="districtSelect" name="district">
                            <c:forEach var="district" items="${districtList}" begin="0" varStatus="counter">
                                <option value="${counter.index}">${district.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-4 px-2">
                        <label for="">Phường</label>
                        <select class="form-select mt-2" id="subDistrictSelect" name="subDistrict">
                            <c:forEach var="subDistrict" items="${subDistrictList}" begin="0" varStatus="counter">
                                <option value="${counter.index}">${subDistrict.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row d-flex align-items-center mt-3" gaps="2">
                    <div class="col-6">
                        <label for="address">Địa chỉ nhận hàng: </label>
                        <input
                            class="form-control mt-2"
                            id="address"
                            type="text"
                            placeholder="số nhà, phố, ..."
                            name="address"
                            required
                            maxlength="200"
                            data-value-missing="Trường này không được bỏ trống"
                            data-tooLong="Địa chỉ không được dài quá 200 kí tự"/>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="col-6">
                        <label for="editPhone">Số điện thoại: </label>
                        <input
                            class="form-control mt-2"
                            id="editPhone"
                            type="text"
                            placeholder="Số điện thoại"
                            value="${phoneNum}"
                            name="phoneNum"
                            required
                            pattern="^\d{10}$"
                            data-value-missing="Trường này không được bỏ trống"
                            data-pattern-mismatch="Số điện thoại không hợp lệ"/>
                        <div class="invalid-feedback"></div>
                    </div>
                </div>
                <c:if test="${not empty requestScope.message}">
                    <h5 class="my-2">${requestScope.messaage}></h5>
                </c:if>
                <div class="row d-flex align-items-center">
                    <div class="col-12 mt-3 d-flex align-items-center justify-content-end">
                        <a href="${pageContext.request.contextPath}/user/shipping.jsp" class="mx-2">
                            <button class="btn btn-danger d-flex" type="button">
                                Hủy
                            </button>
                        </a>
                        <button class="btn btn-primary d-flex" type="submit" name="work" value="add">
                            Lưu thông tin
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="${pageContext.request.contextPath}/controller/validation.js"></script>
    <script>
        AOS.init();
    </script>
</html>
