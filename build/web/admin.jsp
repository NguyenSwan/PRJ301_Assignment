<%-- 
    Document   : admin
    Created on : Oct 28, 2024, 8:38:14 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="dal.ProductDAO" %>
<%@page import="model.Product" %>
<!DOCTYPE html>

<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> productList = productDAO.getAllProducts();
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <h1>Admin Dashboard</h1>
        <h2>Product List</h2>
        <table border="1">
            <tr>
                <th>Product Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock Quantity</th>
                <th>Actions</th>
            </tr>
            <%
                for (Product product : productList) {
            %>
            <tr>
                <td><%= product.getProductName() %></td>
                <td><%= product.getCategoryID() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getStockQuantity() %></td>
                <td>
                    <a href="editProduct.jsp?productID=<%= product.getProductID() %>">Edit</a>
                    <a href="deleteProduct.jsp?productID=<%= product.getProductID() %>" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <a href="addProduct.jsp">Add New Product</a>
        
        
        
        
    </body>
</html>
