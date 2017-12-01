<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json"%>


<%

String sql = "SELECT * FROM Products";

NumberFormat currFormat = NumberFormat.getCurrencyInstance();
StringBuilder sb = new StringBuilder();

		int pid = 1;
		String itemCategory = "dog";		
		Double price = 23.0;
		String pName = "chow";
		String desc = "floof";	
		request.setAttribute("pid", pid); 
		try 
		{
			getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
	
			ResultSet rst = pstmt.executeQuery();

			out.print("<%@ taglib prefix="+"\"json\" uri=\"http:"+"//www.atg.com/taglibs/json\""+"%"+">");

			while (rst.next()) 
			{
				 pid = rst.getInt(1);
				 itemCategory = rst.getString(4);		
				 price = rst.getDouble(2);
				 pName = rst.getString(3);
				 desc = rst.getString(5);		
				
				 sb.append("{\"productID\":\""+pid+"\",");
				 sb.append("\"category\":"+itemCategory+"");
			
				 
				 
			/* 	request.setAttribute("pid", pid);
				request.setAttribute("itemCategory", itemCategory);
				request.setAttribute("price", price);
				request.setAttribute("pName", pName);
				request.setAttribute("desc", desc); */

			
			/* 	out.print("<json:object>");
				out.print("<json:property name=\"productID\" value=\"${pid}\"/>");
				out.print("<json:property name=\"category\" value=\"${itemCategory}\"/>");
				out.print("<json:property name=\"price\" value=\"${price}\"/>");
				out.print("<json:property name=\"breed\" value=\"${pName}\"/>");
				out.print("<json:property name=\"description\" value=\"${desc}\"/> ");
				out.print("</json:object>"); */
			} 
			closeConnection();
		} catch (SQLException ex) {
			out.println(ex);
		}
		%>
		
 <%-- <%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>

		<json:object>
		<json:property name="productID" value="${pid}"/>
		<<json:property name="category\"value=\""+itemCategory+"\"/>
		<json:property name="price\"value=\""+price+"\"/>
		<json:property name="breed\"value=\""+pName+"\"/>
		<json:property name="description\"value=\""+desc+"\"/> 
		</json:object>

 --%>