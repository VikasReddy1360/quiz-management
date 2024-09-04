<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>results of quiz</title>
</head>
<body>
    <h2>Results</h2>
    <form action="facultydash.jsp" method="get">
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
            Statement st=conn.createStatement();
            rs=st.executeQuery("select * from results");
            out.println("<style>");
            out.println("table { border-collapse: collapse; width: 10%; }");
            out.println("th, td { border: 1px solid black; padding: 8px; }");
            out.println("</style>");
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>student id</th>");
            out.println("<th>marks</th>");
            out.println("</tr>");

            while(rs.next())
            {
            	out.println("<tr>");
                out.println("<td>"+rs.getString("sid")+"</td>");
                out.println("<td>"+rs.getInt("m")+"</td>");
                out.println("</tr>");
            }
            out.println("</table><br>");
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
        <input type="submit" value="Return to home">
    </form>
</body>
</html>