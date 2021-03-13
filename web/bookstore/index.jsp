<%--
    Document   : index
    Created on : Mar 12, 2021, 11:40:03 PM
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
        <section id="bookstore">
            <div class="container-fluid">
                <div class="row py-5">
                    <div class="col-8 mx-auto">
                        <form action=""  method="POST" class="">
                            <div class="input-group">
                                <input type="text" class="form-control" name="keyword" placeholder="Nhập từ khóa cần tìm kiếm" />
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <div class="px-5">
                            <div>
                                <h3>Thể loại</h3>
                                <div class="form-check my-3 type-checkbox">
                                    <input class="form-check-input" type="checkbox" value="" id="1">
                                    <label class="form-check-label" for="1">
                                        Thể loại
                                    </label>
                                </div>
                                <div class="form-check my-3 type-checkbox">
                                    <input class="form-check-input" type="checkbox" value="" id="2">
                                    <label class="form-check-label" for="2">
                                        Thể loại
                                    </label>
                                </div>
                            </div>
                            <div>
                                <h3>Sắp xếp theo</h3>
                                <div class="form-check my-3 type-checkbox">
                                    <input class="form-check-input" type="checkbox" value="" id="3">
                                    <label class="form-check-label" for="3">
                                        xếp theo
                                    </label>
                                </div>
                                <div class="form-check my-3 type-checkbox">
                                    <input class="form-check-input" type="checkbox" value="" id="4">
                                    <label class="form-check-label" for="4">
                                        xếp theo
                                    </label>
                                </div>
                            </div>
                            <div>
                                <button type="button" class="btn btn-primary">Tìm kiếm</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="row g-0">
                            <div class="d-flex align-items-center justify-content-center col-3">
                                <div class="card" style="width: 18rem; border: 0;">
                                    <img src="${pageContext.request.contextPath}/assets/sample-book/product-1.jpg" class="card-img-top image-with-cover">
                                    <div class="image-with-cover-hover-content d-flex align-items-center justify-content-center">
                                        <a href="store/bookId">
                                            <button type="primary" class="btn btn-primary py-2 px-4">Mua ngay</button>
                                        </a>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">The Winter</h5>
                                        <p><em>$14.5</em></p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center col-3">
                                <div class="card" style="width: 18rem; border: 0">
                                    <img src="${pageContext.request.contextPath}/assets/sample-book/product-2.jpg" class="card-img-top image-with-cover">
                                    <div class="image-with-cover-hover-content d-flex align-items-center justify-content-center">
                                        <a href="store/bookId">
                                            <button type="primary" class="btn btn-primary py-2 px-4">Mua ngay</button>
                                        </a>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Cats Language</h5>
                                        <p><em>$14.5</em></p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center col-3">
                                <div class="card" style="width: 18rem; border: 0">
                                    <img src="${pageContext.request.contextPath}/assets/sample-book/product-3.jpg" class="card-img-top image-with-cover">
                                    <div class="image-with-cover-hover-content d-flex align-items-center justify-content-center">
                                        <a href="store/bookId">
                                            <button type="primary" class="btn btn-primary py-2 px-4">Mua ngay</button>
                                        </a>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Clean is Design</h5>
                                        <p><em>$14.5</em></p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center col-3">
                                <div class="card" style="width: 18rem; border: 0">
                                    <img src="${pageContext.request.contextPath}/assets/sample-book/product-4.jpg" class="card-img-top image-with-cover">
                                    <div class="image-with-cover-hover-content d-flex align-items-center justify-content-center">
                                        <a href="store/bookId">
                                            <button type="primary" class="btn btn-primary py-2 px-4">Mua ngay</button>
                                        </a>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">UX Research</h5>
                                        <p><em>$14.5</em></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row g-0">
                            <div class="d-flex align-items-center justify-content-center col-3">
                                <div class="card" style="width: 18rem; border: 0">
                                    <img src="${pageContext.request.contextPath}/assets/sample-book/product-5.jpg" class="card-img-top image-with-cover">
                                    <div class="image-with-cover-hover-content d-flex align-items-center justify-content-center">
                                        <a href="store/bookId">
                                            <button type="primary" class="btn btn-primary py-2 px-4">Mua ngay</button>
                                        </a>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Enlight Yourself</h5>
                                        <p><em>$14.5</em></p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center col-3">
                                <div class="card" style="width: 18rem; border: 0">
                                    <img src="${pageContext.request.contextPath}/assets/sample-book/product-6.jpg" class="card-img-top image-with-cover">
                                    <div class="image-with-cover-hover-content d-flex align-items-center justify-content-center">
                                        <a href="store/bookId">
                                            <button type="primary" class="btn btn-primary py-2 px-4">Mua ngay</button>
                                        </a>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Freelancer FAQ</h5>
                                        <p><em>$14.5</em></p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center col-3">
                                <div class="card" style="width: 18rem; border: 0">
                                    <img src="${pageContext.request.contextPath}/assets/sample-book/product-7.jpg" class="card-img-top image-with-cover">
                                    <div class="image-with-cover-hover-content d-flex align-items-center justify-content-center">
                                        <a href="store/bookId">
                                            <button type="primary" class="btn btn-primary py-2 px-4">Mua ngay</button>
                                        </a>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Time Travel</h5>
                                        <p><em>$14.5</em></p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-center col-3">
                                <div class="card" style="width: 18rem; border: 0">
                                    <img src="${pageContext.request.contextPath}/assets/sample-book/product-8.jpg" class="card-img-top image-with-cover">
                                    <div class="image-with-cover-hover-content d-flex align-items-center justify-content-center">
                                        <a href="store/bookId">
                                            <button type="primary" class="btn btn-primary py-2 px-4">Mua ngay</button>
                                        </a>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">Bangladesh Power</h5>
                                        <p><em>$14.5</em></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </body>
</html>
