<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome to Faculty Login</h1>
    <form action="facultyvalidate.jsp" method="post">
        Enter UserName<input type="text" name="fu"><br>
        Enter Password<input type="password" name="fp"><br>
        <input type="submit" value="Login">
    </form>
    
    
</body>
</html>