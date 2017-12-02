<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator</title>
<h1>Administrator Portal</h1>
</head>
<body>

<%-- <%

session = request.getSession();
String admin = (String)session.getAttribute("admin");
if(admin == null){
	response.sendRedirect("Mainpage.jsp");
}

%>
 --%>
<h1><a href="listAllCust.jsp">See All Accounts</a><h1>
<h1><a href="listorder.jsp">Sales Report</a><h1>
<h1><a href="addProductForm.jsp">Add product</a><h1>
<h1><a href="addWarehouseForm.jsp">Add Warehouse</a><h1>
<h1><a href="addCustomerForm.jsp">Add Customer</a><h1>
<h1><a href="updateProductForm.jsp">Update/delete Product</a><h1>
<h1><a href="updateCustomerForm.jsp">Update/delete Customer</a><h1>
<h1><a href="updateWarehouseForm.jsp">Update/delete Warehouse</a><h1>



</body>
</html>