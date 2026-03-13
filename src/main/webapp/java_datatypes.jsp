<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Java Exam</title>
    <script>
        var totalTime = 100; // 5 minutes (adjust as needed)

        function startTimer() {
            var timer = document.getElementById("timer");
            var interval = setInterval(function() {
                var minutes = Math.floor(totalTime / 60);
                var seconds = totalTime % 60;

                // Format seconds to always be 2 digits
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
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");
                    ps = conn.prepareStatement("SELECT * FROM questionsd WHERE subject='java_datatypes'");
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int qid = rs.getInt("id");
                        String question = rs.getString("question");
                        String option1 = rs.getString("option1");
                        String option2 = rs.getString("option2");
                        String option3 = rs.getString("option3");
                        String option4 = rs.getString("option4");
            %>
                <div class="question-container">
                    <div class="question">
                        <%= question %>
                    </div>
                    <div class="options">
                        <input type="radio" name="q<%= qid %>" value="<%= option1 %>"> <%= option1 %> <br>
                        <input type="radio" name="q<%= qid %>" value="<%= option2 %>"> <%= option2 %> <br>
                        <input type="radio" name="q<%= qid %>" value="<%= option3 %>"> <%= option3 %> <br>
                        <input type="radio" name="q<%= qid %>" value="<%= option4 %>"> <%= option4 %> <br>
                    </div>
                </div>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
            <input type="submit" class="submit-button" value="Submit Exam">
        </form>
        
        <div class="footer">
            <p>Good luck with your exam! Time is ticking!</p>
        </div>
    </div>
</body>
</html>
