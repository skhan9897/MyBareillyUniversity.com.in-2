package com.university.controller;

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

@WebServlet("/loginStudent")
public class StudentLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bareilly_university",
                    "root",
                    "1234"
            );

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM students WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

    HttpSession session = request.getSession();

    session.setAttribute("studentEmail", email);

    String photo = rs.getString("photo");

    session.setAttribute("photo", photo);

    response.sendRedirect("studentDashboard.jsp");

}
            else {

                response.getWriter().println("LOGIN FAILED");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(e);

        }
    }
}