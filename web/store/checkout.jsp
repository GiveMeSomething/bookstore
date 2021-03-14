<%--
    Document   : checkout
    Created on : Mar 14, 2021, 5:14:38 PM
    Author     : Admin
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Book"%>
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
    </head>
    <body>
        <%
            boolean hasLogin = (session.getAttribute("user") != null);
            if (!hasLogin) {
                response.sendRedirect(request.getContextPath() + "/auth/login");
            }
            session.setAttribute("redirectTo", "/store/checkout.jsp");

            ArrayList<Book> cart = (ArrayList<Book>) session.getAttribute("cart");
            double totalCost = 0.0;
            for (Book book : cart) {
                totalCost += book.getUnitPrice();
            }
        %>
        <c:set var="cartItems" value="${sessionScope.cart}" />
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
        <section id="checkout">
            <div class="container my-5" data-aos="fade-up" data-aos-duration="700">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/store">Cửa hàng sách</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
                    </ol>
                </nav>
                <h2>Thanh toán</h2>
                <c:choose>
                    <c:when test="${empty cartItems}">
                        <div class="row mt-5">
                            <div class="col-12" style="font-size:1.5rem">
                                Giỏ hàng đang trống
                                <a class="link-like-btn" type="button" href="${pageContext.request.contextPath}/store">
                                    Đến cửa hàng sách
                                </a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <form action="${pageContext.request.contextPath}/cart" method="POST" class="mt-5">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col"></th>
                                        <th scope="col">Tên sách</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items='${cartItems}' varStatus="counter" begin="0">
                                        <tr>
                                            <th scope="row">${counter.index + 1}</th>
                                            <td>
                                                <img src="${pageContext.request.contextPath}${item.imageUrl}"
                                                     width="100px">
                                            </td>
                                            <td>${item.bookName}</td>
                                            <td>${item.unitPrice}</td>
                                            <td>
                                                <button name="work"
                                                        value="delete"
                                                        class="btn btn-danger">
                                                    Xóa
                                                </button>
                                                <input name="index" value="${counter.index}" hidden />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <th scope="row">Thành tiền</th>
                                        <td></td>
                                        <td></td>
                                        <td><%=totalCost%></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <form action="${pageContext.request.contextPath}/address"
                              method="GET"
                              class="d-flex justify-content-end mt-5">
                            <button type="submit" class="btn btn-warning">
                                Thanh toán
                            </button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</html>
