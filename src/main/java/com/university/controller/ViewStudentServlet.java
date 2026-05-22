package com.university.controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.university.util.DBConnection;

@WebServlet("/viewStudent")
public class ViewStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<String[]> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM student_register";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] s = new String[8];

                s[0] = rs.getString("name");
                s[1] = rs.getString("email");
                s[2] = rs.getString("phone");
                s[3] = rs.getString("department");
                s[4] = rs.getString("tenth_percentage");
                s[5] = rs.getString("twelfth_percentage");
                s[6] = rs.getString("photo");
                s[7] = rs.getString("id");

                list.add(s);
            }

            request.setAttribute("students", list);

            RequestDispatcher rd = request.getRequestDispatcher("viewStudent.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}