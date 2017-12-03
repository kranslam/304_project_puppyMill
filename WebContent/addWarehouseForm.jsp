<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Warehouse</title>
<h1>Add Warehouse</h1></head>
<body>
<%

session = request.getSession();
String admin = (String)session.getAttribute("admin");
if(admin == null){
	response.sendRedirect("Mainpage.jsp");
}

%>


<form action="InsertWarehouse" method="post">

<input type="text" name="warehouseID" placeholder="warehouseID"> </input>	
<br>
<h1>Address Info</h1>
<input type="text" name="addressID" placeholder="addressID"> </input>	
<br>
<input type="text" name="streetAddress" placeholder="streetAddress"> </input>	
<br>			
<input type="text" name="country" placeholder="country"> </input>	
<br>		
<input type="text" name="provinceState" placeholder="provinceState"> </input>	
<br>		
<input type="text" name="postalZIP" placeholder="postalZIP"> </input>			
<br>		

<button type="submit">Submit</button>
</form>


</body>
</html>