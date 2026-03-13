<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Java Exam</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(45deg, #141e30, #243b55);
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 80%;
            max-width: 1000px;
            background: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.5);
            animation: fadeIn 1.5s;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            font-size: 2.5em;
            text-shadow: 0 0 10px cyan;
        }

        #timer {
            text-align: center;
            font-size: 1.5em;
            color: #ffcc00;
            text-shadow: 0 0 10px #ffcc00;
        }

        .question-container {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 255, 255, 0.3);
        }

        .question {
            font-size: 1.3em;
            font-weight: bold;
        }

        .options input {
            margin-right: 10px;
        }

        .submit-button {
            display: block;
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #ff416c, #ff4b2b);
            color: white;
            font-size: 1.2em;
            border-radius: 8px;
            cursor: pointer;
            text-shadow: 0 0 5px white;
            transition: 0.3s;
        }

        .submit-button:hover {
            background: linear-gradient(45deg, #ff4b2b, #ff416c);
            box-shadow: 0 0 15px #ff4b2b;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 1em;
            color: #bbb;
        }
    </style>
    <script>
        var totalTime = 100;
        function startTimer() {
            var timer = document.getElementById("timer");
            var interval = setInterval(function() {
                var minutes = Math.floor(totalTime / 60);
                var seconds = totalTime % 60;
                seconds = seconds < 10 ? "0" + seconds : seconds;
                timer.innerHTML = "Time Left: " + minutes + "m " + seconds + "s";
                if (totalTime <= 0) {
                    clearInterval(interval);
                    alert("Time is up! Submitting the exam.");
                    document.getElementById("examForm").submit();
                }
                totalTime--;
            }, 1000);
        }
    </script>
</head>
<body onload="startTimer()">
    <div class="container">
        <h2>Java Exam</h2>
        <h3 id="timer"></h3>
        <form id="examForm" action="ExamServlet" method="post">
            <% Connection conn = null; PreparedStatement ps = null; ResultSet rs = null;
               try {
                   Class.forName("com.mysql.cj.jdbc.Driver");
                   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");
                   ps = conn.prepareStatement("SELECT * FROM questionsd WHERE subject='Java'");
                   rs = ps.executeQuery();
                   while (rs.next()) { %>
                <div class="question-container">
                    <div class="question"><%= rs.getString("question") %></div>
                    <div class="options">
                        <input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option1") %>"> <%= rs.getString("option1") %> <br>
                        <input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option2") %>"> <%= rs.getString("option2") %> <br>
                        <input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option3") %>"> <%= rs.getString("option3") %> <br>
                        <input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option4") %>"> <%= rs.getString("option4") %> <br>
                    </div>
                </div>
            <% } } catch (Exception e) { e.printStackTrace(); }
               finally { if (rs != null) rs.close(); if (ps != null) ps.close(); if (conn != null) conn.close(); }
            %>
            <input type="submit" class="submit-button" value="Submit Exam">
        </form>
        <div class="footer">
            <p>Good luck with your exam! Time is ticking!</p>
        </div>
    </div>
</body>
</html>
