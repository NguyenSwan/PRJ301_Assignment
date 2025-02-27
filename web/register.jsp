<%-- 
    Document   : signup
    Created on : Oct 9, 2024, 9:44:11 AM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body>
        <div class="main">

        
            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <form action="register" method="POST" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="username" placeholder="Username"/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Email"/>
                                </div>
                                <div class="form-group">
                                    <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                                    <input type="text" name="phone" id="phone" placeholder="Phone"/>
                                </div>
                                <div class="form-group">
                                    <label for="address"><i class="zmdi zmdi-home"></i></label>
                                    <input type="text" name="address" id="address" placeholder="Address"/>
                                </div>
                                <div class="form-group">
                                    <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="pass" placeholder="Password"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Sign up"/>
                                </div>
                            </form>
                                                        <%-- Display error message if registration fails --%>
                            <%
                                String errorMessage = (String) request.getAttribute("errorMessage");
                                if (errorMessage != null) {
                            %>
                                <div style="color: red;"><%= errorMessage %></div>
                            <%
                                }
                            %>
                        </div>
                        <div class="signup-image">
                            <figure><img src="img/signup-image.jpg" alt="sing up image"></figure>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>
