/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.Users;

/**
 *
 * @author a
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

	private OrderDAO orderDAO = new OrderDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");

		if (user == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		String orderIDStr = request.getParameter("orderID");
		if (orderIDStr == null) {
			var orders = orderDAO.getOrders(user.getUserID());
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("order.jsp").forward(request, response);
		} else {
			int orderID = Integer.parseInt(orderIDStr);
			var order = orderDAO.getOrder(orderID);
			request.setAttribute("order", order);
			request.getRequestDispatcher("orderDetail.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		String submit = request.getParameter("submit");
		switch (submit) {
			case "delete" -> {
				int orderID = Integer.parseInt(request.getParameter("orderID"));
				orderDAO.deleteOrder(orderID);
			}
		}
		response.sendRedirect("order");
	}
}
