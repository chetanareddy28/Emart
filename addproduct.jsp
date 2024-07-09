<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addproduct" method="post">
	<label for="id">ID: </label>
	<input type="text" id="id" name="id">
	<br>
	<label for="name">Name: </label>
	<input type="text" id="name" name="name">
	<br>
	<label for="price">Price: </label>
	<input type="text" id="price" name="price">
	<br>
	<label for="brand">Brand: </label>
	<input type="text" id="brand" name="brand">
	<br>
	<label for="desc">Description: </label>
	<input type="text" id="desc" name="desc">
	<br>
		<button type="submit">Add</button>
	</form>
</body>
</body>
</html>