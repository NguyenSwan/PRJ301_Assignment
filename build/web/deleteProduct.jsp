<%-- 
    Document   : editProduct
    Created on : Oct 28, 2024, 8:45:47 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.ProductDAO" %>
<%@page import="model.Product" %>
<!DOCTYPE html>

<%
    int productID = Integer.parseInt(request.getParameter("productID"));
    ProductDAO productDAO = new ProductDAO();
    productDAO.deleteProduct(productID);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product</title>
    </head>
    <body>
        <h1>Product Deleted</h1>
        <p>The product has been successfully deleted.</p>
        <a href="admin.jsp">Back to Dashboard</a>
    </body>
</html>
