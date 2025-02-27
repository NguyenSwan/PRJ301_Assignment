<%-- 
    Document   : addProduct
    Created on : Oct 28, 2024, 8:39:59 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <h1>Add New Product</h1>
        <form action="addproduct" method="post">
            Product Name: <input type="text" name="productName" required><br>
            Category ID: <input type="text" name="categoryID" required><br>
            Image URL: <input type="text" name="imageURL"><br>
            Price: <input type="number" name="price" step="0.01" required><br>
            Stock Quantity: <input type="number" name="stockQuantity" required><br>
            Short Description: <input type="text" name="shortDescription"><br>
            Description: <textarea name="description"></textarea><br>
            <input type="submit" value="Add Product">
        </form>
        <a href="admin.jsp">Back to Dashboard</a>
    </body>
</html>
