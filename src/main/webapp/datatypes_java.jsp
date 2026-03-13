<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) userSession.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Java - Data Types</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background-color: #2c3e50;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .navbar a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 10px 15px;
            margin: 0 5px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .navbar a:hover {
            background-color: #34495e;
        }
        .sidebar {
            width: 250px;
            background-color: #34495e;
            padding-top: 70px;
            position: fixed;
            height: 100%;
            top: 50px;
            left: 0;
            overflow-y: auto;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            font-size: 18px;
            border-bottom: 1px solid #2c3e50;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background-color: #2c3e50;
        }
        .main-content {
            margin-left: 270px;
            padding: 20px;
            margin-top: 70px;
        }
        .content-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }
        .content-section h3 {
            color: #2c3e50;
        }
        .button-container {
            text-align: left;
            margin-top: 20px;
        }
        .button-container a {
            text-decoration: none;
            padding: 12px 25px;
            background-color: #3498db;
            color: white;
            border-radius: 25px;
            font-size: 18px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .button-container a:hover {
            background-color: #2980b9;
            transform: scale(1.1);
        }
        .button-container2{
            text-align: right;
            margin-top: -30px;
        }
        .button-container2 a {
            text-decoration: none;
            padding: 12px 25px;
            background-color: #3498db;
            color: white;
            border-radius: 25px;
            font-size: 18px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .button-container2 a:hover {
            background-color: #2980b9;
            transform: scale(1.1);
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="nav-links">
        <a href="user_dashboard.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="cpp.jsp"><i class="fas fa-code"></i> C++</a>
        <a href="c.jsp"><i class="fas fa-terminal"></i> C</a>
        <a href="python.jsp"><i class="fab fa-python"></i> Python</a>
        <a href="java.jsp"><i class="fab fa-java"></i> Java</a>
        <a href="database.jsp"><i class="fas fa-database"></i> Database</a>
    </div>
    <a href="logout.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<div class="sidebar">
    <a href="java.jsp">Java Introduction</a>
    <a href="#datatypes">Java Datatypes</a>
    <a href="java_casting.jsp">Type Casting</a>
    <a href="java_operators.jsp">Operators</a>
    <a href="java_loops.jsp">Loops</a>
    <a href="java_arrays.jsp">Arrays</a>
    <a href="java_oops.jsp">Object-Oriented Programming</a>
</div>

<div class="main-content">
    <h2>Welcome to Java Data Types, <%= username %></h2>

    <div class="content-section" id="datatypes">
        <h3>Java Data Types</h3>
        <p>Java data types define the size and type of variables. Java supports two main categories of data types:</p>
        <ul>
            <li><strong>Primitive Data Types:</strong> int, char, float, boolean, double, byte, short, long</li>
            <li><strong>Non-Primitive Data Types:</strong> String, Arrays, Classes, Interfaces</li>
        </ul>
        
        <h4>Example:</h4>
        <pre>
public class DataTypeExample {
    public static void main(String[] args) {
        int number = 10;
        char letter = 'A';
        float decimal = 5.5f;
        boolean isTrue = true;
        System.out.println("Integer: " + number);
        System.out.println("Character: " + letter);
        System.out.println("Float: " + decimal);
        System.out.println("Boolean: " + isTrue);
    }
}
        </pre>
    </div>
   <strong>Primitive Data Types</strong> 
    <p>A primitive data type specifies the type of a variable and the kind of values it can hold.</p>

    <strong> There are eight primitive data types in Java:</strong>

<table border="1" cellpadding="10" cellspacing="0">
    <thead>
        <tr>
            <th>Data Type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>byte</strong></td>
            <td>Stores whole numbers from -128 to 127</td>
        </tr>
        <tr>
            <td><strong>short</strong></td>
            <td>Stores whole numbers from -32,768 to 32,767</td>
        </tr>
        <tr>
            <td><strong>int</strong></td>
            <td>Stores whole numbers from -2,147,483,648 to 2,147,483,647</td>
        </tr>
        <tr>
            <td><strong>long</strong></td>
            <td>Stores whole numbers from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807</td>
        </tr>
        <tr>
            <td><strong>float</strong></td>
            <td>Stores fractional numbers. Sufficient for storing 6 to 7 decimal digits</td>
        </tr>
        <tr>
            <td><strong>double</strong></td>
            <td>Stores fractional numbers. Sufficient for storing 15 to 16 decimal digits</td>
        </tr>
        <tr>
            <td><strong>boolean</strong></td>
            <td>Stores true or false values</td>
        </tr>
        <tr>
            <td><strong>char</strong></td>
            <td>Stores a single character/letter or ASCII values</td>
        </tr>
    </tbody>
</table>


    <div class="button-container">
        <a href="java_datatypes.jsp" class="quiz-btn">Take Quiz</a>
    </div>
    
    <div class="button-container2">
        <a href="java_typecasting.jsp" class="quiz-btn">Next</a>
    </div>
</div>

</body>
</html>