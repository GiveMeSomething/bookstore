<%--
    Document   : index
    Created on : Mar 13, 2021, 4:40:05 PM
    Author     : Admin
--%>

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
    </head>
    <body>
        <%
            User currentUser = (User) session.getAttribute("user");
            String username;
            boolean hasLogin = (currentUser != null);
            if (hasLogin) {
                username = currentUser.getUsername();
            }
        %>
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
        <div class="container">
            <h1 class="text-center  my-5">Forum review sách</h1>
            <div class="row">
                <div class="col-4 py-1" data-aos="fade-eight">
                    <div class="card" style="width: 100%">
                        <img src="${pageContext.request.contextPath}/assets/sample-book/product-1.jpg">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-8">
                    <div class="row py-1" style="height: 50%" data-aos="fade-right">
                        <div class="col-12">
                            <div class="card" style="height: 100%">
                                <div class="row g-0 d-flex align-items-center justify-content-center" style="height: 100%">
                                    <div class="col-4">
                                        <img src="${pageContext.request.contextPath}/assets/sample-book/product-1.jpg"
                                             width="100%">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <a href="#" class="btn btn-primary">Go somewhere</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row py-1" style="height: 50%" data-aos="fade-right">
                        <div class="col-12" >
                            <div class="card" style="height: 100%">
                                <div class="row g-0 d-flex align-items-center justify-content-center" style="height: 100%">
                                    <div class="col-4">
                                        <img src="${pageContext.request.contextPath}/assets/sample-book/product-1.jpg"
                                             width="100%">
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            <a href="#" class="btn btn-primary">Go somewhere</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
</html>
