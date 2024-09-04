<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Exam</title>
</head>
<body>
    <form action="newexam.jsp" method="post">
        <%
        	out.println("<h3>Enter no.of Questions:</h3>");
        	out.print("<input type='number' name='nq' ><br>");
     %>
        
        <input type="submit" value="proceed">
    </form>
</body>
</html>