<%@ page import="java.text.NumberFormat"%>
<%@ include file="jdbc.jsp"%>

<html>
<head>
<title>Ray's Grocery Order List</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<h1>List of All Customers</h1>


	<%
		String sql = "SELECT accountNum, name, phone, email, accType FROM Account";

		NumberFormat currFormat = NumberFormat.getCurrencyInstance();

		try {
			getConnection();
			ResultSet rst = con.createStatement().executeQuery(sql);
			out.println("<table class=\"table\" border=\"1\">");
			out.print("<tr><<th>Customer Id</th><th>Customer Name</th><th>Phone</th><th>Email</th><th>Account Type</th></tr>");

			// Note: This version requires only one query rather than one for each order.  More efficient if listing all orders.
			while (rst.next()) {

				int custId = rst.getInt(1);

				out.print("<tr><td>" + custId + "</td>");

				out.print("<td>" + rst.getString(2) + "</td>");
				out.print("<td>" + rst.getInt(3) + "</td>");
				out.print("<td>" + rst.getString(4) + "</td>");
				out.print("<td>" + rst.getString(5) + "</td>");
				out.println("</tr>");

			}

			out.println("</table>");
		} catch (SQLException ex) {
			out.println(ex);
		} finally {
			try {
				closeConnection();
			} catch (SQLException ex) {
				out.println(ex);
			}
		}
	%>
	<h1>
		<a href="Mainpage.jsp">Go Back to Home Page.</a>
		<h1>
</body>
</html>


