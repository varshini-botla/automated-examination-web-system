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
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #141e30, #243b55);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.5);
            text-align: center;
            width: 450px;
            border: 2px solid rgba(255, 255, 255, 0.3);
        }

        h2 {
            font-size: 36px;
            color: #fff;
            text-shadow: 0 0 10px #ffffff, 0 0 20px #4caf50, 0 0 30px #4caf50;
        }

        p {
            font-size: 18px;
            color: #f5f5f5;
            margin-bottom: 20px;
            text-shadow: 0 0 8px rgba(255, 255, 255, 0.7);
        }

        .exam-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 12px;
            width: 80%;
            margin: 10px auto;
            border-radius: 8px;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            transition: 0.4s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        .exam-btn i {
            margin-right: 10px;
        }

        .exam-btn::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            width: 300%;
            height: 300%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.3) 10%, transparent 50%);
            transform: translate(-50%, -50%) scale(0);
            transition: transform 0.4s ease-in-out;
        }

        .exam-btn:hover::before {
            transform: translate(-50%, -50%) scale(1);
        }

        .exam-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.6), 0 0 25px rgba(255, 255, 255, 0.8);
        }

        .logout-btn {
            display: inline-block;
            width: 140px;
            padding: 12px;
            font-size: 18px;
            text-align: center;
            font-weight: bold;
            border-radius: 8px;
            text-decoration: none;
            color: white;
            background-color: #ff4c4c;
            box-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
            transition: 0.4s ease-in-out;
        }

        .logout-btn:hover {
            background-color: #ff1a1a;
            transform: scale(1.1);
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.8), 0 0 25px rgba(255, 0, 0, 1);
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>User Dashboard</h2>
        <p>Welcome, <%= username %>!</p>
        
        <a href="java_subject.jsp" class="exam-btn"><i class="fab fa-java"></i> Java</a>
        <a href="python_subject.jsp" class="exam-btn"><i class="fab fa-python"></i> Python</a>
        <a href="cpp_intro.jsp" class="exam-btn"><i class="fas fa-code"></i> C++</a>
        <a href="c_intro.jsp" class="exam-btn"><i class="fas fa-c"></i> C</a>
        <a href="database_subject.jsp" class="exam-btn"><i class="fas fa-database"></i> Database</a>

        <a href="index.jsp" class="logout-btn">Logout</a>
    </div>

</body>
</html>
