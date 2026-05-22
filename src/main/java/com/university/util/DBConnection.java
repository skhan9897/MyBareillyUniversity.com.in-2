package com.university.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con = null;

    public static Connection getConnection() {

        try {

            // Connection check
            if (con == null || con.isClosed()) {

                // MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // ==============================
                // RAILWAY MYSQL DETAILS
                // ==============================

                String host = "YOUR_AIVEN_HOST";
String port = "22625";
String database = "defaultdb";
String username = "avnadmin";
String password = "1234";

                // JDBC URL
                String url =
"jdbc:mysql://" + host + ":" + port + "/" + database +
"?sslMode=REQUIRED";

                // Create Connection
                con = DriverManager.getConnection(url, username, password);

                System.out.println("Database Connected Successfully");
            }

        } catch (Exception e) {

            System.out.println("Database Connection Failed");
            e.printStackTrace();
        }

        return con;
    }
}