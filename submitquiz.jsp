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
    <form action="studentdash.jsp" method="get">
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
            int sum=0;
            String sid=(String)session.getAttribute("sid");
            out.println("student "+sid+" marks <br>");
            rs=st.executeQuery("select * from questions");
            int i=1;
            while(rs.next())
            {
            	int copt=rs.getInt("co");
            	int chopt=Integer.parseInt(request.getParameter("choosen"+i));
            	if(chopt==copt)
            		sum+=1;
            	i++;
            }
            out.println("result: "+sum+"<br>");
            st.execute("insert into results values('"+sid+"',"+sum+");");
            st.executeUpdate("update student set sm="+sum+" where sid='"+sid+"'");
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