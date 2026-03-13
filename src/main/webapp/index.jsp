<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Exam System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.shiksha.com/mediadata/images/1533114847phpxZMCB2.jpeg') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            color: white;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h2 {
            
            font-size: 50px;
            margin-bottom: 20px;
            backgroud-color:blue;
            color: white;
            font-weight: 2000px;
            letter-spacing: 1.5px;
        }

        .login-container {
            display: flex;
            gap: 40px;
            justify-content: center;
            flex-wrap: wrap;
            width: 80%;
            max-width: 900px;
        }

        .container {
            width: 350px;
            background: rgba(0, 0, 0, 0.85);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 5px 25px rgba(0, 255, 255, 0.3);
            transition: all 0.3s ease;
            text-align: center;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 30px rgba(0, 255, 255, 0.5);
        }

        .container h3 {
            margin-bottom: 15px;
            font-size: 24px;
            color: cyan;
            text-shadow: 0 0 10px cyan, 0 0 15px blue;
        }

        .container img {
            width: 80px;
            margin-bottom: 15px;
            filter: drop-shadow(0px 0px 10px cyan);
        }

        .form-input {
            position: relative;
            margin-bottom: 15px;
        }

        .form-input i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #00ffff;
            font-size: 18px;
            text-shadow: 0px 0px 5px cyan;
        }

        .form-input input {
            width: 100%;
            padding: 12px 40px;
            border: 2px solid transparent;
            border-radius: 6px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s;
            box-sizing: border-box;
            color: #333;
            font-weight: bold;
        }

        .form-input input:focus {
            border-color: cyan;
            box-shadow: 0px 0px 10px cyan;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            background: #007BFF;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease, box-shadow 0.3s ease;
            text-shadow: 0 0 10px white;
        }

        input[type="submit"]:hover {
            background: #0056b3;
            box-shadow: 0 0 15px blue;
        }

        .register-btn {
            display: block;
            width: 80%;
            padding: 12px;
            background: #28a745;
            color: white;
            font-size: 16px;
            text-decoration: none;
            border-radius: 6px;
            margin: 10px auto 0;
            transition: background 0.3s ease, box-shadow 0.3s ease;
            text-shadow: 0 0 10px white;
        }

        .register-btn:hover {
            background: #218838;
            box-shadow: 0px 0px 15px green;
        }

        @media screen and (max-width: 768px) {
            .login-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>

   <h2>Welcome to the Online Learning Portal</h2>

    <div class="login-container">
        <!-- User Login -->
        <div class="container">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User Login">
            <h3>User Login</h3>
            <form action="UserLoginServlet" method="post">
                <div class="form-input">
                    <i class="fas fa-user"></i>
                    <input type="text" name="username" placeholder="Enter Username" required>
                </div>
                <div class="form-input">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Enter Password" required>
                </div>
                <input type="submit" value="Login">
            </form>
            <a href="register.jsp" class="register-btn">Register</a>
        </div>

        <!-- Admin Login -->
        <div class="container">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135768.png" alt="Admin Login">
            <h3>Admin Login</h3>
            <form action="AdminLoginServlet" method="post">
                <div class="form-input">
                    <i class="fas fa-user"></i>
                    <input type="text" name="adminname" placeholder="Enter Admin Username" required>
                </div>
                <div class="form-input">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="adminpassword" placeholder="Enter Password" required>
                </div>
                <input type="submit" value="Login">
            </form>
        </div>
    </div>

</body>
</html>
