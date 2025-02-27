/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.ShoppingCart;
import model.Users;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import model.CartItem;

/**
 *
 * @author a
 */
public class CheckOutDAO extends DBContext {

    public boolean placeOrder(Users user, ShoppingCart cart) {
        PreparedStatement orderStmt = null;
        PreparedStatement orderDetailStmt = null;

        try {
            connection.setAutoCommit(false);

            // Insert into Orders
            String orderSql = "INSERT INTO Orders (UserID, OrderDate, TotalPrice) VALUES (?, GETDATE(), ?)";
            orderStmt = connection.prepareStatement(orderSql, PreparedStatement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, user.getUserID());
            orderStmt.setString(2, cart.getTotalPrice());
            orderStmt.executeUpdate();

            int orderId = getGeneratedKey(orderStmt);

            // Insert into OrderDetails
            String orderDetailSql = "INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
            orderDetailStmt = connection.prepareStatement(orderDetailSql);

            for (CartItem item : cart.getItems().values()) {
                orderDetailStmt.setInt(1, orderId);
                orderDetailStmt.setInt(2, item.getProduct().getProductID());
                orderDetailStmt.setInt(3, item.getQuantity());
                orderDetailStmt.setFloat(4, item.getProduct().getPrice());
                orderDetailStmt.addBatch();
            }
            orderDetailStmt.executeBatch();

            connection.commit();
            return true;
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    System.out.println(e);
                }
            }
            System.out.println(e);
            return false;
        } finally {
            close(connection, orderStmt, orderDetailStmt);
        }
    }

    private void close(AutoCloseable... resources) {
        for (AutoCloseable resource : resources) {
            if (resource != null) {
                try {
                    resource.close();
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        }
    }

    private int getGeneratedKey(PreparedStatement stmt) throws SQLException {
        try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }
        }
    }
}
