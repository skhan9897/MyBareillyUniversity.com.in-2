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

@WebServlet("/PayFeesServlet")

public class PayFeesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int studentId =
            Integer.parseInt(
            request.getParameter("studentId"));

            double amount =
            Double.parseDouble(
            request.getParameter("amount"));

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con =
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/Bareilly_University",
            "root",
            "1234"
            );

            // CURRENT FEES

            PreparedStatement ps1 =
            con.prepareStatement(
            "SELECT fees FROM students WHERE id=?"
            );

            ps1.setInt(1, studentId);

            ResultSet rs = ps1.executeQuery();

            double currentFees = 0;

            if(rs.next()) {

                currentFees =
                rs.getDouble("fees");
            }

            // REMAINING FEES

            double remainingFees =
            currentFees - amount;

            if(remainingFees < 0) {

                remainingFees = 0;
            }

            // UPDATE FEES

            PreparedStatement ps2 =
            con.prepareStatement(
            "UPDATE students SET fees=? WHERE id=?"
            );

            ps2.setDouble(1, remainingFees);

            ps2.setInt(2, studentId);

            ps2.executeUpdate();

            con.close();

            // REDIRECT

            response.sendRedirect("viewFees.jsp");

        }

        catch(Exception e) {

            response.getWriter().println(e);

        }

    }

}