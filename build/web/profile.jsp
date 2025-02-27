<!--Website: wwww.codingdung.com-->
<%@page import="model.Users" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<%
    Users user = (Users) session.getAttribute("user");
    if (user == null) {
        // Redirect to login page or show an error message
        response.sendRedirect("login.jsp");
        return; // Stop processing the page
    }
%>



<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style2.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <div class="container light-style flex-grow-1 container-p-y">
            
            <h4 class="font-weight-bold py-3 mb-4">
                Profile                        <a href="home.jsp">Home</a>
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list"
                               href="#account-general">General</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-change-password">Change password</a>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-general">
                                <div class="card-body media align-items-center">
                                    <img src="https://th.bing.com/th/id/OIP.kQyrx9VbuWXWxCVxoreXOgHaHN?w=189&h=184&c=7&r=0&o=5&dpr=1.3&pid=1.7" alt
                                         class="d-block ui-w-80">
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label class="form-label">Username</label>
                                        <input type="text" class="form-control mb-1" value="<%= user.getUserName() %>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">E-mail</label>
                                        <input type="text" class="form-control mb-1" value="<%= user.getEmail() %>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input type="text" class="form-control" value="<%= user.getPhone() %>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Address</label>
                                        <input type="text" class="form-control" value="<%= user.getAddress() %>" readonly>
                                    </div>
                                </div>
                            </div>


                            <!-- Change Password Tab -->
                            <div class="tab-pane fade" id="account-change-password">
                                <div class="card-body pb-2">
                                    <form action="changepass" method="post">
                                        <div class="form-group">
                                            <label class="form-label">Current Password</label>
                                            <input type="password" name="currentPassword" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">New Password</label>
                                            <input type="password" name="newPassword" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Repeat New Password</label>
                                            <input type="password" name="confirmPassword" class="form-control" required>
                                        </div>
                                        <div class="text-right mt-3">
                                            <button type="submit" class="btn btn-primary">Change Password</button>
                                            <button type="button" class="btn btn-default" onclick="window.location.href = 'profile.jsp'">Cancel</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    </script>
</body>

</html>