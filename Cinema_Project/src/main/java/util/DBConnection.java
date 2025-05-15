package util;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import util.DBConnection;

public class DBConnection {
	
	private static final String URL = "jdbc:mysql://localhost:3306/cinema_db";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static Connection instance;

	public static void openConnection() {
		if (DBConnection.instance == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver"); // Nạp driver nếu dùng Java < 9 (với Java 9+ thường tự động)
				DBConnection.instance = DriverManager.getConnection(DBConnection.URL, DBConnection.USERNAME, DBConnection.PASSWORD);
				System.out.println("Open connection success");
			} catch (ClassNotFoundException e) {
				System.out.println("MySQL JDBC Driver not found");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("Open connection failed");
				e.printStackTrace();
			}
		}
	}

	public static Connection getConnection() {
		if (DBConnection.instance == null) {
			DBConnection.openConnection();
		}
		return DBConnection.instance;
	}

	public static void closeConnection() {
		if (DBConnection.instance != null) {
			try {
				DBConnection.instance.close();
				
				//Unregister JDBC
				Enumeration<Driver> drivers = DriverManager.getDrivers();
		        while (drivers.hasMoreElements()) {
		            Driver driver = drivers.nextElement();
		            try {
		                DriverManager.deregisterDriver(driver);
		                System.out.println("Deregistered JDBC driver: " + driver);
		            } catch (SQLException e) {
		                System.err.println("Error deregistering driver: " + driver);
		                e.printStackTrace();
		            }
		        }
		        
		        //Clean up
		        AbandonedConnectionCleanupThread.checkedShutdown();
				System.out.println("AbandonedConnectionCleanupThread shutdown completed.");
				DBConnection.instance = null;
				System.out.println("Close connection successful");
			} catch (SQLException e) {
				System.out.println("Close connection failed");
				e.printStackTrace();
			}
		} else {
			System.out.println("Connection not opened");
		}
	}

}