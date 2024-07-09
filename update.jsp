<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% ResultSet rs = (ResultSet) request.getAttribute("rs");
if(rs.next()){
	%>
	<form action="update" method="post">
		<label for="id">ID: </label> 
		<input type="number" readonly="readonly" id="id" name="id" value="<%= rs.getInt(1)%>">
	    <br> 
	    <label for="name">Name: </label> 
	    <input type="text" id="name" name="name" value="<%= rs.getString(2)%>"> 
	    <br> 
	    <label for="price">Price: </label> 
	    <input type="text" id="price" name="price" value="<%= rs.getDouble(3)%>"> 
	    <br> 
	    <label for="brand">Brand: </label> 
	    <input type="text" id="brand" name="brand" value="<%= rs.getString(4)%>"> 
	    <br> 
	    <label for="desc">Description: </label> 
	    <input type="text" id="desc" name="desc" value="<%= rs.getString(5)%>"> 
	    <br>
		<button type="submit">Update Product</button>
	</form>
		<%	
}
%>
</body>
</html>