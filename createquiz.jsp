<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Quiz</title>
</head>
<body>
    <%
    String url = "jdbc:mysql://localhost:3306/ttprojectquiz";
    String usernameDB = "root";
    String passwordDB = "tiger";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
        	
        	int noq=(Integer)session.getAttribute("noq");
        	int[] correctopt = new int[noq];
            for (int i = 0; i < noq; i++) { // Example loop
                int copt = Integer.parseInt(request.getParameter("correctOption_"+i));
                correctopt[i]=copt;
            }
            session.setAttribute("correctoption", correctopt);
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, usernameDB, passwordDB);
            Statement st=conn.createStatement();
            for (int i = 0; i < noq; i++) {
            	String question=request.getParameter("question_"+i);
            	String option[]=new String[4];
            	for(int j=0;j<4;j++)
            	{
            		option[j]=request.getParameter("option_"+i+"_"+j);
            	}
            	int correctoption=Integer.parseInt(request.getParameter("correctOption_"+i));
            	st.executeUpdate("INSERT INTO `ttprojectquiz`.`questions` (`q`, `op1`, `op3`, `op2`, `op4`, `co`) VALUES ('"+question+"', '"+option[0]+"', '"+option[1]+"', '"+option[2]+"', '"+option[3]+"', "+correctoption+");");

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException e) {}
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) {}
            }
        }
    %>
    
    <%
        response.sendRedirect("facultydash.jsp");
    %>
</body>
</html>
