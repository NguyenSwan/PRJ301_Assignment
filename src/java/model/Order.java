/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author a
 */
public class Order {

	private int orderID;
	private double totalAmount;
	private String status;
	private int userID;
	private List<OrderDetail> orderDetails;

	public Order() {
	}

	public Order(int orderID, double totalAmount, String status, int userID) {
		this.orderID = orderID;
		this.totalAmount = totalAmount;
		this.status = status;
		this.userID = userID;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public double getTotalAmount() {
		double total = 0.0;
		for (OrderDetail detail : orderDetails) {
			total += detail.getPrice() * detail.getQuantity(); // Assuming you have getters for price and quantity
		}
		return total;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Override
	public String toString() {
		return "Order{" + "orderID=" + orderID + ", totalAmount=" + totalAmount + ", status=" + status + ", userID=" + userID + ", orderDetails=" + orderDetails + '}';
	}

}
