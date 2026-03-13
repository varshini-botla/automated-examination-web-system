<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Question</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.pexels.com/photos/196655/pexels-photo-196655.jpeg?auto=compress&cs=tinysrgb&w=600') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 500px;
            background: rgba(0, 0, 0, 0.85);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 5px 25px rgba(255, 255, 255, 0.2);
            text-align: center;
            color: white;
        }

        .container h2 {
            font-size: 24px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .container h2 img {
            width: 40px;
            height: 40px;
        }

        .form-input {
            position: relative;
            margin-bottom: 15px;
            text-align: left;
        }

        .form-input i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
            font-size: 16px;
        }

        .form-input input,
        .form-input select {
            width: 100%;
            padding: 12px 40px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s;
            box-sizing: border-box;
        }

        .form-input select {
            padding: 12px;
        }

        .form-input input:focus,
        .form-input select:focus {
            outline: none;
            border: 2px solid #007BFF;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            background: #007BFF;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .submit-btn:hover {
            background: #0056b3;
        }

        .logo {
            width: 100px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="container">
        <img src="https://cdn-icons-png.flaticon.com/128/11141/11141490.png" alt="Logo" class="logo">
        <h2>
            <img src="https://cdn-icons-png.flaticon.com/512/2503/2503647.png" alt="Question Icon">
            Add New Question
        </h2>

        <form action="AddQuestionServlet" method="post">
            <div class="form-input">
                <i class="fas fa-question-circle"></i>
                <input type="text" name="question" placeholder="Enter Question" required>
            </div>

            <div class="form-input">
                <i class="fas fa-check-circle"></i>
                <input type="text" name="option1" placeholder="Option 1" required>
            </div>

            <div class="form-input">
                <i class="fas fa-check-circle"></i>
                <input type="text" name="option2" placeholder="Option 2" required>
            </div>

            <div class="form-input">
                <i class="fas fa-check-circle"></i>
                <input type="text" name="option3" placeholder="Option 3" required>
            </div>

            <div class="form-input">
                <i class="fas fa-check-circle"></i>
                <input type="text" name="option4" placeholder="Option 4" required>
            </div>

            <div class="form-input">
                <i class="fas fa-check"></i>
                <input type="text" name="answer" placeholder="Correct Answer" required>
            </div>

            <div class="form-input">
                <i class="fas fa-book"></i>
                <select name="subjects" required>
                    <option value="">Select Subject</option>
                    <option value="java">Java</option>
                    <option value="Python">Python</option>
                    <option value="C++">C++</option>
                    <option value="C">C</option>
                    <option value="Database">Database</option>
                    <option value="java_datatypes">Java Datatypes</option>
                    <option value="Cpp_datatypes">CPP  Datatypes</option>
                </select>
            </div>

            <input type="submit" class="submit-btn" value="Add Question">
        </form>
    </div>

</body>
</html>
