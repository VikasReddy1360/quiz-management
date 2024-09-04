<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%
    String url = "jdbc:mysql://localhost:3306/ttprojectquiz";
    String usernameDB = "root";
    String passwordDB = "tiger";
    String si = request.getParameter("si");
    String sn=request.getParameter("sn");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    boolean isAuthenticated = false;
    try {
    	String stid=request.getParameter("si");
    	session.setAttribute("sid",stid);
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, usernameDB, passwordDB);
        String sql = "SELECT * FROM student WHERE sid=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, si);
        rs = stmt.executeQuery();
        if (rs.next()) {
        	out.print("wrong");
        }
        else
        {
        	stmt.executeUpdate("INSERT INTO student VALUES ('"+si+"', '"+sn+");");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
        response.sendRedirect("facultydash.jsp");
    
%>