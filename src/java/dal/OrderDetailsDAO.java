/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author a
 */
public class OrderDetailsDAO extends DBContext {

	public void insertOrderDetails(OrderDetail orderDetails) {
		String sql = "INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
		try (PreparedStatement ps = connection.prepareStatement(sql)) {
			ps.setLong(1, orderDetails.getOrderID());
			ps.setLong(2, orderDetails.getProductID());
			ps.setInt(3, orderDetails.getQuantity());
			ps.setFloat(4, orderDetails.getPrice());
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public List<OrderDetail> getOrderDetails(int orderID) {
		List<OrderDetail> list = new ArrayList<>();
		String sql = "SELECT * FROM dbo.OrderDetails WHERE OrderID = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, orderID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrderDetailID(resultSet.getInt("orderDetailID"));
				orderDetail.setProduct(new ProductDAO().getProductById(resultSet.getInt("productID")));
				orderDetail.setQuantity(resultSet.getInt("quantity"));
				orderDetail.setPrice(resultSet.getFloat("price"));
				list.add(orderDetail);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
}
