<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/style/auth.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/style/global-style.css" rel="stylesheet" type="text/css">
    </head>
    <body class="login-container">
        <%
            if (session.getAttribute("user") != null) {
                response.sendRedirect(request.getContextPath());
            }
        %>
        <div class="container d-flex align-items-center justify-content-center full-height-container">
            <div class="row ">
                <div class="col-md-6 col-sm-12 px-5 d-flex justify-content-center align-items-center">
                    <img src="${pageContext.request.contextPath}/assets/logo-transparent.png" role="presentation" class="img-fluid" />
                </div>
                <div class="mx-auto col-12 col-lg-6">
                    <div class="card mx-auto" style="width: 80%">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/auth"
                                  method="post"
                                  class="needs-validation"
                                  novalidate>
                                <div>
                                    <input
                                        class="form-control form-control-lg my-2"
                                        type="text"
                                        placeholder="Tên đăng nhập"
                                        name="username"
                                        data-value-missing="Trường này không được bỏ trống"
                                        required
                                        />
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div>
                                    <input
                                        class="form-control form-control-lg my-2"
                                        type="password"
                                        placeholder="Mật khẩu"
                                        name="password"
                                        required
                                        data-value-missing="Trường này không được bỏ trống"/>
                                    <div class="invalid-feedback"></div>
                                </div>
                                <button
                                    type="submit"
                                    name="login"
                                    value="login"
                                    class="btn btn-lg btn-primary my-3"
                                    style="width: 100%">
                                    Đăng nhập
                                </button>
                            </form>
                            <hr />
                            <a href="${pageContext.request.contextPath}/auth/register">
                                <button type="warning"
                                        class="btn btn-lg btn-warning my-3 px-4"
                                        style="width: 100%;color: white">
                                    Tạo tài khoản mới
                                </button>
                            </a>
                        </div>
                        <c:if test='${requestScope["message"] != null}'>
                            <div class="card-footer error-indicator">
                                ${requestScope["message"]}
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="${pageContext.request.contextPath}/controller/validation.js"></script>
    </body>
</html>
