<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>DBMS Exam</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        .question-container {
            background-color: #fff;
            padding: 20px;
            margin: 10px 0;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .question-container input[type="radio"] {
            margin-right: 10px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>DBMS Questions</h2>
    <form action="ExamServlet" method="post">
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");
                ps = conn.prepareStatement("SELECT * FROM questionsd WHERE subject='DBMS'");
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
                <p><b><%= question %></b></p>
                <input type="radio" name="q<%= qid %>" value="option1"> <%= option1 %> <br>
                <input type="radio" name="q<%= qid %>" value="option2"> <%= option2 %> <br>
                <input type="radio" name="q<%= qid %>" value="option3"> <%= option3 %> <br>
                <input type="radio" name="q<%= qid %>" value="option4"> <%= option4 %> <br>
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
        <br>
        <input type="submit" value="Submit Exam">
    </form>
</body>
</html>
