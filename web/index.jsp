<%@page import="books.Books_Repository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Bookstore</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/style/main-page-style.css" rel="stylesheet">
    </head>
    <body>
        <section id="navbar">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <img src="./assets/logo.jpg" role="presentation" style="height: 4rem; width: auto;"/>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse d-flex justify-content-md-end" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <div class="d-flex d-grid gap-4">
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
                                <li class="nav-item">
                                    <a href="register" class="navbar-link">
                                        <button
                                            type="button"
                                            class="nav-link active btn btn-link text-decoration-none navbar-button">
                                            Đăng kí
                                        </button>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="login" class="navbar-link">
                                        <button
                                            type="button"
                                            class="nav-link active btn btn-link text-decoration-none navbar-button">
                                            Đăng nhập
                                        </button>
                                    </a>
                                </li>
                            </div>
                        </ul>
                    </div>
                </nav>
            </div>
        </section>
        <section id="banner">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" style="background-image: url(assets/book_banner_1.jpg)">
                        <div class="carousel-item-content d-flex align-items-center justify-content-center"
                             style="height: 80vh">
                            <div class="row g-0">
                                <div class="content-wrapper d-flex flex-column col-md-6 offset-md-3 col-sm-12">
                                    <p style="color: #ffffff; text-align: center;" class="mb-4 fs-5">
                                        We know how personal a pen preference can be,
                                        which is why we’ve worked tirelessly to design the best —
                                        whether you prefer gel ink or marker, fine or medium tip.
                                    </p>
                                    <h1 style="color: #ffffff; text-align: center;">Pen Perfection&nbsp;</h1>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mt-4">
                                    <a class="button text-decoration-none py-2 px-4"
                                       href="store"
                                       style="color: #000000; background-color: #ffffff;">
                                        Xem thêm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style="background-image: url(assets/book_banner_2.jpg); background-size: 100vw auto">
                        <div class="carousel-item-content d-flex align-items-center justify-content-center"
                             style="height: 80vh">
                            <div class="row g-0">
                                <div class="content-wrapper d-flex flex-column col-md-6 offset-md-3 col-sm-12">
                                    <p style="color: #ffffff; text-align: center;" class="mb-4 fs-5">
                                        We know how personal a pen preference can be,
                                        which is why we’ve worked tirelessly to design the best —
                                        whether you prefer gel ink or marker, fine or medium tip.
                                    </p>
                                    <h1 style="color: #ffffff; text-align: center;">Pen Perfection&nbsp;</h1>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mt-4">
                                    <a class="button text-decoration-none py-2 px-4"
                                       href="store"
                                       style="color: #000000; background-color: #ffffff;">
                                        Xem thêm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style="background-image: url(assets/bg.jpg); background-size: 100vw auto">
                        <div class="carousel-item-content d-flex align-items-center justify-content-center"
                             style="height: 80vh">
                            <div class="row g-0">
                                <div class="content-wrapper d-flex flex-column col-md-6 offset-md-3 col-sm-12">
                                    <p style="color: #ffffff; text-align: center;" class="mb-4 fs-5">
                                        We know how personal a pen preference can be,
                                        which is why we’ve worked tirelessly to design the best —
                                        whether you prefer gel ink or marker, fine or medium tip.
                                    </p>
                                    <h1 style="color: #ffffff; text-align: center;">Pen Perfection&nbsp;</h1>
                                </div>
                                <div class="d-flex align-items-center justify-content-center mt-4">
                                    <a class="button text-decoration-none py-2 px-4"
                                       href="store"
                                       style="color: #000000; background-color: #ffffff;">
                                        Xem thêm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </a>
                </div>
        </section>
        <section id="shopPreview">
            <div>
                <div class="row g-0" style="margin: auto">
                    <div class="col-6" style="padding: 0" data-aos="fade-up">
                        <div class="d-flex align-items-center justify-content-center featured-image"
                             style="background-image: url(assets/sub-banner-2.jpg); background-size: cover; height: 100vh">
                            <h1 style="color: white">Bookstore</h1>
                            <div class="image-cover"></div>
                        </div>
                    </div>
                    <div class="col-6" style="padding: 0; max-height: 100vh;">
                        <div data-aos="fade-right"
                             class="d-flex align-items-center justify-content-center featured-image"
                             style="background-image: url(assets/book_banner_1.jpg); background-size: cover; height: 50vh">
                            <h1 style="color: white" class="text-center">Sách nổi bật<br/>hàng thàng</h1>
                        </div>
                        <div data-aos="fade-right"
                             class="d-flex align-items-center justify-content-center featured-image"
                             style="background-image: url(assets/sub-banner-1.webp); background-size: cover; height: 50vh">
                            <h1 style="color: white" class="text-center">Sách thịnh hành</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="featuredBooks">
            <div>
                <div class="text-center my-5">
                    <h1 class="">Sách nổi bật của tháng</h1>
                </div>
                <div class="row g-0">
                    <div class="d-flex align-items-center justify-content-center col-3">
                        <div class="card" style="width: 18rem; border: 0;">
                            <img src="assets/sample-book/product-1.jpg" class="card-img-top image-with-cover">
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
                            <img src="assets/sample-book/product-2.jpg" class="card-img-top image-with-cover">
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
                            <img src="assets/sample-book/product-3.jpg" class="card-img-top image-with-cover">
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
                            <img src="assets/sample-book/product-4.jpg" class="card-img-top image-with-cover">
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
                            <img src="assets/sample-book/product-5.jpg" class="card-img-top image-with-cover">
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
                            <img src="assets/sample-book/product-6.jpg" class="card-img-top image-with-cover">
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
                            <img src="assets/sample-book/product-7.jpg" class="card-img-top image-with-cover">
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
                            <img src="assets/sample-book/product-8.jpg" class="card-img-top image-with-cover">
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
                <div class="d-flex align-items-center justify-content-center">
                    <a href="bookstore">
                        <button type="primary" class="btn btn-primary py-2 px-4">Xem thêm</button>
                    </a>
                </div>
            </div>
        </section>
        <section id="forumPreview">
            <div class="my-5">
                <div class="row g-0" style="margin: auto">
                    <div class="col-6" style="padding: 0" data-aos="fade-up">
                        <div class="d-flex align-items-center justify-content-center featured-image"
                             style="background-image: url(assets/sub-banner-1.webp); background-size: cover; height: 100vh">
                            <h1 style="color: white">Cộng đồng sách</h1>
                            <div class="image-cover"></div>
                        </div>
                    </div>
                    <div class="col-6" style="padding: 0; max-height: 100vh;">
                        <div data-aos="fade-right"
                             class="d-flex align-items-center justify-content-center featured-image"
                             style="background-image: url(assets/book_banner_2.jpg); background-size: cover; height: 50vh">
                            <h1 style="color: white" class="text-center">Các bài viết<br/>nổi bật</h1>
                        </div>
                        <div data-aos="fade-right"
                             class="d-flex flex-column align-items-center justify-content-center bg-secondary"
                             style="height: 50vh">
                            <h3 style="color: white" class="text-center">
                                Chia sẻ trải nghiệm của bạn<br/>
                                về những cuốn sách với cộng đồng
                            </h3>
                            <a>
                                <button type="primary" class="btn btn-primary mt-2 py-2 px-4">Chia sẻ ngay</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="footer">
            <div class="my-5">
                <div class="row g-0">
                    <div class="col-md-6 col-sm-12 d-flex flex-column align-items-center justify-content-center">
                        <h3>Theo dõi tin tức và sự kiện qua</h3>
                        <div class="d-flex flex-row g-0 align-items-center gap-4 my-2">
                            <a href="#">
                                <img src="assets/icons/facebook-brands.svg" style="height: 3rem" role="presentation" />
                            </a>
                            <a href="#">
                                <img src="assets/icons/github-brands.svg" style="height: 3rem" role="presentation" />
                            </a>
                            <a href="#">
                                <img src="assets/icons/instagram-brands.svg" style="height: 3rem" role="presentation" />
                            </a>
                            <a href="#">
                                <img src="assets/icons/pinterest-brands.svg" style="height: 3rem" role="presentation" />
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 d-flex flex-column align-items-center justify-content-center">
                        <label for="newsletterEmail">
                            <h3>Đăng kí nhận thông tin</h3>
                        </label>
                        <div class="container">
                            <div class="row g-0">
                                <div class="col-6 offset-2">
                                    <input class="form-control" type="email" id="newsletterEmail" placeholder="Nhập email của bạn"/>
                                </div>
                                <div class="col-2">
                                    <button type="primary" class="btn btn-primary">Đăng kí</button>
                                </div>
                            </div>
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
