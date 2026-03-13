package com.exam.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");

            // SQL Query
            String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);

            // Execute Update
            int rows = ps.executeUpdate();

            // Styled HTML Response
            out.println("<html><head><title>Registration Status</title>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background: #121212; color: white; text-align: center; }");
            out.println(".container { margin: 100px auto; width: 50%; padding: 20px; border-radius: 10px; background: #1E1E1E; box-shadow: 0px 0px 15px rgba(0, 255, 255, 0.5); }");
            out.println(".success { color: #00FF00; font-size: 20px; }");
            out.println(".error { color: #FF3333; font-size: 20px; }");
            out.println("a { color: #FFD700; text-decoration: none; font-weight: bold; }");
            out.println("a:hover { text-decoration: underline; }");
            out.println("</style></head><body>");

            out.println("<div class='container'>");
            if (rows > 0) {
                out.println("<h2 class='success'>✔ Registration Successful!</h2>");
                out.println("<p>You can now <a href='index.jsp'>Login Here</a></p>");
            } else {
                out.println("<h2 class='error'>❌ Registration Failed! Please try again.</h2>");
            }
            out.println("</div>");

            out.println("</body></html>");
        } catch (Exception e) {
            out.println("<html><head><title>Error</title></head><body>");
            out.println("<div class='container'><h2 class='error'>⚠ Error: " + e.getMessage() + "</h2></div>");
            out.println("</body></html>");
        } finally {
            try { if (ps != null) ps.close(); if (con != null) con.close(); } catch (Exception ex) { ex.printStackTrace(); }
        }
    }
}