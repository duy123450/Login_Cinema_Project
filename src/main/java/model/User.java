package model;

import java.sql.Timestamp;

public class User {
	
	private long userID;
    private String fullname;
    private String email;
    private String username;
    private String address;
    private String password;
    private String roleName;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Constructors
    public User() {
    }

	public User(long userID, String fullname, String email, String username, String address, String password,
			String roleName, Timestamp createdAt, Timestamp updatedAt) {
		this.userID = userID;
		this.fullname = fullname;
		this.email = email;
		this.username = username;
		this.address = address;
		this.password = password;
		this.roleName = roleName;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public long getUserID() {
		return userID;
	}

	public void setUserID(long userID) {
		this.userID = userID;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

    

}
