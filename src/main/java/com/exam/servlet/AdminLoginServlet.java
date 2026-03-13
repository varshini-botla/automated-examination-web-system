package com.exam.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String adminname = request.getParameter("adminname");
        String adminpassword = request.getParameter("adminpassword");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexamdb", "root", "POOJA");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM admins WHERE adminname=? AND password=?");
            ps.setString(1, adminname);
            ps.setString(2, adminpassword);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminname", adminname);
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                response.getWriter().println("<h3>Invalid Admin Credentials! <a href='index.jsp'>Try Again</a></h3>");
            }

            con.close();
        } catch (Exception e) {
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
