<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <section id="orders">

        </section>
    </body>
</html>
