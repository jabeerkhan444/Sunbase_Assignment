<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.util.JDBC_Connection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333333;
        }
        input[type="text"], input[type="email"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #dddddd;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"], .back-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }
        input[type="submit"]:hover, .back-link:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update Student</h2>
    <%
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.isEmpty()) {
        out.println("Invalid student ID");
        return;
    }

    int id = Integer.parseInt(idParam);
    String name = "";
    String email = "";
    int age = 0;

    try (Connection connection = JDBC_Connection.getConnection()) {
        String sql = "SELECT * FROM students WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            name = resultSet.getString("name");
            email = resultSet.getString("email");
            age = resultSet.getInt("age");
        } else {
            out.println("No student found with ID: " + id);
            return;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
    <form action="update" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="<%= name %>" required><br>
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="<%= email %>" required><br>
        <label for="age">Age:</label>
        <input type="number" name="age" id="age" value="<%= age %>" required><br>
        <input type="submit" value="Update">
    </form>
    <a href="list" class="back-link">Back to List</a>
</div>
</body>
</html>
