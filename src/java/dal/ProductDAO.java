package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

public class ProductDAO extends DBContext {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.ProductID, p.ProductName, p.ImageURL, p.Price,\n"
                + "p.StockQuantity, p.ShortDescription, p.Description,\n"
                + "p.CategoryID, c.CategoryName,  c.Description\n"
                + "from Products p inner join Categories c\n"
                + "on p.CategoryID = c.CategoryID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setImageURL(rs.getString("imageURL"));
                p.setPrice(rs.getFloat("price"));
                p.setStockQuantity(rs.getInt("stockQuantity"));
                p.setShortDescription(rs.getString("shortDescription"));
                p.setDescription(rs.getString("description"));

                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("description"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Product> getNewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 p.ProductID, p.ProductName, p.ImageURL, p.Price,\n"
                + "p.StockQuantity, p.ShortDescription, p.Description,\n"
                + "p.CategoryID, c.CategoryName,  c.Description\n"
                + "from Products p inner join Categories c\n"
                + "on p.CategoryID = c.CategoryID\n"
                + "order by p.ProductID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setImageURL(rs.getString("imageURL"));
                p.setPrice(rs.getFloat("price"));
                p.setStockQuantity(rs.getInt("stockQuantity"));
                p.setShortDescription(rs.getString("shortDescription"));
                p.setDescription(rs.getString("description"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setCategoryName(rs.getString("categoryName"));

                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("description"));

                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
        for (Product product : new ProductDAO().getNewProduct()) {
            System.out.println(product);
        }
    }

    public List<Product> searchProductsByName(String name) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE ProductName LIKE ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + name + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // Populate product details from the result set
                    Product p = new Product();
                    p.setProductID(rs.getInt("ProductID"));
                    p.setProductName(rs.getString("ProductName"));
                    p.setImageURL(rs.getString("imageURL"));
                    p.setPrice(rs.getFloat("price"));
                    p.setStockQuantity(rs.getInt("stockQuantity"));
                    p.setShortDescription(rs.getString("shortDescription"));
                    p.setDescription(rs.getString("description"));

                    productList.add(p);
                }
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return productList;
    }

    public List<Product> getProducts(int offset, int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.ProductID, p.ProductName, p.ImageURL, p.Price, "
                + "p.StockQuantity, p.ShortDescription, p.Description, "
                + "p.CategoryID, c.CategoryName, c.Description "
                + "FROM Products p INNER JOIN Categories c ON p.CategoryID = c.CategoryID "
                + "ORDER BY p.ProductID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, offset);
            st.setInt(2, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setImageURL(rs.getString("ImageURL"));
                p.setPrice(rs.getFloat("Price"));
                p.setStockQuantity(rs.getInt("StockQuantity"));
                p.setShortDescription(rs.getString("ShortDescription"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int getTotalProductCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Products";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return count;
    }

    public Product getProductById(int productId) {
        Product product = null;
        String sql = "SELECT * FROM Products WHERE ProductID = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, productId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImageURL(rs.getString("ImageURL"));
                product.setPrice(rs.getFloat("Price"));
                product.setStockQuantity(rs.getInt("StockQuantity"));
                product.setShortDescription(rs.getString("ShortDescription"));
                product.setDescription(rs.getString("Description"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return product;
    }

    public List<Product> getProductsByCategoryId(String categoryId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE CategoryID = ?"; // Query by category ID

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, Integer.parseInt(categoryId)); // Set the category ID

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImageURL(rs.getString("ImageURL"));
                product.setPrice(rs.getFloat("Price"));
                product.setStockQuantity(rs.getInt("StockQuantity"));
                product.setShortDescription(rs.getString("ShortDescription"));
                product.setDescription(rs.getString("Description"));
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return products;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO Products (ProductName, CategoryID, ImageURL, Price, StockQuantity, ShortDescription, Description) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, product.getProductName());
            pstmt.setLong(2, product.getCategoryID());
            pstmt.setString(3, product.getImageURL());
            pstmt.setFloat(4, product.getPrice());
            pstmt.setInt(5, product.getStockQuantity());
            pstmt.setString(6, product.getShortDescription());
            pstmt.setString(7, product.getDescription());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE Products SET ProductName=?, CategoryID=?, ImageURL=?, Price=?, StockQuantity=?, ShortDescription=?, Description=? WHERE ProductID=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, product.getProductName());
            pstmt.setLong(2, product.getCategoryID());
            pstmt.setString(3, product.getImageURL());
            pstmt.setFloat(4, product.getPrice());
            pstmt.setInt(5, product.getStockQuantity());
            pstmt.setString(6, product.getShortDescription());
            pstmt.setString(7, product.getDescription());
            pstmt.setLong(8, product.getProductID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(long productID) {
        String sql = "DELETE FROM Products WHERE ProductID=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setLong(1, productID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        try (PreparedStatement pstmt = connection.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImageURL(rs.getString("ImageURL"));
                product.setPrice(rs.getFloat("Price"));
                product.setStockQuantity(rs.getInt("StockQuantity"));
                product.setShortDescription(rs.getString("ShortDescription"));
                product.setDescription(rs.getString("Description"));
                productList.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return productList;
    }

    public Product getProductById(long productID) {
        Product product = null;
        String sql = "SELECT * FROM Products WHERE ProductID=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setLong(1, productID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setProductID(rs.getInt("ProductID"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setCategoryID(rs.getInt("CategoryID"));
                    product.setImageURL(rs.getString("ImageURL"));
                    product.setPrice(rs.getFloat("Price"));
                    product.setStockQuantity(rs.getInt("StockQuantity"));
                    product.setShortDescription(rs.getString("ShortDescription"));
                    product.setDescription(rs.getString("Description"));
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
    }

    public void updateStock(int productId, int quantitySold) throws Exception {
        String sql = "UPDATE Products SET StockQuantity = StockQuantity - ? WHERE ProductID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, quantitySold);
            stmt.setInt(2, productId);
            stmt.executeUpdate();
        }
    }

    private List<Product> getProductsByQuery(String sql) {
        List<Product> products = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setCategoryID(rs.getInt("CategoryID"));
                product.setImageURL(rs.getString("ImageURL"));
                product.setPrice(rs.getFloat("Price"));
                product.setStockQuantity(rs.getInt("StockQuantity"));
                product.setShortDescription(rs.getString("ShortDescription"));
                product.setDescription(rs.getString("Description"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> getProductsSortedByName() {
        String sql = "SELECT * FROM Products ORDER BY productName ASC";
        return getProductsByQuery(sql);
    }

    // Method to get products sorted by name (Z to A)
    public List<Product> getProductsSortedByNameDesc() {
        String sql = "SELECT * FROM Products ORDER BY productName DESC";
        return getProductsByQuery(sql);
    }

    // Method to get products sorted by price (Low to High)
    public List<Product> getProductsSortedByPrice() {
        String sql = "SELECT * FROM Products ORDER BY price ASC";
        return getProductsByQuery(sql);
    }

    // Method to get products sorted by price (High to Low)
    public List<Product> getProductsSortedByPriceDesc() {
        String sql = "SELECT * FROM Products ORDER BY price DESC";
        return getProductsByQuery(sql);
    }

}
