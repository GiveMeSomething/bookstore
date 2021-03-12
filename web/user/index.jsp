<%@page import="entities.ShippingInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:set var="email" value='${sessionScope.user.email}' />
        <c:set var="phoneNum" value="${sessionScope.user.phoneNum}" />
        <c:set var="username" value="${sessionScope.user.username}" />
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
                                    <button type="button"
                                            class="nav-link active btn btn-link text-decoration-none navbar-button"
                                            href="#">
                                        Trang chủ
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button type="button"
                                            class="nav-link active btn btn-link text-decoration-none navbar-button"
                                            href="store">
                                        Cửa hàng
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button type="button"
                                            class="nav-link active btn btn-link text-decoration-none navbar-button"
                                            href="forum">
                                        Forum
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button
                                        type="button"
                                        class="nav-link active btn btn-link text-decoration-none navbar-button"
                                        href="event">
                                        Sự kiện
                                    </button>
                                </li>
                                <c:choose>
                                    <c:when test='<%=hasLogin%>'>
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
                    <li class="breadcrumb-item active">Thông tin người dùng</li>
                </ol>
            </nav>
            <div class="row">
                <div class="col-4">
                    <div class="d-flex flex-column justify-content-center align-items-center">
                        <img src='${pageContext.request.contextPath}/assets/avatar.png' role='presentation'/>
                        <h3>${username}</h3>
                    </div>
                </div>
                <div class="col-8 justify-content-center mt-5">
                    <c:choose>
                        <c:when test="${param.editInfo}">
                            <form action="${pageContext.request.contextPath}/user_controller"
                                  method="POST"
                                  class="needs-validation"
                                  novalidate>
                                <div class="row d-flex align-items-center">
                                    <div class="col-6 m-2">
                                        <label for="editEmail">Email:</label>
                                        <input
                                            class="form-control mt-2"
                                            id="editEmail"
                                            type="email"
                                            placeholder="Email"
                                            value="${email}"
                                            name="email"
                                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}"
                                            required
                                            data-value-missing="Trường này không được bỏ trống"
                                            data-pattern-mismatch="Email không hợp lệ"
                                            />
                                        <div class="invalid-feedback"></div>
                                    </div>
                                    <div class="col-6 m-2">
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
                                <div class="row d-flex align-items-center">
                                    <div class="col-12 m-2">
                                        <button class="btn btn-primary d-flex" type="submit">
                                            Lưu thông tin
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <div class="row">
                                <div class="col-5">
                                    <h4>Email:</h4>
                                    <h5>${email}</h5>
                                </div>
                                <div class="col-5">
                                    <h4>Số điện thoại:</h4>
                                    <h5>${phoneNum}</h5>
                                </div>
                                <div class="col-2 d-flex align-items-center justify-content-center">
                                    <form action="${pageContext.request.contextPath}/user" method="GET">
                                        <button class="btn btn-primary d-flex" type="submit" name="editInfo" value="true">
                                            Sửa thông tin
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="row mt-5">
                        <div class="col-12">
                            <a href="${pageContext.request.contextPath}/shippingInfo" class="user-menu-item py-2"><h4 class="d-inline-block">Sổ địa chỉ</h4></a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <a href="${pageContext.request.contextPath}/user/orders.jsp" class="user-menu-item py-2"><h4 class="d-inline-block">Đơn hàng của tôi</h4></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="${pageContext.request.contextPath}/controller/validation.js"></script>
    <script>
        AOS.init();
    </script>
</html>
