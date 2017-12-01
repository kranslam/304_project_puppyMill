<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<% 

session = request.getSession(true);

session.setAttribute("userId", 01);
session.setAttribute("username", "David");

response.sendRedirect("Mainpage.jsp");


%>