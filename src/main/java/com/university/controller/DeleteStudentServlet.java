package com.university.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.university.util.DBConnection;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

    int id = Integer.parseInt(request.getParameter("id"));

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/Bareilly_University","root","1234");

        PreparedStatement ps = con.prepareStatement(
        "DELETE FROM students WHERE id=?");

        ps.setInt(1,id);
        ps.executeUpdate();

    }catch(Exception e){}

    response.sendRedirect("viewStudent.jsp");
}
}