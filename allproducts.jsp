<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>
<style>
h2 {
	text-align: center;
	color: blue;
}

table {
	width: 50%;
	margin: 20px auto;
	background-color: red;
	color: white;
	border-collapse: collapse;
}

td {
	text-align: center;
}

button {
	cursor: pointer;
}

a {
	list-style-type: none;
	text-decoration: none;
}
</style>
</head>
<body>
	<h2>All Products</h2>
	<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
	%>
	
	<a href="create_product_page"><button>Add Product</button></a>
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>price</th>
			<th>brand</th>
			<th>description</th>
			<th colspan="2">Action</th>
		</tr>

		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getDouble(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><a href="deleteproduct?id=<%=rs.getInt(1)%>"><button>Delete</button></a></td>
			<td><a href="updateproduct?id=<%=rs.getInt(1)%>"><button>Update</button></a></td>
		</tr>
		<%
		}
		%>

	</table>
</body>
</html>