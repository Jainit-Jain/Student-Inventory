<%@page import="com.jsp.servlet.stuninvntry.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Topics</title>
<style>
/* Global Styles */
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

/* Container Styles */
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

/* Topic Styles */
.topic {
	margin-bottom: 20px;
}

.topic-name {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>Topics</h1>
		</div>
		<%
		String subject = (String) request.getAttribute("subject");
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(
				"SELECT * FROM topics WHERE subject_id = (SELECT subject_id FROM subjects WHERE subject_name = ?)");
		pstmt.setString(1, subject);
		ResultSet rs = pstmt.executeQuery();
		%>
		<ul>
			<%
			while (rs.next()) {
			%>
			<li class="topic"><a
				href="TopicServlet?topic=<%=rs.getString("topic_name")%>"> <span
					class="topic-name"><%=rs.getString("topic_name")%></span>
			</a></li>
			<%
			}
			%>
		</ul>
	</div>
</body>
</html>