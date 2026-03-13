<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");

        String sql = "SELECT * FROM questionsd ORDER BY RAND() LIMIT 5"; // Fetch 5 random questions
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        StringBuilder questionIds = new StringBuilder();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Exam</title>
    <script>
        var totalTime = 300; // Set timer in seconds (5 minutes)

        function startTimer() {
            var timer = document.getElementById("timer");
            var interval = setInterval(function() {
                var minutes = Math.floor(totalTime / 60);
                var seconds = totalTime % 60;

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
    <h2>Online Examination</h2>
    <h3 id="timer" style="color: red;"></h3>

    <form id="examForm" action="ExamServlet" method="post">
        <%
            while (rs.next()) {
                int qid = rs.getInt("id");
                String question = rs.getString("question");
                String option1 = rs.getString("option1");
                String option2 = rs.getString("option2");
                String option3 = rs.getString("option3");
                String option4 = rs.getString("option4");

                if (questionIds.length() > 0) {
                    questionIds.append(",");
                }
                questionIds.append(qid);
        %>
                <p><strong><%= question %></strong></p>
                <input type="radio" name="q<%= qid %>" value="option1"> <%= option1 %> <br>
                <input type="radio" name="q<%= qid %>" value="option2"> <%= option2 %> <br>
                <input type="radio" name="q<%= qid %>" value="option3"> <%= option3 %> <br>
                <input type="radio" name="q<%= qid %>" value="option4"> <%= option4 %> <br><br>
        <%
            }
        %>
        <input type="hidden" name="questionIds" value="<%= questionIds.toString() %>">
        <input type="submit" value="Submit Exam">
    </form>
</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
