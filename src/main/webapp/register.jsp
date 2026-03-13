<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* Dark theme with neon accents */
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://www.sagatraining.ca/wp-content/uploads/2018/10/background-images-for-login-form-8.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 400px;
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(8px);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 5px 25px rgba(0, 255, 255, 0.5);
            text-align: center;
            color: white;
        }

        .logo {
            width: 100px;
            margin-bottom: 15px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #00FFFF;
        }

        input[type="text"], 
        input[type="email"], 
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            transition: all 0.3s;
            box-sizing: border-box;
        }

        input[type="password"]:focus, 
        input[type="email"]:focus, 
        input[type="text"]:focus {
            outline: none;
            border: 2px solid #00FFFF;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            background: #00FFFF;
            color: black;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #008B8B;
        }

        p {
            margin-top: 10px;
        }

        p a {
            color: #FFD700;
            text-decoration: none;
            font-weight: bold;
        }

        p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <img src="https://cdn-icons-png.flaticon.com/512/3177/3177440.png" alt="User Registration" class="logo">
        <h2>Register as a New User</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="username" placeholder="Enter Username" required><br>
            <input type="email" name="email" placeholder="Enter Email" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <input type="submit" value="Register">
        </form>
        <p>Already registered? <a href="index.jsp">Login here</a></p>
    </div>

</body>
</html>