<%@page import="com.jsp.servlet.stuninvntry.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Course</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
}

h1 {
	font-size: 36px;
	color: #333;
	margin-bottom: 20px;
	text-align: center;
}

h2 {
	font-size: 24px;
	color: #666;
	margin-bottom: 10px;
}

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
	color: #337ab7;
}

a:hover {
	color: #23527c;
}

.error-message {
	color: #e74c3c;
	font-size: 14px;
	margin-bottom: 10px;
}

.success-message {
	color: #2ecc71;
	font-size: 14px;
	margin-bottom: 10px;
}

.container {
	max-width: 800px;
	margin: 40px auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Header Styles */
.header {
	background-color: #337ab7;
	color: #fff;
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #337ab7;
}

/* Course Styles */
.course {
	margin-bottom: 20px;
}

.course-name {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

.subject {
	margin-bottom: 10px;
}

.subject-name {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>Course</h1>
		</div>
		<%
		if (request.getAttribute("errorMessage") != null) {
		%>
		<p class="error-message"><%=request.getAttribute("errorMessage")%></p>
		<%
		} else {
		%>
		<div class="course">
			<p class="course-name">
				You are enrolled in: <b><%=request.getAttribute("courseName")%></b>
			</p>
			<h2>Subjects:</h2>
			<ul>
				<%
				String courseName = (String) request.getAttribute("courseName");
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(
						"SELECT * FROM subjects WHERE course_id = (SELECT course_id FROM courses WHERE course_name = ?)");
				pstmt.setString(1, courseName);
				ResultSet rs = pstmt.executeQuery();
				%>
				<%
				while (rs.next()) {
				%>
				<li class="subject"><a
					href="SubjectServlet?subject=<%=rs.getString("subject_name")%>">
						<span class="subject-name"><%=rs.getString("subject_name")%></span>
				</a></li>
				<%
				}
				%>
			</ul>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>