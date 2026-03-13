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
    <title>Java - Loops</title>
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
        .button-container2 a {
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
        .button-container2 a:hover {
            background-color: #2980b9;
            transform: scale(1.1);
        }
        .button-container2 {
            text-align: right;
            margin-top: -30px;
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
        <a href="java.jsp"><i class="fab fa-java"></i> Java</a>
    </div>
    <a href="logout.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<div class="sidebar">
    <a href="java.jsp">Java Introduction</a>
    <a href="java_datatypes.jsp">Java Datatypes</a>
    <a href="java_loops.jsp">Loops</a>
</div>

<div class="main-content">
    <h2>Welcome to Java Loops, <%= username %></h2>

    <div class="content-section">
        <h3>Loops in Java</h3>
        <p>Loops in Java allow a block of code to be executed multiple times based on a condition.</p>
        <h4>Types of Loops:</h4>
        <ul>
            <li><strong>for Loop</strong>: Used when the number of iterations is known.</li>
            <pre>
for (int i = 1; i <= 5; i++) {
    System.out.println("Iteration: " + i);
}
            </pre>
            <li><strong>while Loop</strong>: Used when the number of iterations is unknown and depends on a condition.</li>
            <pre>
int i = 1;
while (i <= 5) {
    System.out.println("Iteration: " + i);
    i++;
}
            </pre>
            <li><strong>do-while Loop</strong>: Ensures execution of the loop body at least once.</li>
            <pre>
int i = 1;
do {
    System.out.println("Iteration: " + i);
    i++;
} while (i <= 5);
            </pre>
            <li><strong>Enhanced for Loop</strong>: Used to iterate over arrays or collections.</li>
            <pre>
int[] numbers = {1, 2, 3, 4, 5};
for (int num : numbers) {
    System.out.println("Number: " + num);
}
            </pre>
        </ul>
    </div>
    <div class="button-container">
        <a href="java_loops_quiz.jsp" class="quiz-btn">Take Quiz</a>
    </div>
    <div class="button-container2">
        <a href="java_arrays.jsp" class="quiz-btn">Next</a>
    </div>
</div>

</body>
</html>
