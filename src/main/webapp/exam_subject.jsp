<%@ page import="java.sql.*" %>
<%
    String subject = request.getParameter("subject");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM questionsd WHERE subject = ? ORDER BY RAND() LIMIT 5");
    ps.setString(1, subject);
    ResultSet rs = ps.executeQuery();
%>

<h2><%= subject %> Exam</h2>
<form action="ExamServlet" method="post">
    <%
        while (rs.next()) {
    %>
        <p><%= rs.getString("question") %></p>
        <input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option1") %>"> <%= rs.getString("option1") %> <br>
        <input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option2") %>"> <%= rs.getString("option2") %> <br>
        <input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option3") %>"> <%= rs.getString("option3") %> <br>
        <input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option4") %>"> <%= rs.getString("option4") %> <br>
    <%
        }
    %>
    <input type="hidden" name="subject" value="<%= subject %>">
    <input type="submit" value="Submit Exam">
</form>
