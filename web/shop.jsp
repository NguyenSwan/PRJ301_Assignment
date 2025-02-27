<%--
    Document   : shop
    Created on : Oct 21, 2024, 4:42:29 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Product" %>
<%@page import="model.Users"%>
<%@page import="dal.ProductDAO" %>


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
                                        <% Users user = (Users) session.getAttribute("user"); %>
                                        <% if (user != null) { %>
                                        <li>Welcome, <%= user.getUserName() %>
                                            <ul class="dropdown-menu">
                                                <li><a href="logout" style="color: white">Log out</a></li>
                                                <li><a href="profile.jsp" style="color: white">Log out</a></li>
                                                <% if (user.getRole() == 1) { %> <!-- Check if the user is an admin -->
                                                <li><a href="admin.jsp" style="color: white">Admin</a></li>
                                                    <% } %>
                                            </ul>
                                        </li>
                                        <% } else { %>
                                        <li><a href="login.jsp">Log in</a></li>
                                        <li><a href="register.jsp">Sign up</a></li>
                                            <% } %>
                                    </ul>
                                </div>
                                <div class="header__logo">
                                    <a href="./index.html"><img src="img/logo.png" alt=""></a>
                                </div>
                                <div class="header__top__right">
                                    <div class="header__top__right__cart">
                                        <a href="shoppingcart.jsp"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                                        <div class="cart__price">Cart: <span>0₫</span></div>
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
                                <li class=""><a href="order">Order</a></li>
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
                            <h2>Shop</h2>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="breadcrumb__links">
                            <a href="home">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <div class="shop__option">
                    <div class="row">
                        <div class="col-lg-7 col-md-7">
                            <div class="shop__option__search">
                                <form action="search">
                                    <select name="categoryId">
                                        <option value="">Categories</option>
                                        <option value="1">Bánh sinh nhật</option>
                                        <option value="2">Bánh Entremet</option>
                                    </select>
                                    <input type="text" name="searchTerm" placeholder="Tìm kiếm sản phẩm..." <a href="./search"></a>
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </form>


                            </div>




                        </div>
                        <div class="col-lg-5 col-md-5">
                            <div class="shop__option__right">
                                <form action="shop" method="get">
                                    <select name="sort" onchange="this.form.submit()">
                                        <option value="">Default sorting</option>
                                        <option value="name_asc">A to Z</option>
                                        <option value="name_desc">Z to A</option>
                                        <option value="price_asc">Low to High</option>
                                        <option value="price_desc">High to Low</option>
                                    </select>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <c:if test="${empty productList}">
                        <p>No products found.</p>
                    </c:if>

                    <c:forEach var="product" items="${productList}">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${product.imageURL}">
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="detail?productID=${product.productID}">${product.productName}</a></h6>
                                    <div class="product__item__price">${product.formattedPrice}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


                <div class="shop__last__option">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__pagination">
                                <!-- Dynamic Page Numbers -->
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:if test="${i == currentPage}">
                                        <strong>${i}</strong> <!-- Highlight the current page -->
                                    </c:if>
                                    <c:if test="${i != currentPage}">
                                        <a href="shop?page=${i}">${i}</a>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--
        Shop Section End -->








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
