<%@ page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ include file="jdbc.jsp"%>

<html>
<head>
<title>Your PuppyMills Order</title>
</head>
<body>



	<%
// Get customer id
	session = request.getSession(true);
	 int ordrId=0; 	

String custId = (String)session.getAttribute("userId");
	System.out.println("Customer ID: " + custId);
// Get password
//String password = request.getParameter("password");
// Get shopping cart
	

@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");
      
try 
{	
	if (session.getAttribute("userId") == null || session.getAttribute("userId").equals(""))
		response.sendRedirect("login.html");
	else if (productList == null)
		out.println("<h1>Your shopping cart is empty!</h1>");
	else
	{	
		// Check if customer id is a number
		int num=-1;
		try
		{
			num = Integer.parseInt(custId);
		} 
		catch(Exception e)
		{
			out.println("<h1>Congratz homie somehow you got to this page that shouldnt exist have a gold star.</h1>");
			return;
		}		
        
		// Get database connection
     getConnection();
	                		
        String sql = "SELECT accountNum, name FROM Account WHERE accountNum = ?";	
				      
   		con = DriverManager.getConnection(url, uid, pw);
   		PreparedStatement pstmt = con.prepareStatement(sql);
   		pstmt.setInt(1, num);
   	
   		ResultSet rst = pstmt.executeQuery();
   		int orderId=0;
   		String custName = "";

   		if (!rst.next())
   		{
   			out.println("<h1>Go back to the previous page and try again.</h1>");
   		}
   		else
   		{	
   			custName = rst.getString(2);
			
   			 		
		
			
	
   			// Enter order information into database
   			sql = "INSERT INTO Orders (accountNum, totalAmount) VALUES (?,?)";

   			// Retrieve auto-generated key for orderId
   			pstmt = con.prepareStatement(sql);
   			pstmt.setInt(1, num);
   			pstmt.setDouble(2,0);
   			pstmt.executeUpdate();

   			out.println("<h1>Your Order Summary</h1>");
         	  	out.println("<table><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Subtotal</th></tr>");

           	double total =0;
           	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
           	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
						
           	while (iterator.hasNext())
           	{ 
           		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
                   ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
   				String productId = (String) product.get(0);
                   out.print("<tr><td>"+productId+"</td>");
                   out.print("<td>"+product.get(1)+"</td>");
   				out.print("<td align=\"center\">"+product.get(3)+"</td>");
                   String price = (String) product.get(2);
                   double pr = Double.parseDouble(price);
                   int qty = ( (Integer)product.get(3)).intValue();
   				out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
                  	out.print("<td align=\"right\">"+currFormat.format(pr*qty)+"</td></tr>");
                   out.println("</tr>");
                   total = total +(pr*qty);
				sql = "SELECT orderID FROM Orders ORDER BY orderID DESC LIMIT 1";
				pstmt = con.prepareStatement(sql);
				ResultSet rst2 = pstmt.executeQuery();
				
				while(rst2.next()){
   				sql = "INSERT INTO OrderedProduct VALUES(?, ?, ?, ?)";
   				pstmt = con.prepareStatement(sql);
   				pstmt.setInt(1, rst2.getInt("orderID"));
   				ordrId = rst2.getInt("orderID");
   				pstmt.setInt(2, Integer.parseInt(productId));
   				pstmt.setInt(3, qty);
   				pstmt.setString(4, price);
   				pstmt.executeUpdate();
				}
           	}
           	double tax = total*1.1;
           	double tax2 = total*0.1;
           	double shipping = 25;
        	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Tax</b></td>"
                  	+"<td aling=\"right\">"+currFormat.format(tax2)+"</td></tr>"); 
        	
        	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Shipping</b></td>"
                  	+"<td aling=\"right\">"+currFormat.format(shipping)+"</td></tr>");
        	
        	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
                          	+"<td aling=\"right\">"+currFormat.format(tax+shipping)+"</td></tr>");
           	out.println("</table>");

   			// Update order total
   			sql = "UPDATE Orders SET totalAmount=? WHERE orderID=?";
   			pstmt = con.prepareStatement(sql);
   			pstmt.setDouble(1, total);
   			pstmt.setInt(2, orderId);			
   			pstmt.executeUpdate();			
   			
   			sql = "SELECT cardNumber, cardHolderName FROM CreditCard WHERE paymentID = (SELECT paymentID FROM Payment WHERE accountNum =?)";

   			pstmt = con.prepareStatement(sql);
   			pstmt.setInt(1, num);
   			rst = pstmt.executeQuery();
   			while(rst.next()){
   			 
   			
   			out.println("<h1>Order completed.  Will be shipped soon...</h1>");
   			out.println("<h1>Your order reference number is: " +ordrId +"</h1>");
   			out.println("<h1>Paid With: "+rst.getString("cardNumber")+"</h1>");
   			out.println("<h1>Card Holder: "+rst.getString("cardHolderName")+"</h1>");
   			out.println("<h1>Shipping to customer: "+custId+" Name: "+custName+"</h1>");
   			out.println("<h1>Teleportation will be occuring shortly</h1>");
   			}
   			
   			
   			// Clear session variables (cart)
   			session.setAttribute("productList", null);    
   	
 




  	try
	{
		if (con != null)
			con.close();
	}
	catch (SQLException ex)
	{       out.println(ex);
	}
   		}
	}
  
}   catch (SQLException ex)
{ 	out.println(ex);
}
%>

	<h2>
		<a href="Mainpage.jsp">Back to Main Page</a>
	</h2>

</body>
</html>
