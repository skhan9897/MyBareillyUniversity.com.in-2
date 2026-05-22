package com.university.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/RegisterStudentServlet")

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)

public class RegisterStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String duration = request.getParameter("duration");
        String fees = request.getParameter("fees");
        String password = request.getParameter("password");

        Part photoPart = request.getPart("photo");
        Part aadhaarPart = request.getPart("aadhaar");
        Part marksheet10Part = request.getPart("marksheet10");
        Part marksheet12Part = request.getPart("marksheet12");

        String photoName =
                System.currentTimeMillis()
                + "_"
                + photoPart.getSubmittedFileName();

        String aadhaarName =
                System.currentTimeMillis()
                + "_"
                + aadhaarPart.getSubmittedFileName();

        String marksheet10Name =
                System.currentTimeMillis()
                + "_"
                + marksheet10Part.getSubmittedFileName();

        String marksheet12Name =
                System.currentTimeMillis()
                + "_"
                + marksheet12Part.getSubmittedFileName();

        String uploadPath =
                getServletContext().getRealPath("")
                + File.separator
                + "images"
                + File.separator
                + "uploads";

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        photoPart.write(
                uploadPath
                + File.separator
                + photoName
        );

        aadhaarPart.write(
                uploadPath
                + File.separator
                + aadhaarName
        );

        marksheet10Part.write(
                uploadPath
                + File.separator
                + marksheet10Name
        );

        marksheet12Part.write(
                uploadPath
                + File.separator
                + marksheet12Name
        );

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/Bareilly_University",
                            "root",
                            "1234"
                    );

            String query =
                    "INSERT INTO students(name,age,email,phone,department,duration,fees,password,photo,aadhaar,marksheet10,marksheet12)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, age);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, department);
            ps.setString(6, duration);
            ps.setString(7, fees);
            ps.setString(8, password);

            ps.setString(9, photoName);
            ps.setString(10, aadhaarName);
            ps.setString(11, marksheet10Name);
            ps.setString(12, marksheet12Name);

            int i = ps.executeUpdate();

            if(i > 0){

                response.sendRedirect("loginStudent.jsp");

            }else{

                response.getWriter().println("Registration Failed");

            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(e);

        }

    }

}