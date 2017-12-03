<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Customer</title>
<h1>Update Customer</h1></head>
<body>
<%

session = request.getSession();
String admin = (String)session.getAttribute("admin");
if(admin == null){
	response.sendRedirect("Mainpage.jsp");
}

%>

<form action="UpdateCustomer" method="post">

<input type="text" name="accountNum" placeholder="accountNum"> </input>	
<br>
<input type="text" name="name" placeholder="name"> </input>	
<br>			
<input type="text" name="phone" placeholder="phone"> </input>	
<br>		
<input type="text" name="email" placeholder="email"> </input>	
<br>		
<input type="text" name="password" placeholder="password"> </input>			
<br>		
<input type="text" name="accType" placeholder="accType"> </input>			
<br>
<input type="text" name="empID" placeholder="empID"> </input>			
<h5>If you would like to delete from the database, only accountNum is needed.</h5>
<input type="checkbox" name="delete" value="delete">Delete from database?</input>	
<br>	
<br>
<button type="submit">Submit</button>

</form>
</body>
</html>