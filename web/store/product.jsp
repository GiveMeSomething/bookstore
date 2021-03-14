<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            User currentUser = (User) session.getAttribute("user");
            String username;
            boolean hasLogin = (currentUser != null);
            if (hasLogin) {
                username = currentUser.getUsername();
            }
        %>
        <c:set var="cart" value="${sessionScope.cart}" />
        <c:set var="book" value="${sessionScope.book}" />
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
                                                <li><a class="dropdown-item"
                                                       href="${pageContext.request.contextPath}/user">
                                                        Trang cá nhân
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="dropdown-item"
                                                       href="${pageContext.request.contextPath}/store/checkout.jsp">
                                                        Giỏ hàng
                                                    </a>
                                                </li>
                                                <hr class="p-0 m-0 my-1"/>
                                                <li><a class="dropdown-item"
                                                       href="${pageContext.request.contextPath}/auth?signout=1">
                                                        Đăng xuất
                                                    </a>
                                                </li>
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
        <div class="container my-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/store">Cửa hàng sách</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${book.bookName}</li>
                </ol>
            </nav>
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
    </div>
    <section id="product">
        <div class="container">

            <div class="row">
                <div class="col-4">
                    <img src="${pageContext.request.contextPath}${book.imageUrl}" width="100%" />
                </div>
                <div class="col-8 mt-5">
                    <h1>${book.bookName}</h1>
                    <div class="row">
                        <p>By ${book.supplier} from ${book.brand}</p>
                    </div>
                    <div class="row my-5">
                        <h3>$${book.unitPrice}</h3>
                    </div>
                    <div class="row">
                        <h5>Chỉ còn ${book.unitInStock} sản phẩm trong kho !</h5>
                    </div>
                    <div class="row my-2">
                        <a href="${pageContext.request.contextPath}/cart?id=${book.bookId}">
                            <button type="button" class="btn btn-primary">Mua ngay</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</html>
