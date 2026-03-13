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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Type Casting</title>
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

        /* Navbar Styling */
        .navbar {
            background-color: #2c3e50;
            padding: 12px 20px;
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

        .logout {
            background: #e74c3c;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .logout:hover {
            background: #c0392b;
        }

        /* Sidebar Styling */
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

        /* Main Content */
        .main-content {
            margin-left: 460px;
            padding: 20px;
            margin-top: 70px;
            max-width: 900px;
        }

        h2 {
            font-size: 28px;
            color: #2c3e50;
        }

        .content-section {
            background: white;
            padding: 20px;
            margin: 20px 0;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #2980b9;
        }

        pre {
            background: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }

        .video-container {
            margin-top: 20px;
            text-align: center;
        }

        .video-container img {
            width: 100%;
            max-width: 600px;
            border-radius: 10px;
            transition: transform 0.3s ease-in-out;
        }

        .video-container img:hover {
            transform: scale(1.05);
        }

        /* Button Styling */
        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .next-button, .quiz-button {
            display: inline-block;
            background-color: #2ecc71;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
            transition: background 0.3s ease-in-out;
            margin: 10px;
            border: none;
            cursor: pointer;
        }

        .next-button:hover {
            background-color: #27ae60;
        }

        .quiz-button {
            background-color: #e67e22;
        }

        .quiz-button:hover {
            background-color: #d35400;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                padding-top: 10px;
            }

            .main-content {
                margin-left: 0;
                padding: 15px;
                margin-top: 90px;
            }

            .navbar {
                flex-direction: column;
                text-align: center;
            }

            .navbar a {
                display: block;
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div class="nav-links">
        <a href="user_dashboard.jsp">Home</a>
        <a href="cpp.jsp">C++</a>
        <a href="c.jsp">C</a>
        <a href="python.jsp">Python</a>
        <a href="java.jsp">Java</a>
        <a href="database.jsp">Database</a>
    </div>
    <a href="logout.jsp" class="logout">Logout</a>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <a href="java.jsp">Back to Java Topics</a>
    <a href="#widening">Widening Casting</a>
    <a href="#narrowing">Narrowing Casting</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <h2>Welcome to Java Type Casting, <%= username %></h2>

    <!-- Widening Casting Section -->
    <div class="content-section" id="widening">
        <h3>Widening Casting (Implicit)</h3>
        <p>Widening Casting is done automatically when converting a smaller type to a larger type.</p>
        <pre><code>int myInt = 9;
double myDouble = myInt; // Automatic casting</code></pre>
        <img src="https://tse4.mm.bing.net/th?id=OIP.JVIAm_wRWzahD0da1-13OAHaC9&pid=Api&P=0&h=180" 
             alt="Widening Casting Diagram" width="100%">
    </div>

    <!-- Narrowing Casting Section -->
    <div class="content-section" id="narrowing">
        <h3>Narrowing Casting (Explicit)</h3>
        <p>Narrowing Casting must be done manually when converting a larger type to a smaller type.</p>
        <pre><code>double myDouble = 9.78;
int myInt = (int) myDouble; // Explicit casting</code></pre>
        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20230428153049/Explicit-Type-Casting-Order-768.webp" 
             alt="Narrowing Casting Diagram" width="100%">
    </div>

    <!-- Video Section -->
    <div class="video-container">
        <h3>Learn More with This Video:</h3>
        <a href="https://www.youtube.com/watch?v=Q8cTydJSawQ">
            <img src="https://tse1.mm.bing.net/th?id=OVP.T4VAYBDEkbD3TjAC6VXQvwHgFo&pid=Api&h=360&w=480&c=7&rs=1" 
                 alt="Type Casting Video">
        </a>
    </div>

    <!-- Buttons -->
    <div class="button-container">
        <a href="java_operators.jsp" class="next-button">Next Page</a>
        <a href="java_quiz.jsp" class="quiz-button">Take Quiz</a>
    </div>
</div>

</body>
</html>
