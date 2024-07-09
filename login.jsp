<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<form action="login" method="post">
		<label for="uname">email: </label>
	<input type="email" id="email" name="email" placeholder="Enter the email">
	<br>
	<label for="password">password: </label>
	<input type="password" id="password" name="password" placeholder="Enter the password">
	<br>
	<button type="submit">Login</button>
	</form>
</body>

</html>