/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Order;
import model.ShoppingCart;
import model.Users;

/**
 *
 * @author a
 */
public class OrderDAO extends DBContext {

	public static void main(String[] args) {
//		for (Order order : new OrderDAO().getOrders(6)) {
//			System.out.println(order);
//		}

		System.out.println(new OrderDAO().getOrder(6));
	}

	public List<Order> getOrders(int userID) {
		List<Order> list = new ArrayList<>();
		String sql = "SELECT * FROM dbo.Orders WHERE UserID = ?;";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Order order = new Order();
				order.setOrderID(resultSet.getInt("orderID"));
				order.setTotalAmount(resultSet.getFloat("totalAmount"));
				order.setUserID(resultSet.getInt("userID"));
				order.setStatus(resultSet.getString("status"));
				order.setOrderDetails(new OrderDetailsDAO().getOrderDetails(order.getOrderID()));
				list.add(order);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}

	public Order getOrder(int orderID) {
		Order order = null;
		String sql = "SELECT * FROM dbo.Orders WHERE OrderID = ?;";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, orderID);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				order = new Order();
				order.setOrderID(resultSet.getInt("orderID"));
				order.setTotalAmount(resultSet.getFloat("totalAmount"));
				order.setUserID(resultSet.getInt("userID"));
				order.setStatus(resultSet.getString("status"));
				order.setOrderDetails(new OrderDetailsDAO().getOrderDetails(order.getOrderID()));
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return order;
	}

	public int createOrder(int userId, float totalAmount) {
		String sql = "INSERT INTO Orders (UserID, TotalAmount, Status) VALUES (?, ?, 'Pending')";
		int orderId = 0;
		try {
			PreparedStatement stmt = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, userId);
			stmt.setFloat(2, totalAmount);
			if (stmt.executeUpdate() > 0) {
				var rs = stmt.getGeneratedKeys();
				if (rs.next()) {
					orderId = rs.getInt(1);
				}
			}

		} catch (SQLException e) {

		}
		return orderId;
	}

	// Method to add order details for each cart item
	public void addOrderDetail(int orderId, CartItem item) throws Exception {
		String sql = "INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			stmt.setInt(1, orderId);
			stmt.setInt(2, item.getProduct().getProductID());
			stmt.setInt(3, item.getQuantity());
			stmt.setFloat(4, item.getProduct().getPrice());
			stmt.executeUpdate();
		}
	}

	public boolean saveOrder(Users user, ShoppingCart cart) {
		PreparedStatement orderStmt = null;
		PreparedStatement orderDetailStmt = null;

		try {
			connection.setAutoCommit(false); // Begin transaction

			// Insert into Orders table
			String orderSQL = "INSERT INTO Orders (UserID, OrderDate, TotalAmount) VALUES (?, ?, ?)";
			orderStmt = connection.prepareStatement(orderSQL);
			orderStmt.setInt(1, user.getUserID());
			orderStmt.setDate(2, new java.sql.Date(System.currentTimeMillis()));
			orderStmt.setString(3, cart.getTotalPrice());
			orderStmt.executeUpdate();

			ResultSet rs = orderStmt.getGeneratedKeys();
			int orderId = 0;
			if (rs.next()) {
				orderId = rs.getInt(1);
			}

			// Insert into OrderDetails table
			String detailSQL = "INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
			orderDetailStmt = connection.prepareStatement(detailSQL);

			for (CartItem item : cart.getItems().values()) {
				orderDetailStmt.setInt(1, orderId);
				orderDetailStmt.setInt(2, item.getProduct().getProductID());
				orderDetailStmt.setInt(3, item.getQuantity());
				orderDetailStmt.setFloat(4, item.getTotalPrice());
				orderDetailStmt.addBatch();
			}
			orderDetailStmt.executeBatch();
			connection.commit(); // Commit transaction

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
			close(orderStmt, orderDetailStmt, connection);
		}
	}

	public int deleteOrder(int orderID) {
		int rowAffected = 0;
		String sql = "UPDATE dbo.Orders SET Status = ? WHERE OrderID = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, "Canceled");
			preparedStatement.setInt(2, orderID);
			rowAffected = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return rowAffected;
	}

	private void close(PreparedStatement orderStmt, PreparedStatement orderDetailStmt, Connection connection) {
		throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
	}
}
