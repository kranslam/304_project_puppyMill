<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Product</title>
<h1>Add Product</h1></head>
<body>
<%

session = request.getSession();
String admin = (String)session.getAttribute("admin");
if(admin == null){
	response.sendRedirect("Mainpage.jsp");
}

%>

<form action="InsertProduct" method="post">

<input type="text" name="picture" placeholder="picture filepath"> </input>	
<br>			
<input type="text" name="price" placeholder="price"> </input>	
<br>		
<input type="text" name="breed" placeholder="breed"> </input>	
<br>		
<input type="text" name="category" placeholder="category"> </input>			
<br>		
<input type="text" name="description" placeholder="description"> </input>			
<br>
<button type="submit">Submit</button>

</form>



</body>
</html>