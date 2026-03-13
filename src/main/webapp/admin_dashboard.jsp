<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 8px 32px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 400px;
        }

        .logo {
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 32px;
            color: #fff;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
        }

        .admin-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 12px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            font-size: 18px;
            border-radius: 8px;
            margin: 10px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .admin-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
        }

        .admin-btn i {
            margin-right: 10px;
        }

        .logout-btn {
            display: inline-block;
            width: 120px;
            padding: 10px;
            background-color: red;
            color: white;
            font-size: 16px;
            text-align: center;
            border-radius: 8px;
            text-decoration: none;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background-color: darkred;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <div class="container">
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" class="logo" alt="Admin Logo">
        <h2>Welcome Admin</h2>

        <a href="add_question.jsp" class="admin-btn"><i class="fas fa-plus-circle"></i> Add Questions</a>
        <a href="view_questions.jsp" class="admin-btn"><i class="fas fa-list"></i> View Questions</a>
        <a href="manage_users.jsp" class="admin-btn"><i class="fas fa-users"></i> Manage Users</a>

        <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>

</body>
</html>
