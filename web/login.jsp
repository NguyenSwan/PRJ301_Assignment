<%-- 
    Document   : login
    Created on : Oct 6, 2024, 8:23:46 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style1.css">
    </head>
    <body>
        <div class="main">

            <!-- log in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="img/signin-image.jpg" alt="sing up image"></figure>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Sign up</h2>
                            <form action="login" method="post" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="user" id="user" placeholder="Username"/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="pass" id="pass" placeholder="Password"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                                </div>
                            </form>
                            <h4 style="color: red">${requestScope.error}</h4>
                        </div>
                    </div>
                </div>
            </section>

        </div>


        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
