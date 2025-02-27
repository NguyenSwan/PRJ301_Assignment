<%--
    Document   : checkout
    Created on : Oct 28, 2024, 10:02:55 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Product"%>
<%@page import="model.ShoppingCart"%>
<%@page import="model.CartItem"%>
<%@page import="model.Users"%>
<!DOCTYPE html>


<%
    // Retrieve the shopping cart from session
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    Users user = (Users) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
        return;
    }
    if (cart == null || cart.getItems().isEmpty()) {
        response.sendRedirect("shoppingcart.jsp"); // Redirect if cart is empty
        return;
    }
%>


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
                                        <% if (user != null) { %>
                                        <li>Welcome, <%= user.getUserName() %></li>
                                            <% } else { %>
                                        <li><a href="login.jsp">Log in</a></li>
                                        <li><a href="register.jsp">Sign up</a></li>
                                            <% } %>
                                    </ul>
                                </div>
                                <div class="header__logo">
                                    <a href="home"><img src="img/logo.png" alt=""></a>
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
                            <h2>Checkout</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__links">
                            <a href="./home.jsp">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container">
                <div class="checkout__form">
                    <form action="checkout" method="post">
                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <h6 class="checkout__title">Billing Details</h6>
                                <div class="checkout__input">
                                    <p>Name<span>*</span></p>
                                    <input type="text" name="name" required>
                                </div>
                                <div class="checkout__input">
                                    <p>Address<span>*</span></p>
                                    <input type="text" placeholder="Street Address" class="checkout__input__add" name="address" required>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Phone<span>*</span></p>
                                            <input type="text" name="phone" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input type="email" name="email" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="checkout__order">
                                    <h6 class="order__title">Your order</h6>
                                    <div class="checkout__order__products">Product <span>Total</span></div>
                                    <ul class="checkout__total__products">
                                        <c:forEach var="item" items="${cart.items.values()}">
                                            <li>
                                                <samp>01.</samp> ${item.product.productName} <span>${item.formattedTotalPrice}</span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <ul class="checkout__total__all">
                                        <li>Total <span>${cart.totalPrice}</span></li>
                                    </ul>
                                    <button type="submit" class="site-btn">PLACE ORDER</button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </section>
        <!-- Checkout Section End -->

        <c:if test="${not empty message}">
            <div class="alert alert-info">${message}</div>
        </c:if>



        <!-- Footer Section Begin -->
        <footer class="footer set-bg">
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
