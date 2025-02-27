<%--
    Document   : home
    Created on : Oct 3, 2024, 6:40:53 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Users"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cake Bakery</title>
        <%@include file="/WEB-INF/jspf/style.jspf" %>
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="header__top__inner">
                                <div class="header__top__left">
                                    <ul>
                                        <%
                          Users user = (Users) session.getAttribute("user");
                          if (user != null) {
                                        %>
                                        <li>Welcome, <%= user.getUserName() %>
                                            <ul class="dropdown-menu">
                                                <li><a href="logout" style="color: white">Log out</a></li>
                                                <li><a href="profile.jsp" style="color: white">Profile</a></li>
                                                <% if (user.getRole() == 1) { %> <!-- Check if the user is an admin -->
                                                <li><a href="admin.jsp" style="color: white">Admin</a></li>
                                                    <% } %>
                                            </ul>
                                        </li>
                                        <%
                                             } else {
                                        %>
                                        <li><a href="login.jsp">Log in</a></li>
                                        <li><a href="register.jsp">Sign up</a></li>
                                            <%
                                                }
                                            %>
                                    </ul>

                                </div>
                                <div class="header__logo">
                                    <a href="home"><img src="img/logo.png" alt=""></a>
                                </div>
                                <div class="header__top__right">
                                    <div class="header__top__right__cart">
                                        <a href="shoppingcart.jsp"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                                        <div class="cart__price">Cart: <span> 0₫</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="canvas__open"><i class="fa fa-bars"></i></div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li><a href="shop">Shop</a></li>
                                <li><a href="order">Order</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="hero__slider owl-carousel">
                <div class="hero__item set-bg" data-setbg="img/hero/hero.avif">
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-8">
                                <div class="hero__text">
                                    <h2>Mang tới trải nghiệm đặt bánh Pháp cao cấp trực tuyến</h2>
                                    <p>LaFuong Pastry có mặt tại đây là để mang tới cho bạn trải nghiệm thưởng thức bánh ngọt Pháp hiện đại, dành cho người Việt.</p>
                                    <a href="#" class="primary-btn">Our cakes</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- About Section Begin -->
        <section class="about spad">
            <div class="container">
                <div class="row">
                    <div class="col col-12 mb-3">
                        <div class="about__text">
                            <div class="section-title">
                                <span>About Cake shop</span>
                                <h2>Cakes and bakes from the house of Queens!</h2>
                            </div>
                            <p>The "Cake Shop" is a Jordanian Brand that started as a small family business. The owners are
                                Dr. Iyad Sultan and Dr. Sereen Sharabati, supported by a staff of 80 employees.</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- About Section End -->

        <hr>

        <!-- Product Section Begin -->
        <section class="product span">

            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <span>Best seller</span>
                        <h2>Những vị bánh nên thử</h2>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/shop/home/cake1.avif">
                                <!--                                <div class="product__label">
                                                                    <span>Cupcake</span>
                                                                </div>-->
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Secret Garden</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/shop/home/cake2.avif">
                                <!--                                <div class="product__label">
                                                                    <span>Cupcake</span>
                                                                </div>-->
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Lily’s Valley</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/shop/home/cake3.avif">
                                <!--                                <div class="product__label">
                                                                    <span>Cupcake</span>
                                                                </div>-->
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">A Gentle Blend</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="img/shop/home/cake4.avif">
                                <!--                                <div class="product__label">
                                                                    <span>Cupcake</span>
                                                                </div>-->
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Be in Blossom</a></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <hr>

        <!-- Product Section Begin -->
        <section class="product span">

            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <span>New Cake</span>
                        <h2>Những vị bánh mới</h2>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <c:forEach var="newProduct" items="${newProducts}">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${newProduct.imageURL}">
                                    <div class="product__label">
                                        <span>${newProduct.categoryName}</span>
                                    </div>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="detail?productID=${newProduct.productID}">${newProduct.productName}</a></h6>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Product Section End -->



        <!--         Testimonial Section Begin
                <section class="testimonial spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="section-title">
                                    <span>Phản hồi</span>
                                    <h2>Khách hàng của shop</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="testimonial__slider owl-carousel">
                                <div class="col-lg-6">
                                    <div class="testimonial__item">
                                        <div class="testimonial__author">
                                            <div class="testimonial__author__pic">
                                                <img src="img/testimonial/ta-1.jpg" alt="">
                                            </div>
                                            <div class="testimonial__author__text">
                                                <h5>Kerry D.Silva</h5>
                                                <span>New york</span>
                                            </div>
                                        </div>
                                        <div class="rating">
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star-half_alt"></span>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="testimonial__item">
                                        <div class="testimonial__author">
                                            <div class="testimonial__author__pic">
                                                <img src="img/testimonial/ta-2.jpg" alt="">
                                            </div>
                                            <div class="testimonial__author__text">
                                                <h5>Kerry D.Silva</h5>
                                                <span>New york</span>
                                            </div>
                                        </div>
                                        <div class="rating">
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star-half_alt"></span>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="testimonial__item">
                                        <div class="testimonial__author">
                                            <div class="testimonial__author__pic">
                                                <img src="img/testimonial/ta-1.jpg" alt="">
                                            </div>
                                            <div class="testimonial__author__text">
                                                <h5>Ophelia Nunez</h5>
                                                <span>London</span>
                                            </div>
                                        </div>
                                        <div class="rating">
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star-half_alt"></span>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="testimonial__item">
                                        <div class="testimonial__author">
                                            <div class="testimonial__author__pic">
                                                <img src="img/testimonial/ta-2.jpg" alt="">
                                            </div>
                                            <div class="testimonial__author__text">
                                                <h5>Kerry D.Silva</h5>
                                                <span>New york</span>
                                            </div>
                                        </div>
                                        <div class="rating">
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star-half_alt"></span>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="testimonial__item">
                                        <div class="testimonial__author">
                                            <div class="testimonial__author__pic">
                                                <img src="img/testimonial/ta-1.jpg" alt="">
                                            </div>
                                            <div class="testimonial__author__text">
                                                <h5>Ophelia Nunez</h5>
                                                <span>London</span>
                                            </div>
                                        </div>
                                        <div class="rating">
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star-half_alt"></span>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="testimonial__item">
                                        <div class="testimonial__author">
                                            <div class="testimonial__author__pic">
                                                <img src="img/testimonial/ta-2.jpg" alt="">
                                            </div>
                                            <div class="testimonial__author__text">
                                                <h5>Kerry D.Silva</h5>
                                                <span>New york</span>
                                            </div>
                                        </div>
                                        <div class="rating">
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star"></span>
                                            <span class="icon_star-half_alt"></span>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>-->
        <!-- Testimonial Section End -->

        <hr>

        <!-- Instagram Section Begin -->
        <section class="instagram spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 p-0">
                        <div class="instagram__text">
                            <div class="section-title">
                                <span>Follow us</span>
                                <h2>Sweet moments are saved as memories.</h2>
                            </div>
                            <h5><i class="fa fa-instagram"></i> @sweetcake</h5>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic">
                                    <img src="img/instagram/instagram-1.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic middle__pic">
                                    <img src="img/instagram/instagram-2.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic">
                                    <img src="img/instagram/instagram-3.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic">
                                    <img src="img/instagram/instagram-4.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic middle__pic">
                                    <img src="img/instagram/instagram-5.jpg" alt="">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic">
                                    <img src="img/instagram/instagram-3.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Instagram Section End -->

        <!-- Footer Section Begin -->
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <p class="copyright__text text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <!-- Footer Section End -->





        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.barfiller.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
