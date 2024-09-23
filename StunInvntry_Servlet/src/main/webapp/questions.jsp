<%@page import="com.jsp.servlet.stuninvntry.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Questions</title>
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
            margin-bottom: 20px;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        
        li:last-child {
            border-bottom: none;
        }
        
        /* Question and Answer Styles */
        .question {
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .answer {
            color: #666;
        }
    </style>
</head>
<body>
    <h1>Questions</h1>
    <%
        String topic = (String) request.getAttribute("topic");
        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM questions WHERE topic_id = (SELECT topic_id FROM topics WHERE topic_name = ?)");
        pstmt.setString(1, topic);
        ResultSet rs = pstmt.executeQuery();
    %>
    <ul>
        <% while (rs.next()) { %>
            <li>
                <span class="question"><%= rs.getString("question_text") %></span>
                <br>
                <span class="answer"><%= rs.getString("answer") %></span>
            </li>
        <% } %>
    </ul>
</body>
</html>