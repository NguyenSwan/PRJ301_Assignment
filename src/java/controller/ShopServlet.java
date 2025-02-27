/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.CategoryDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author a
 */
@WebServlet(name = "ShopServlet", urlPatterns = {"/shop"})
public class ShopServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageSize = 8; // Số lượng sản phẩm mỗi trang
        int page = 1; // Số trang mặc định

        // Lấy số trang từ request
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }

        // Lấy tham số sort từ request
        String sort = request.getParameter("sort");

        // Tính toán offset
        int offset = (page - 1) * pageSize;

        ProductDAO productDAO = new ProductDAO();
        List<Product> productList;

        // Gọi phương thức sắp xếp tương ứng dựa trên tham số sort
        if (sort != null) {
            switch (sort) {
                case "name_asc":
                    productList = productDAO.getProductsSortedByName(); // Sắp xếp theo tên (A-Z)
                    break;
                case "name_desc":
                    productList = productDAO.getProductsSortedByNameDesc(); // Sắp xếp theo tên (Z-A)
                    break;
                case "price_asc":
                    productList = productDAO.getProductsSortedByPrice(); // Sắp xếp theo giá (Thấp đến Cao)
                    break;
                case "price_desc":
                    productList = productDAO.getProductsSortedByPriceDesc(); // Sắp xếp theo giá (Cao đến Thấp)
                    break;
                default:
                    productList = productDAO.getProducts(offset, pageSize); // Nếu không có sắp xếp, lấy sản phẩm với phân trang
                    break;
            }
        } else {
            productList = productDAO.getProducts(offset, pageSize); // Nếu không có tham số sort, lấy sản phẩm với phân trang
        }

        int totalProducts = productDAO.getTotalProductCount(); // Lấy tổng số sản phẩm
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize); // Tính tổng số trang

        request.setAttribute("productList", productList); // Đưa danh sách sản phẩm vào request
        request.setAttribute("currentPage", page); // Đưa trang hiện tại vào request
        request.setAttribute("totalPages", totalPages); // Đưa tổng số trang vào request

        RequestDispatcher dispatcher = request.getRequestDispatcher("shop.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
