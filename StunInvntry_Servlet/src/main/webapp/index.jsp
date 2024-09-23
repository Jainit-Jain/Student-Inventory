<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Inventory</title>
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
        
        /* Form Styles */
        form {
            max-width: 400px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #e5e5e5;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        input[type="text"] {
            width: 100%;
            height: 40px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #e5e5e5;
            border-radius: 5px;
        }
        
        input[type="submit"] {
            background-color: #3498db;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>Student Inventory</h1>
    <form action="RegistrationServlet" method="get">
        <input type="text" name="registrationNumber" placeholder="Enter Registration Number">
        <input type="submit" value="Submit">
    </form>
</body>
</html>