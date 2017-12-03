





<% 

if(session.getAttribute("userId") == null){
response.sendRedirect("login.html");
}else{
response.sendRedirect("order.jsp");
}
%>



