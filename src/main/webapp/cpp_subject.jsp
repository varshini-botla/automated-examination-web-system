<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>C++ Exam</title>
</head>
<body>
    <h2>C++ Questions</h2>
    <form action="ExamServlet" method="post">
        <%
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");
                ps = conn.prepareStatement("SELECT * FROM questionsd WHERE subject='C++'");
                rs = ps.executeQuery();
                
                while (rs.next()) {
                    int qid = rs.getInt("id");
                    String question = rs.getString("question");
                    String option1 = rs.getString("option1");
                    String option2 = rs.getString("option2");
                    String option3 = rs.getString("option3");
                    String option4 = rs.getString("option4");
        %>
            <p><b><%= question %></b></p>
            <input type="radio" name="q<%= qid %>" value="option1"> <%= option1 %> <br>
            <input type="radio" name="q<%= qid %>" value="option2"> <%= option2 %> <br>
            <input type="radio" name="q<%= qid %>" value="option3"> <%= option3 %> <br>
            <input type="radio" name="q<%= qid %>" value="option4"> <%= option4 %> <br>
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
