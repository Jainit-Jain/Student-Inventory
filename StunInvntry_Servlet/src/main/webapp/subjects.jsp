<%@page import="com.jsp.servlet.stuninvntry.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Subjects</title>
    <style>
        /* Global Styles */
        body {
            font-family: Open Sans, sans-serif;
            background-color: #f9f9f9;
        }
        
        /* Header Styles */
        h1 {
            font-size: 24px;
            color: #3498db;
            margin-bottom: 20px;
        }
        
        /* List Styles */
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        li {
            margin-bottom: 10px;
        }
        
        a {
            text-decoration: none;
            color: #3498db;
        }
        
        a:hover {
            color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>Subjects</h1>
    <%
        String course = (String) request.getAttribute("course");
        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM subjects WHERE course_id = (SELECT course_id FROM courses WHERE course_name = ?)");
        pstmt.setString(1, course);
        ResultSet rs = pstmt.executeQuery();
    %>
    <ul>
        <% while (rs.next()) { %>
            <li><a href="SubjectServlet?subject=<%= rs.getString("subject_name") %>"><%= rs.getString("subject_name") %></a></li>
        <% } %>
    </ul>
</body>
</html>