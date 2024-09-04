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
    <h2>Create New Exam</h2>
    <form action="createquiz.jsp" method="post">
        
        <%
        		int nq=Integer.parseInt(request.getParameter("nq"));
        		session.setAttribute("noq",nq);
        		out.println("<h3>Enter "+nq+" Questions and options:</h3>");
  		        for (int i = 0; i < nq; i++) {
                // Retrieve question
                out.println("<label for='question_" + i + "'>Question " + (i + 1) + ":</label>");
                out.println("<input type='text' id='question_" + i + "' name='question_" + i + "' ><br>");
                
                // Retrieve options
                for (int j = 0; j < 4; j++) {
                    out.println("<label for='option_" + i + "_" + j + "'>Option " + (j + 1) + ":</label>");
                    out.println("<input type='text' id='option_" + i + "_" + j + "' name='option_" + i + "_" + j + "' ><br>");
                }
                
                // Retrieve correct option
                out.println("<label for='correctOption_" + i + "'>Correct Option:</label>");
                out.println("<input type='number' id='correctOption_" + i + "' name='correctOption_" + i + "' min='1' max='4' ><br><br>");
            }
        
     %>
        
        <input type="submit" value="Create Quiz">
    </form>
</body>
</html>