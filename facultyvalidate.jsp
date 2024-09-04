<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%
    String url = "jdbc:mysql://localhost:3306/ttprojectquiz";
    String usernameDB = "root";
    String passwordDB = "tiger";
    String fu = request.getParameter("fu");
    String fp = request.getParameter("fp");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    boolean isAuthenticated = false;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, usernameDB, passwordDB);
        String sql = "SELECT * FROM faculty WHERE fun = ? AND fpas = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, fu);
        stmt.setString(2, fp);
        rs = stmt.executeQuery();
        if (rs.next()) {
            isAuthenticated = true;
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
    if (isAuthenticated) {
        response.sendRedirect("facultydash.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>