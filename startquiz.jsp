<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Start Quiz</title>
</head>
<body>
    <h2>Quiz Questions</h2>
    
    <form action="submitquiz.jsp" method="post">
        <%
        String url = "jdbc:mysql://localhost:3306/ttprojectquiz";
        String usernameDB = "root";
        String passwordDB = "tiger";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, usernameDB, passwordDB);
            String selectQuery = "SELECT * FROM questions";
            pstmt = conn.prepareStatement(selectQuery);
            rs = pstmt.executeQuery();
            int j=1;
            	while(rs.next()){
                String que = rs.getString("q");
                out.println("<p>"+que+"</p>");
                for (int i = 1; i <=4; i++) {
                	String option=rs.getString("op"+i);
                	out.println("<input type='radio' value='" + i + "' name='choosen"+j+"'> " + option + "<br>");
                }
                out.println("<br>");
                j++;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                try { rs.close(); } catch (SQLException e) {}
            }
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) {}
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) {}
            }
        }
        %>
        <input type="submit" value="Submit Quiz">
    </form>
</body>
</html>
