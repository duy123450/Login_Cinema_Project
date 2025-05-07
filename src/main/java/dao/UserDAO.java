package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import util.DBConnection;

public class UserDAO {
	
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
				foundUser.setRoleID(rsGetUserByUsername.getInt("RoleID"));
				foundUser.setFullname(rsGetUserByUsername.getString("fullname"));
				foundUser.setEmail(rsGetUserByUsername.getString("email"));
				foundUser.setUsername(rsGetUserByUsername.getString("username"));
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

}
