<!--
A JSP file that encapsulates all database access.

Public methods:
- public void getConnection() throws SQLException
- public ResultSet executeQuery(String query) throws SQLException
- public void executeUpdate(String query) throws SQLException
- public void closeConnection() throws SQLException  

-->

<%@ page import="java.sql.*"%>

<%!
	// User id, password, and server information

	private String url = "jdbc:mysql://cosc304.ok.ubc.ca/";
	private String uid = "";
	private String pw = "";
	// Connection
	private Connection con = null;
%>

<%!
	public void getConnection() throws SQLException 
	{
		// Note: Forces loading of SQL Server driver
		try
		{	// Load driver class
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (java.lang.ClassNotFoundException e)
		{
			System.out.println("ClassNotFoundException: " +e);
		}
		con = DriverManager.getConnection(url, uid, pw);
	}
   
	public void closeConnection() throws SQLException 
	{
		if (con != null)
			con.close();
		con = null;
	}
%>
