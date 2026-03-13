<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exam</title>
</head>
<body>
    <h2>Online Exam</h2>

    <form action="SubmitExamServlet" method="post">
        <% 
            // Fetch the questions and options from the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/OnlineExamDB", "root", "kiran&420");
            String query = "SELECT * FROM questionsindb";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            int questionNumber = 1;
            while (rs.next()) {
                String question = rs.getString("question");
                String option1 = rs.getString("option1");
                String option2 = rs.getString("option2");
                String option3 = rs.getString("option3");
                String option4 = rs.getString("option4");

        %>
        
        <div>
            <h3><%= questionNumber %>. <%= question %></h3>
            <input type="radio" name="answers<%= questionNumber %>" value="<%= option1 %>"> <%= option1 %><br>
            <input type="radio" name="answers<%= questionNumber %>" value="<%= option2 %>"> <%= option2 %><br>
            <input type="radio" name="answers<%= questionNumber %>" value="<%= option3 %>"> <%= option3 %><br>
            <input type="radio" name="answers<%= questionNumber %>" value="<%= option4 %>"> <%= option4 %><br>
        </div>

        <% 
                questionNumber++;
            }
            con.close();
        %>

        <br>
        <input type="submit" value="Submit Exam">
    </form>
</body>
</html>
