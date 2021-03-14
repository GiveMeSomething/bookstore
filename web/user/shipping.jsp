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
        <%
            boolean hasLogin = (session.getAttribute("user") != null);
            if (!hasLogin) {
                response.sendRedirect(request.getContextPath() + "/auth/login");
            }
            session.setAttribute("redirectTo", "/user/shipping/add.jsp");
        %>
        <c:set var="addressList" value='${sessionScope.addressList}' />
        <section id="navbar">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <img src="${pageContext.request.contextPath}/assets/logo.jpg" role="presentation" style="height: 4rem; width: auto;"/>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse d-flex justify-content-md-end" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <div class="d-flex d-grid gap-4 align-items-center">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}" class="text-decoration-none">
                                        <button type="button"
                                                class="nav-link active btn btn-link  navbar-button">
                                            Trang chủ
                                        </button>
                                    </a>

                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/store" class="text-decoration-none">
                                        <button type="button"
                                                class="nav-link active btn btn-link navbar-button">
                                            Cửa hàng
                                        </button>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/forum" class="text-decoration-none">
                                        <button type="button"
                                                class="nav-link active btn btn-link navbar-button">
                                            Forum
                                        </button>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}" class=" text-decoration-none">
                                        <button
                                            type="button"
                                            class="nav-link active btn btn-link navbar-button">
                                            Sự kiện
                                        </button>
                                    </a>
                                </li>
                                <c:choose>
                                    <c:when test="<%=hasLogin%>">
                                        <div class="dropdown">
                                            <button class="nav-link active btn btn-link
                                                    text-decoration-none navbar-button d-flex align-items-center"
                                                    type="button" id="user-dropdown"
                                                    data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                <img src="${pageContext.request.contextPath}/assets/avatar.png"
                                                     height="40px" width="40px"/>
                                                ${sessionScope.user.username}
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="user-dropdown">
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user">Trang cá nhân</a></li>
                                                <li><a class="dropdown-item" href="#">Giỏ hàng</a></li>
                                                <hr class="p-0 m-0 my-1"/>
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/auth?signout=1">Đăng xuất</a></li>
                                            </ul>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/auth/register" class="navbar-link">
                                                <button
                                                    type="button"
                                                    class="nav-link active btn btn-link text-decoration-none navbar-button">
                                                    Đăng kí
                                                </button>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/auth/login" class="navbar-link">
                                                <button
                                                    type="button"
                                                    class="nav-link active btn btn-link text-decoration-none navbar-button">
                                                    Đăng nhập
                                                </button>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </ul>
                    </div>
                </nav>
            </div>
        </section>
        <div class="container my-5" data-aos="fade-up" data-aos-duration="700">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/user">Thông tin người dùng</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Địa chỉ giao hàng</li>
                </ol>
            </nav>
            <h2>Sổ địa chỉ</h2>
            <c:choose>
                <c:when test="${empty addressList}">
                    <div class="row mt-5">
                        <div class="col-12" style="font-size:1.5rem">
                            Danh sách địa chỉ đang trống.
                            <a class="link-like-btn" type="button" href="${pageContext.request.contextPath}/address">
                                Thêm ngay
                            </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action="${pageContext.request.contextPath}/shippingInfo" method="POST" class="mt-5">
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
                                        <th scope="row">${counter.index + 1}</th>
                                        <td>${address.getFullAddress()}</td>
                                        <td>${address.phoneNum}</td>
                                        <td>
                                            <button type="submit"
                                                    name="work"
                                                    value="delete"
                                                    class="btn btn-danger">
                                                Xóa
                                            </button>
                                            <input type="text" name="shippingInfoId" value="${address.shippingInfoId}" hidden />
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </form>
                    <form action="${pageContext.request.contextPath}/address"
                          method="GET"
                          class="d-flex justify-content-end mt-5">
                        <button type="submit" class="btn btn-warning">
                            + Thêm địa chỉ
                        </button>
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
