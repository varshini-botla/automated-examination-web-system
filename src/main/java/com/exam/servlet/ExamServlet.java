package com.exam.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ExamServlet")
public class ExamServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        Map<String, Integer> subjectScores = new HashMap<>();
        Map<String, Integer> totalQuestionsPerSubject = new HashMap<>();
        Map<String, Map<Integer, String>> correctAnswers = new HashMap<>();
        Map<String, Map<Integer, String>> userAnswers = new HashMap<>();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // Fetch username from session (or guest if none)
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username == null) username = "Guest";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");

            // Fetch questions and correct answers
            ps = conn.prepareStatement("SELECT id, subject, TRIM(correct_option) AS correct_option FROM questionsd");
            rs = ps.executeQuery();

            while (rs.next()) {
                int questionId = rs.getInt("id");
                String subject = rs.getString("subject").trim();
                String correctOption = rs.getString("correct_option").trim().toLowerCase();

                correctAnswers.putIfAbsent(subject, new HashMap<>());
                correctAnswers.get(subject).put(questionId, correctOption);

                totalQuestionsPerSubject.put(subject, totalQuestionsPerSubject.getOrDefault(subject, 0) + 1);
            }

            rs.close();
            ps.close();

            // Process user responses and calculate scores
            for (String subject : correctAnswers.keySet()) {
                userAnswers.putIfAbsent(subject, new HashMap<>());
                subjectScores.put(subject, 0);

                for (Map.Entry<Integer, String> entry : correctAnswers.get(subject).entrySet()) {
                    int questionId = entry.getKey();
                    String correctAnswer = entry.getValue();

                    String userAnswer = request.getParameter("q" + questionId);
                    if (userAnswer != null) {
                        userAnswer = userAnswer.trim().toLowerCase();
                        userAnswers.get(subject).put(questionId, userAnswer);
                    } else {
                        userAnswer = "Not Attempted";
                        userAnswers.get(subject).put(questionId, userAnswer);
                    }

                    if (userAnswer.equals(correctAnswer)) {
                        subjectScores.put(subject, subjectScores.get(subject) + 1);
                    }
                }
            }

            // Store result per subject in 'results' table
            ps = conn.prepareStatement("INSERT INTO results (username, subject, score, exam_date) VALUES (?, ?, ?, ?)");

            for (String subject : subjectScores.keySet()) {
                int totalScore = subjectScores.get(subject);
                ps.setString(1, username);
                ps.setString(2, subject);
                ps.setInt(3, totalScore);
                ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                ps.executeUpdate();
            }

            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Generate HTML result page
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><style>");
        out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f9; padding: 20px; }");
        out.println("h2 { color: #4CAF50; } h3 { color: #333; } h4 { color: #555; }");
        out.println("table { width: 100%; margin: 20px 0; border-collapse: collapse; }");
        out.println("th, td { padding: 10px; text-align: left; border: 1px solid #ddd; }");
        out.println("th { background-color: #4CAF50; color: white; }");
        out.println("tr:nth-child(even) { background-color: #f2f2f2; } tr:hover { background-color: #ddd; }");
        out.println("</style></head><body>");

        out.println("<h2>Exam Results</h2>");

        for (String subject : subjectScores.keySet()) {
            int totalScore = subjectScores.get(subject);
            int totalQuestions = totalQuestionsPerSubject.get(subject);
            out.println("<h3>" + subject + " Score: " + totalScore + " / " + totalQuestions + "</h3>");

            out.println("<h4>Review for " + subject + ":</h4>");
            out.println("<table>");
            out.println("<tr><th>Question ID</th><th>Your Answer</th><th>Correct Answer</th></tr>");

            for (Map.Entry<Integer, String> entry : correctAnswers.get(subject).entrySet()) {
                int questionId = entry.getKey();
                String correctAnswer = entry.getValue();
                String userAnswer = userAnswers.get(subject).get(questionId);

                out.println("<tr><td>" + questionId + "</td><td>" + userAnswer + "</td><td>" + correctAnswer + "</td></tr>");
            }
            out.println("</table><br>");
        }

        out.println("<a href='index.jsp'>Back to Home</a>");
        out.println("</body></html>");
    }
}
