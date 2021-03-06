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
        <div class="container d-flex align-items-center justify-content-center full-height-container">
            <div class="row ">
                <div class="col-md-6 col-sm-12 px-5 d-flex justify-content-center align-items-center">
                    <img src="${pageContext.request.contextPath}/assets/logo-transparent.png" role="presentation" class="img-fluid" />
                </div>
                <div class="mx-auto col-md-6 col-sm-12">
                    <div class="card mx-auto" style="width: 80%">
                        <div class="card-body">
                            <form action="../Auth_Controller" method="POST" class="needs-validation" novalidate>
                                <div>
                                    <input
                                        class="form-control form-control-lg my-2"
                                        type="email"
                                        placeholder="Email"
                                        name="email"
                                        pattern="/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/"
                                        required
                                        data-value-missing="Trường này không được bỏ trống"
                                        data-pattern-mismatch="Email không hợp lệ"
                                        />
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div>
                                    <input
                                        class="form-control form-control-lg my-2"
                                        type="text"
                                        placeholder="Tên đăng nhập"
                                        name="username"
                                        required
                                        maxlength="30"
                                        minlength="8"
                                        data-value-missing="Trường này không được bỏ trống"
                                        data-too-long="Tên đăng nhập không được dài quá 30 kí tự"/>
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div>
                                    <input
                                        class="form-control form-control-lg my-2"
                                        type="text"
                                        placeholder="Số điện thoại"
                                        name="phoneNum"
                                        required
                                        pattern="^\d{10}$"
                                        data-value-missing="Trường này không được bỏ trống"
                                        data-pattern-mismatch="Số điện thoại không hợp lệ"/>
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div>
                                    <input
                                        class="form-control form-control-lg my-2"
                                        type="password"
                                        placeholder="Mật khẩu"
                                        name="password"
                                        required
                                        data-value-missing="Trường này không được bỏ trống"
                                        data-too-long="Mật khẩu dài quá 30 kí tự"
                                        data-too-short="Mật khẩu phải từ 8-30 kí tự"/>
                                    <div class="invalid-feedback"></div>
                                </div>
                                <button type="submit" class="btn btn-lg btn-primary my-4" style="width: 100%">
                                    Đăng kí
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="../controller/validation.js"></script>
    </body>
</html>
