<%--
    Document   : index
    Created on : Mar 12, 2021, 11:40:03 PM
    Author     : Admin
--%>

<%@page import="entities.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entities.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/style/main-page-style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/style/bookstore-page-style.css" rel="stylesheet">
    </head>
    <body>
        <%
            if (session.getAttribute("bookList") == null || session.getAttribute("cart") == null) {
                response.sendRedirect(request.getContextPath() + "/books");
            }

            User currentUser = (User) session.getAttribute("user");
            String username;
            boolean hasLogin = (currentUser != null);
            if (hasLogin) {
                username = currentUser.getUsername();
            }
        %>
        <c:set var="bookList" value="${sessionScope.bookList}"/>
        <c:set var="categoryList" value="${sessionScope.categoryList}"/>
        <c:set var="cart" value="${sessionScope.cart}" />
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
                                            href="${pageContext.request.contextPath}">
                                        Trang chủ
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button type="button"
                                            class="nav-link active btn btn-link text-decoration-none navbar-button"
                                            href="${pageContext.request.contextPath}/store">
                                        Cửa hàng
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button type="button"
                                            class="nav-link active btn btn-link text-decoration-none navbar-button"
                                            href="${pageContext.request.contextPath}/forum">
                                        Forum
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button
                                        type="button"
                                        class="nav-link active btn btn-link text-decoration-none navbar-button"
                                        href="${pageContext.request.contextPath}/event">
                                        Sự kiện
                                    </button>
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
                                            <a href="auth/register" class="navbar-link">
                                                <button
                                                    type="button"
                                                    class="nav-link active btn btn-link text-decoration-none navbar-button">
                                                    Đăng kí
                                                </button>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="auth/login" class="navbar-link">
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
        <div class="container my-3">
            <div class="row">
                <div class="d-flex justify-content-end">
                    <a href="${pageContext.request.contextPath}/cart">
                        <button class="btn btn-primary">
                            Giỏ hàng (${cart.size()})
                        </button>
                    </a>
                </div>
            </div
        </div>
        <section id="bookstore">
            <form action="${pageContext.request.contextPath}/books"  method="POST">
                <div class="container-fluid">
                    <h2 class="text-center mt-5">Cửa hàng sách</h2>
                    <div class="row py-5 g-0">
                        <div class="col-8 mx-auto">
                            <div class="input-group">
                                <input type="text" class="form-control"
                                       name="keyword"
                                       placeholder="Nhập từ khóa cần tìm kiếm"
                                       autocomplete="off"/>
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row g-0">
                        <div class="col-3">
                            <div class="px-5">
                                <div class="py-2">
                                    <h4>Thể loại</h4>
                                    <c:forEach var="category" items="${categoryList}">
                                        <div class="form-check my-3 type-checkbox">
                                            <input class="form-check-input"
                                                   type="checkbox"
                                                   name="tag"
                                                   value="${category.categoryId}"
                                                   id="${category.categoryId}"
                                                   ${category.isChecked ? "checked": ""}>
                                            <label class="form-check-label" for="${category.categoryId}">
                                                ${category.categoryName}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                                <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="row g-0">
                                <c:forEach var="book" items="${bookList}">
                                    <div class="d-flex align-items-center col-3">
                                        <div class="card" style="width: 18rem; border: 0;">
                                            <img src="${pageContext.request.contextPath}${book.imageUrl}" class="card-img-top image-with-cover">
                                            <div class="image-with-cover-hover-content d-flex flex-column align-items-center justify-content-center">
                                                <a href="product?id=${book.bookId}">
                                                    <button type="button" class="btn btn-info my-1">Xem thêm</button>
                                                </a>
                                                <a href="/${pageContext.request.contextPath}/cart?id=${book.bookId}">
                                                    <button type="button" class="btn btn-primary">Mua ngay</button>
                                                </a>
                                            </div>
                                            <div class="card-body text-center">
                                                <h5 class="card-title">${book.bookName}</h5>
                                                <p><em>$${book.unitPrice}</em></p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
            </form>
        </section>
    </body>
</html>
