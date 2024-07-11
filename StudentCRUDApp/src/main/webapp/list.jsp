<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        .header {
            background: #4CAF50;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            overflow: hidden;
        }
        .header h1 {
            float: left;
            margin-left: 20px;
            color: #fff;
        }
        .header ul {
            float: right;
            list-style: none;
            margin-right: 20px;
        }
        .header ul li {
            display: inline;
            margin-left: 10px;
        }
        .header ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        .header ul li a:hover {
            text-decoration: underline;
        }
        .search-container {
            margin: 20px 0;
            text-align: center;
        }
        .search-container form {
            display: inline-block;
        }
        .search-container input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search-container button {
            padding: 10px 15px;
            font-size: 16px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }
        .search-container button:hover {
            background-color: white;
            color: Black;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        .actions a {
            display: inline-block;
            padding: 6px 12px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 5px;
            transition: background-color 0.3s;
        }
        .actions a:hover {
            background-color: #0056b3;
        }
        .actions a.delete {
            background-color: #d9534f;
        }
        .actions a.delete:hover {
            background-color: #c9302c;
        }
        .add-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }
        .add-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Student Management System</h1>

    <div class="search-container">
        <form action="search" method="get">
            <input type="text" placeholder="Search by name..." name="search" required="required">
            <button type="submit">Search</button>
        </form>
    </div>
    </div>
    <h2>Student List</h2>
    <a href="add.jsp" class="add-button">Add New Student</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Age</th>
            <th>Actions</th>
        </tr>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("resultSet");
            try {
                if (rs != null) {
                    while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getInt("age") %></td>
            <td class="actions">
                <a href="update.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                <a href="delete?id=<%= rs.getInt("id") %>" class="delete">Delete</a>
            </td>
        </tr>
        <%
                    }
                } else {
        %>
        <tr>
            <td colspan="5">No records found</td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>
</body>
</html>
