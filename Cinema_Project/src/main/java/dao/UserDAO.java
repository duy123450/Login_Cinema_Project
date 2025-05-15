package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;
import util.DBConnection;

public class UserDAO {
	
	public List<User> getAllUsers() {
	    List<User> users = new ArrayList<>();
	    String sql = "SELECT * FROM Users";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            User user = new User();
	            user.setUserID(rs.getInt("userID"));
	            user.setFullname(rs.getString("fullname"));
	            user.setEmail(rs.getString("email"));
	            user.setUsername(rs.getString("username"));
	            user.setAddress(rs.getString("address"));
	            user.setPassword(rs.getString("password"));
	            user.setRoleName(rs.getString("role_name"));
	            user.setCreatedAt(rs.getTimestamp("created_at"));
				user.setUpdatedAt(rs.getTimestamp("updated_at"));
	            users.add(user);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return users;
	}
	
	public User getUserByUsername(String username) {
		User foundUser = null;
		String sqlGetUserByUsername = "SELECT * FROM Users WHERE username = ?";
		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement statementGetUserByUsername = connection.prepareStatement(sqlGetUserByUsername);
			statementGetUserByUsername.setString(1, username);
			
			ResultSet rsGetUserByUsername = statementGetUserByUsername.executeQuery();
			if (rsGetUserByUsername.next()) {
				foundUser = new User();
				foundUser.setUserID(rsGetUserByUsername.getInt("UserID"));
				foundUser.setFullname(rsGetUserByUsername.getString("fullname"));
				foundUser.setEmail(rsGetUserByUsername.getString("email"));
				foundUser.setUsername(rsGetUserByUsername.getString("username"));
				foundUser.setAddress(rsGetUserByUsername.getString("address"));
				foundUser.setPassword(rsGetUserByUsername.getString("password"));
				foundUser.setRoleName(rsGetUserByUsername.getString("role_name"));
				foundUser.setCreatedAt(rsGetUserByUsername.getTimestamp("created_at"));
				foundUser.setUpdatedAt(rsGetUserByUsername.getTimestamp("updated_at"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return foundUser;
	}
	
	public User getUserById(Long userID) {
		User foundUser = null;
		String sqlGetUserById = "SELECT * FROM Users WHERE UserID = ?";
		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement statementGetUserById = connection.prepareStatement(sqlGetUserById);
			statementGetUserById.setLong(1, userID);
			
			ResultSet rsGetUserById = statementGetUserById.executeQuery();
			if (rsGetUserById.next()) {
				foundUser = new User();
				foundUser.setUserID(rsGetUserById.getInt("userID"));
				foundUser.setFullname(rsGetUserById.getString("fullname"));
				foundUser.setEmail(rsGetUserById.getString("email"));
				foundUser.setUsername(rsGetUserById.getString("username"));
				foundUser.setAddress(rsGetUserById.getString("address"));
				foundUser.setPassword(rsGetUserById.getString("password"));
				foundUser.setRoleName(rsGetUserById.getString("role_name"));
				foundUser.setCreatedAt(rsGetUserById.getTimestamp("created_at"));
				foundUser.setUpdatedAt(rsGetUserById.getTimestamp("updated_at"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return foundUser;
	}
	
	public User getUserByEmail(String email) {
		User foundUser = null;
		String sqlGetUserByUsername = "SELECT * FROM users WHERE email = ?";
		try {
			Connection connection = DBConnection.getConnection();
			PreparedStatement statementGetUserByUsername = connection.prepareStatement(sqlGetUserByUsername);
			statementGetUserByUsername.setString(1, email);
			
			ResultSet rsGetUserByUsername = statementGetUserByUsername.executeQuery();
			if (rsGetUserByUsername.next()) {
				foundUser = new User();
				foundUser.setUserID(rsGetUserByUsername.getLong("userID"));
				foundUser.setFullname(rsGetUserByUsername.getString("fullname"));
				foundUser.setEmail(rsGetUserByUsername.getString("email"));
				foundUser.setUsername(rsGetUserByUsername.getString("username"));
				foundUser.setPassword(rsGetUserByUsername.getString("password"));
				foundUser.setAddress(rsGetUserByUsername.getString("address"));
				foundUser.setRoleName(rsGetUserByUsername.getString("role_name"));
				foundUser.setCreatedAt(rsGetUserByUsername.getTimestamp("created_at"));
				foundUser.setUpdatedAt(rsGetUserByUsername.getTimestamp("updated_at"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return foundUser;
	}
	
	public boolean createUser(User user) {
	    String sqlInsert = "INSERT INTO Users (fullname, email, username, address, password, role_name, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())";
	    try {
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement stmt = connection.prepareStatement(sqlInsert);
	        stmt.setString(1, user.getFullname());
	        stmt.setString(2, user.getEmail());
	        stmt.setString(3, user.getUsername());
	        stmt.setString(4, user.getAddress());
	        stmt.setString(5, user.getPassword());
	        stmt.setString(6, user.getRoleName());

	        int rowsInserted = stmt.executeUpdate();
	        System.out.println("Rows inserted: " + rowsInserted);
	        return rowsInserted > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
        return false;
	}
	
	public boolean updateUser(User updatedUser) {
		String sqlUpdateUser = "UPDATE users SET full_name = ?, email = ?, password = ?, address = ?, role_name = ? WHERE id = ?";
        try {
        	Connection connection = DBConnection.getConnection();
            PreparedStatement statementUpdateUser = connection.prepareStatement(sqlUpdateUser);
            statementUpdateUser.setString(1, updatedUser.getFullname());
            statementUpdateUser.setString(2, updatedUser.getEmail());
            statementUpdateUser.setString(3, updatedUser.getPassword());
            statementUpdateUser.setString(4, updatedUser.getAddress());
            statementUpdateUser.setString(5, updatedUser.getRoleName());
            statementUpdateUser.setLong(6, updatedUser.getUserID());

            statementUpdateUser.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}
	
	public boolean deleteUser(Long id) {
		String sqlDeleteUser = "DELETE FROM users WHERE id = ?";
        try {
        	Connection connection = DBConnection.getConnection();
            PreparedStatement statementDeleteUser = connection.prepareStatement(sqlDeleteUser);
            statementDeleteUser.setLong(1, id);
            
            statementDeleteUser.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
	}
}
