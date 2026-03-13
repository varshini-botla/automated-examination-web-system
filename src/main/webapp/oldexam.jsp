<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Online Exam</title>
    <script>
        var timeLeft = 300; // 5 minutes

        function startTimer() {
            var timer = setInterval(function () {
                document.getElementById("timer").innerHTML = "Time Left: " + timeLeft + " sec";
                timeLeft--;

                if (timeLeft < 0) {
                    clearInterval(timer);
                    document.getElementById("examForm").submit(); // Auto-submit exam
                }
            }, 1000);
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }
        .container {
            width: 50%;
            background: white;
            padding: 20px;
            margin: auto;
            margin-top: 50px;
            border-radius: 5px;
            box-shadow: 2px 2px 10px gray;
        }
        .question {
            font-weight: bold;
            margin-top: 15px;
        }
        input[type="submit"] {
            background: green;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background: darkgreen;
        }
        #timer {
            font-size: 18px;
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body onload="startTimer()">

    <h2>Online Examination</h2>
    <div id="timer">Time Left: 5:00</div>
    
    <div class="container">
        <form id="examForm" action="ExamServlet" method="post">
            <%
                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Connect to the database
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");

                    // SQL query to fetch 5 random questions from the correct table
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM questionsindb ORDER BY RAND() LIMIT 5");
                    ResultSet rs = ps.executeQuery();

                    // Check if the result set is empty
                    if (!rs.next()) {
                        out.println("<p>No questions found in the database.</p>");
                    } else {
                        // Iterate over the result set and display questions
                        do {
                            int qid = rs.getInt("id");
                            String question = rs.getString("question");
                            String option1 = rs.getString("option1");
                            String option2 = rs.getString("option2");
                            String option3 = rs.getString("option3");
                            String option4 = rs.getString("option4");

            %>
                        <div class="question">
                            <%= question %>
                        </div>
                        <input type="radio" name="q<%= qid %>" value="<%= option1 %>"> <%= option1 %> <br>
                        <input type="radio" name="q<%= qid %>" value="<%= option2 %>"> <%= option2 %> <br>
                        <input type="radio" name="q<%= qid %>" value="<%= option3 %>"> <%= option3 %> <br>
                        <input type="radio" name="q<%= qid %>" value="<%= option4 %>"> <%= option4 %> <br>
            <%
                        } while (rs.next());
                    }

                    conn.close();
                } catch (SQLException e) {
                    out.println("<p>SQL Error: " + e.getMessage() + "</p>");
                    e.printStackTrace(); // Print stack trace for SQL errors
                } catch (ClassNotFoundException e) {
                    out.println("<p>Error: MySQL JDBC driver not found.</p>");
                    e.printStackTrace(); // Print stack trace for class not found errors
                } catch (Exception e) {
                    out.println("<p>Unexpected error: " + e.getMessage() + "</p>");
                    e.printStackTrace(); // Print stack trace for unexpected errors
                }
            %>
            <input type="submit" value="Submit Exam">
        </form>
    </div>

</body>
</html>
