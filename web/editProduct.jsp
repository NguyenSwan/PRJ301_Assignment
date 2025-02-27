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
    Product product = productDAO.getProductById(productID);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
    </head>
    <body>
        <h1>Edit Product</h1>
        <form action="editproduct" method="post">
            <input type="hidden" name="productID" value="<%= product.getProductID() %>">
            Product Name: <input type="text" name="productName" value="<%= product.getProductName() %>" required><br>
            Category ID: <input type="text" name="categoryID" value="<%= product.getCategoryID() %>" required><br>
            Image URL: <input type="text" name="imageURL" value="<%= product.getImageURL() %>"><br>
            Price: <input type="number" name="price" value="<%= product.getPrice() %>" step="0.01" required><br>
            Stock Quantity: <input type="number" name="stockQuantity" value="<%= product.getStockQuantity() %>" required><br>
            Short Description: <input type="text" name="shortDescription" value="<%= product.getShortDescription() %>"><br>
            Description: <textarea name="description"><%= product.getDescription() %></textarea><br>
            <input type="submit" value="Update Product">
        </form>
        <a href="admin.jsp">Back to Dashboard</a>
    </body>
</html>
