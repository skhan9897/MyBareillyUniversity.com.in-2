package com.university.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/loginAdmin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 👉 Admin hardcoded
        if(email.equals("musaidraza0786@gmail.com") && password.equals("1234")) {

    HttpSession session = request.getSession();
    session.setAttribute("admin", email);

    response.sendRedirect(request.getContextPath() + "/dashboard.jsp");

} else {

    response.sendRedirect(request.getContextPath() + "/loginAdmin.jsp");
}
    }
}