package dal;

import model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersDAO extends DBContext {

    // Check authentication by email and password
    public Users checkAuthen(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return new Users(
                        rs.getInt("UserID"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getString("Password"),
                        rs.getInt("Role")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null; // Return null if authentication fails
    }

    public boolean registerUser(Users user) {
        String sql = "INSERT INTO Users (UserName, Email, Phone, Address, Password, Role) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getPassword());
            ps.setInt(6, user.getRole());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return false;
    }

    public Users getUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE UserName = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users user = new Users();
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setPhone(rs.getString("Phone"));
                user.setAddress(rs.getString("Address"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getInt("Role"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public Users getUserByEmail(String email) {
        String sql = "SELECT * FROM Users WHERE Email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users user = new Users();
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setPhone(rs.getString("Phone"));
                user.setAddress(rs.getString("Address"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getInt("Role"));
                return user; // Return existing user
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null; // No user found
    }

    public void updateUser(Users user) {
        String query = "UPDATE Users SET password = ? WHERE userID = ?"; // Adjust according to your schema
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, user.getPassword());
            stmt.setInt(2, user.getUserID()); // Assuming you have a getUserID method
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
