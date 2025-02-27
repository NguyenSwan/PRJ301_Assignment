<%--
    Document   : detail
    Created on : Oct 27, 2024, 4:25:34 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="dal.ProductDAO"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Users"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cake | Template</title>
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
if (user != null) { %>
                                        <li>Welcome, <%= user.getUserName() %></li>
                                            <% } else { %>
                                        <li><a href="login.jsp">Log in</a></li>
                                        <li><a href="register.jsp">Sign up</a></li>
                                            <% } %>
                                    </ul>
                                </div>
                                <div class="header__logo">
                                    <a href="./home.jsp"><img src="img/logo.png" alt=""></a>
                                </div>
                                <div class="header__top__right">
                                    <div class="header__top__right__cart">
                                        <a href="shoppingcart.jsp"><img src="img/icon/cart.png" alt=""> <span>${cart.items.size()}</span></a>
                                        <div class="cart__price">Cart: <span>${cart.totalPrice}</span></div>
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
                                <li class="active"><a href="shop">Shop</a></li>
                                <li class="active"><a href="order">Order</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__text">
                            <h2>Product detail</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <a href="./shop.html">Shop</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <%
    Product product = (Product) request.getAttribute("product");

    if (product != null) {
        %>

        <!-- Shop Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product__details__img">
                            <div class="product__details__big__img">
                                <img class="big_img" src="<%= product.getImageURL() %>" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product__details__text">
                            <!--<div class="product__label">Cupcake</div>-->
                            <h4><%= product.getProductName() %></h4>
                            <h5>${product.formattedPrice}</h5>
                            <p><%= product.getShortDescription() %></p>

                            <div class="product__details__option">
                                <form action="cart" method="post">
                                    <input type="hidden" name="productId" value="<%= product.getProductID() %>">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="number" name="quantity" value="1" min="1">
                                        </div>
                                    </div>
                                    <button type="submit" class="primary-btn" >Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="product__details__tab">
                        <div class="col-lg-12">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Description</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="row d-flex justify-content-center">
                                        <div class="col-lg-8">
                                            <p><%= product.getDescription() %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <!-- Shop Details Section End -->
        <%
    } else {
        %>
        <p>Product not found.</p>
        <%
            }
        %>



        <!-- Footer Section Begin -->
        <footer class="footer set-bg" >
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
        </footer>
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
