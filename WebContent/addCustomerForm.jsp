<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Customer</title>
<h1>Add Customer</h1></head>
<body>
<%

session = request.getSession();
String admin = (String)session.getAttribute("admin");
if(admin == null){
	response.sendRedirect("Mainpage.jsp");
}

%>

<form action="InsertAccount" method="post">

<h1>Account Info</h1>
<input type="text" name="name" placeholder="name"> </input>	
<br>			
<input type="text" name="phone" placeholder="phone"> </input>	
<br>		
<input type="text" name="email" placeholder="email"> </input>	
<br>		
<input type="text" name="password" placeholder="password"> </input>			
<br>		
<!-- 
<h1>Payment Info</h1>
<input type="text" name="cardNum" placeholder="cardNum"> </input>	
<br>			
<input type="text" name="expDate" placeholder="yyyy-mm-00"> </input>	
<br>		
<input type="text" name="securityCode" placeholder="securityCode"> </input>	
<br>		
<input type="text" name="cardHolderName" placeholder="cardHolderName"> </input>			
<br>		
<input type="text" name="cardType" placeholder="cardType"> </input>			
<br>
 -->
<h1>Address Info</h1>
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