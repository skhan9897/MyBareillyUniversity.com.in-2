<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>

<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial;
    background: url('images/university.jpeg') no-repeat center center/cover;
    height: 100vh;
}

.login-box {
    width: 350px;
    padding: 30px;
    background: rgba(255,255,255,0.95);
    border-radius: 10px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    box-shadow: 0 0 15px rgba(0,0,0,0.3);
}

.login-box img {
    width: 70px;
    margin-bottom: 10px;
}

.login-box h2 {
    margin-bottom: 20px;
}

.login-box input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.login-box button {
    width: 100%;
    padding: 10px;
    background: green;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.login-box button:hover {
    background: darkgreen;
}

.error {
    color: red;
    margin-bottom: 10px;
}
</style>

</head>

<body>

<div class="login-box">

    <img src="images/logo2.png">

    <h2>Student Login</h2>

    <!-- ERROR MESSAGE -->
    <% if(request.getParameter("error") != null){ %>
        <div class="error">Invalid Email or Password</div>
    <% } %>

    <!-- 🔥 IMPORTANT FIX: CONTEXT PATH -->
    <form action="loginStudent" method="post">

    <input type="email"
           name="email"
           placeholder="Enter Email"
           required>

    <input type="password"
           name="password"
           placeholder="Enter Password"
           required>

    <button type="submit">Login</button>
    <a href="dashboard.jsp"
           class="btn back">

           Back
        </a>


</form>

</div>

</body>
</html>