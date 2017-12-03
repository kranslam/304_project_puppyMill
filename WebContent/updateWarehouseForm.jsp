<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Warehouse</title>
<h1>Update Warehouse</h1></head>
<body>
<%

session = request.getSession();
String admin = (String)session.getAttribute("admin");
if(admin == null){
	response.sendRedirect("Mainpage.jsp");
}

%>

<form action="UpdateWarehouse" method="post">

<input type="text" name="warehouseID" placeholder="warehouseID"> </input>	
<br>
<input type="text" name="addressID" placeholder="addressID"> </input>	
<h5>If you would like to delete from the database, only warehouseID is needed.</h5>
<input type="checkbox" name="delete" value="delete">Delete from database?</input>	
<br>	
<br>
<button type="submit">Submit</button>

</form>
</body>
</html>