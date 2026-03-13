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
    <title>C - Subject Page</title>
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
        .video-container {
            text-align: center;
            margin-top: 10px;
        }
        .video-container img {
            width: 100%;
            max-width: 400px;
            border-radius: 10px;
            transition: transform 0.3s;
        }
        .video-container img:hover {
            transform: scale(1.05);
        }
        .button-container {
            text-align: left;
            margin-top: 0px;
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
        .button-container2 {
            text-align: right;
            margin-top: -25px;
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
        .button-container a:hover, .button-container2 a:hover {
            background-color: #2980b9;
            transform: scale(1.1);
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="nav-links">
        <a href="user_dashboard.jsp"><i class="fas fa-home"></i> Home</a>
        <a href="c.jsp"><i class="fas fa-terminal"></i> C</a>
        <a href="cpp.jsp"><i class="fas fa-code"></i> C++</a>
        <a href="python.jsp"><i class="fab fa-python"></i> Python</a>
        <a href="java.jsp"><i class="fab fa-java"></i> Java</a>
        <a href="database.jsp"><i class="fas fa-database"></i> Database</a>
    </div>
    <a href="logout.jsp" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>

<div class="sidebar">
    <a href="#intro">C Introduction</a>
    <a href="#datatypes">C Datatypes</a>
    <a href="#loops">Loops in C</a>
    <a href="#functions">Functions</a>
    <a href="#pointers">Pointers</a>
</div>

<div class="main-content">
    <h2>Welcome to C Subject Page, <%= username %></h2>

    <div class="content-section" id="intro">
        <h3>C Introduction</h3>
        <p>C is a powerful general-purpose programming language. It is used in system programming, embedded systems, and applications requiring high performance.</p>
        
        <p><strong>Why Use C?</strong></p>
        <ul>
            <li>Efficient and fast: Used for operating systems and embedded systems.</li>
            <li>Low-level access: Provides direct memory access and pointer manipulation.</li>
            <li>Portable: Code can run on various platforms with minimal modifications.</li>
        </ul>
        
        <p><strong>Basic C Syntax</strong></p>
        <pre><code>#include <stdio.h>
int main() {
    printf("Hello, World!\n");
    return 0;
}</code></pre>
        
        <div class="video-container">
            <a href="https://www.youtube.com/watch?v=KJgsSFOSQv0" target="_blank">
                <img src="https://img.youtube.com/vi/KJgsSFOSQv0/0.jpg" alt="C Introduction Video">
            </a>
        </div>
    </div>

    <div class="button-container">
        <a href="c_intro_quiz.jsp" class="quiz-btn">Take Quiz</a>
    </div>
    <div class="button-container2">
        <a href="c_datatypes.jsp" class="quiz-btn">NEXT</a>
    </div>
</div>

</body>
</html>
