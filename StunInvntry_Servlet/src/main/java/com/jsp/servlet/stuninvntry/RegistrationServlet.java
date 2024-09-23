package com.jsp.servlet.stuninvntry;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String registrationNumber = request.getParameter("registrationNumber");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection(); 
            pstmt = conn.prepareStatement(
                    "SELECT c.course_name " +
                    "FROM courses c " +
                    "JOIN students s ON c.course_id = s.course_id " +
                    "WHERE s.usn = ?"
            );

            pstmt.setString(1, registrationNumber);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String courseName = rs.getString("course_name");
                request.setAttribute("courseName", courseName);
            } else {
                request.setAttribute("errorMessage", "USN not found.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred.");
        } finally {  // Ensure resources are closed 
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace(); 
            }
        }

        request.getRequestDispatcher("course.jsp").forward(request, response);
    }
}