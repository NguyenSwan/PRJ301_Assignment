/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.OrderDetailsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.ShoppingCart;
import model.Users;

/**
 *
 * @author a
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/checkout"})
public class CheckOutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Users user = (Users) request.getSession().getAttribute("user");
        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
        OrderDAO orderDAO = new OrderDAO();
        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();

        if (user != null && cart != null && !cart.getItems().isEmpty()) {

            int orderId = orderDAO.createOrder(user.getUserID(), cart.getTotalAmount());

            var cartItems = cart.getItems();
            for (Map.Entry<Integer, CartItem> entry : cartItems.entrySet()) {
                Integer key = entry.getKey();
                CartItem val = entry.getValue();

                int productID = val.getProduct().getProductID();
                int quantity = val.getQuantity();
                float price = val.getProduct().getPrice() * quantity;
                
                OrderDetail orderDetail = new OrderDetail(0, orderId, productID, quantity, price);
                
                orderDetailsDAO.insertOrderDetails(orderDetail);
            }

//            boolean isOrderSaved = orderDAO.saveOrder(user, cart); // Method in OrderDAO to save order and order details
//
//            if (isOrderSaved) {
//                request.getSession().setAttribute("cart", null); // Clear cart after checkout
//                request.setAttribute("message", "Order placed successfully!");
//            } else {
//                request.setAttribute("message", "Order failed. Please try again.");
//            }
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("shoppingcart.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
