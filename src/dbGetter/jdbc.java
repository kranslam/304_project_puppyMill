package dbGetter;

import java.sql.*;

public class jdbc {
//	 private String url = "jdbc:mysql://localhost/shipment";
//	 private String uid = "root";
//	 private String pw = "password";
	private String url = "jdbc:mysql://cosc304.ok.ubc.ca/group5";
	private String uid = "group5";
	private String pw = "group5";
	// Connection
	private Connection con = null;

	public Connection getConnection() throws SQLException {
		// Note: Forces loading of SQL Server driver
		try { // Load driver class
			Class.forName("com.mysql.jdbc.Driver");
		} catch (java.lang.ClassNotFoundException e) {
			System.out.println("ClassNotFoundException: " + e);
		}
		return (con = DriverManager.getConnection(url, uid, pw));
	}

	public void closeConnection() throws SQLException {
		if (con != null)
			con.close();
		con = null;
	}

}
