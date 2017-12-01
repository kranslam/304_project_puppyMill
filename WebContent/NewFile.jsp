<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json"%>


<%


/* 	// Get product name to search for
String name = request.getParameter("productName");
String category = request.getParameter("categoryName");

boolean hasNameParam = name != null && !name.equals("");
boolean hasCategoryParam = category != null && !category.equals("") && !category.equals("All");
String filter = "", sql = "";

if (hasNameParam && hasCategoryParam)
{
	//filter = "<h3>Products containing '"+name+"' in category: '"+category+"'</h3>";
	name = '%'+name+'%';
	sql = "SELECT productId, breed, price, category, description FROM Products WHERE breed LIKE ? AND category = ?";
}
else if (hasNameParam)
{
	//filter = "<h3>Products containing '"+name+"'</h3>";
	name = '%'+name+'%';
	sql = "SELECT productId, breed, price, category, description FROM Products WHERE breed LIKE ?";
}
else if (hasCategoryParam)
{
	//filter = "<h3>Products in category: '"+category+"'</h3>";
	sql = "SELECT productId, breed, price, category, description FROM Products WHERE category = ?";
}
else
{
	//filter = "<h3>All Products</h3>";
	sql = "SELECT * FROM Products";
}
 */
	String sql = "SELECT * FROM Products";

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{
	getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	/* if (hasNameParam)
	{
		pstmt.setString(1, name);	
		if (hasCategoryParam)
		{
			pstmt.setString(2, category);
		}
	}
	else if (hasCategoryParam)
	{
		pstmt.setString(1, category);
	} */
	
	ResultSet rst = pstmt.executeQuery();
	
	while (rst.next()) 
	{
		int pid = rst.getInt(1);
		String itemCategory = rst.getString(4);		
		Double price = rst.getDouble(2);
		String pName = rst.getString(3);
		String desc = rst.getString(5);		
	
		request.setAttribute("pid", pid);
		request.setAttribute("itemCategory", itemCategory);
		request.setAttribute("price", price);
		request.setAttribute("pName", pName);
		request.setAttribute("desc", desc);

	
//		out.print("<%@ taglib prefix=\"json\" uri=\"http://www.atg.com/taglibs/json\"%");
		out.print("<json:object>");
		out.print("<json:property name=\"productID\" value=\"${pid}\"/>");
		out.print("<json:property name=\"category\" value=\"${itemCategory}\"/>");
		out.print("<json:property name=\"price\" value=\"${price}\"/>");
		out.print("<json:property name=\"breed\" value=\"${pName}\"/>");
		out.print("<json:property name=\"description\" value=\"${desc}\"/> ");
		out.print("</json:object>");
	}
	closeConnection();
} catch (SQLException ex) {
	out.println(ex);
}finally{
}
%>
