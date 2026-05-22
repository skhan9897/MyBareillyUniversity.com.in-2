package com.university.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/StudentLogoutServlet")

public class StudentLogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
        request.getSession(false);

        if(session != null){

            session.invalidate();
        }

        response.sendRedirect("loginStudent.jsp");
    }
}