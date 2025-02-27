<%--
    Document   : shopingcart
    Created on : Oct 28, 2024, 11:17:01 AM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Product"%>
<%@page import="model.ShoppingCart"%>
<%@page import="model.CartItem"%>
<%@page import="java.util.Map"%>
<%@page import="model.Users"%>
<!DOCTYPE html>

<%
    // Retrieve the shopping cart from session
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    if (cart == null) {
        cart = new ShoppingCart();
        session.setAttribute("cart", cart);
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
                                        <%
                        Users user = (Users) session.getAttribute("user");
                        if (user != null) {
                                        %>
                                        <li>Welcome, <%= user.getUserName() %>
                                            <ul class="dropdown-menu">
                                                <li><a href="logout" style="color: white">Log out</a></li>
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
                                    <a href="./home.jsp"><img src="img/logo.png" alt=""></a>
                                </div>
                                <div class="header__top__right">
                                    <div class="header__top__right__cart">
                                        <%
       int itemCount = (cart != null) ? cart.getItemCount() : 0; // Get total item count
       String totalPrice = (cart != null) ? cart.getTotalPrice() : "0"; // Get formatted total price
                                        %>
                                        <a href="shoppingcart.jsp"><img src="img/icon/cart.png" alt=""> <span><%= itemCount %></span></a>
                                        <div class="cart__price">Cart: <span><%= totalPrice %>₫</span></div>
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
                                <li class=""><a href="shop">Shop</a></li>
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
                    <div class="col-6">
                        <div class="breadcrumb__text">
                            <h2>Your Orders</h2>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="breadcrumb__links">
                            <a href="home">Home</a>
                            <span>Your Orders</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shopping Cart Section Begin -->
        <section class="shopping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="shopping__cart__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>User</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${user != null}"> <!-- Check if user is logged in -->
                                        <c:forEach var="var" items="${orders}">
                                            <tr>
                                                <td class="product__cart__item">
                                                    <div class="product__cart__item__text">
                                                        <h6>${var.orderID}</h6>
                                                    </div>
                                                </td>
												<td class="product__cart__item">
                                                    <div class="quantity">
														<h6>${user.userName}</h6>
                                                    </div>
                                                </td>
                                                <td class="cart__price">
                                                    <div class="quantity">
														<h6>${var.totalAmount}</h6>
                                                    </div>
												</td>
                                                <td class="cart__price">
                                                    <div class="quantity">
                                                        <h6>${var.status}</h6>
                                                    </div>
                                                </td>
												<td class="cart__price d-flex">
                                                    <div class="quantity mr-2">
                                                        <a href="order?orderID=${var.orderID}" class="btn btn-primary">Info</a>
                                                    </div>
													<div>
														<form action="order" method="post">
															<input type="hidden" name="orderID" value="${var.orderID}">
															<button type="submit" name="submit" value="delete"
																	class="btn btn-danger">
																Cancel
															</button>
														</form>
													</div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${user == null}">
                                        <tr>
                                            <td colspan="4" style="text-align:center;">
                                                <p>Please <a href="login.jsp">log in</a> to view your cart.</p>
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shopping Cart Section End -->




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
