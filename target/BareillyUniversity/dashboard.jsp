<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- ICONS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

/* RESET */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

/* BODY */

body{

    margin: 0;
    font-family: Arial;
    background: url("images/university.jpeg") no-repeat center center;
    background-size: cover;

    background-size:cover;

    background-position:center;

    background-repeat:no-repeat;

    background-attachment:fixed;
}

/* OVERLAY */

.overlay{

    width:100%;
    min-height:100vh;

    display:flex;

    flex-direction:column;
}

/* NAVBAR */

.navbar{

    width:100%;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:18px 5%;

    background:rgba(0,0,0,0.55);

    backdrop-filter:blur(8px);

    box-shadow:0 4px 20px rgba(0,0,0,0.5);

    flex-wrap:wrap;

    gap:20px;
}

/* LOGO */

.logo{

    display:flex;

    align-items:center;

    gap:15px;
}

.logo img{

    width:60px;

    height:60px;

    border-radius:50%;

    border:3px solid gold;

    box-shadow:0 0 20px gold;

    object-fit:cover;
}

.logo span{

    color:white;

    font-size:clamp(20px,2vw,32px);

    font-weight:bold;

    letter-spacing:1px;

    text-shadow:0 0 10px rgba(255,255,255,0.8);
}

/* MENU */

.menu{

    display:flex;

    flex-wrap:wrap;

    justify-content:center;

    gap:15px;
}

/* BUTTONS */

.menu a{

    text-decoration:none;

    color:white;

    padding:12px 22px;

    border-radius:12px;

    font-weight:bold;

    transition:0.4s;

    box-shadow:0 4px 15px rgba(0,0,0,0.4);

    font-size:clamp(12px,1vw,16px);
}

/* BUTTON COLORS */

.btn1{
    background:linear-gradient(45deg,#007bff,#00c6ff);
}

.btn2{
    background:linear-gradient(45deg,#28a745,#7dff7d);
}

.btn3{
    background:linear-gradient(45deg,#6f42c1,#b266ff);
}

.btn4{
    background:linear-gradient(45deg,#ff9800,#ffd54f);
}

.btn5{
    background:linear-gradient(45deg,#dc3545,#ff6b81);
}

/* HOVER */

.menu a:hover{

    transform:translateY(-4px) scale(1.05);

    box-shadow:0 8px 20px rgba(255,255,255,0.5);
}

/* CENTER CONTENT */

.content{

    flex:1;

    display:flex;

    flex-direction:column;

    justify-content:center;

    align-items:center;

    text-align:center;

    padding:20px;
}

/* HEADING */

.content h1{

    font-size:clamp(40px,6vw,90px);

    color:white;

    text-shadow:
    0 0 10px white,
    0 0 20px cyan,
    0 0 40px blue;

    margin-bottom:25px;
}

/* SUBTEXT */

.content p{

    color:white;

    font-size:clamp(16px,2vw,28px);

    background:rgba(255,255,255,0.15);

    padding:15px 30px;

    border-radius:20px;

    backdrop-filter:blur(8px);

    box-shadow:0 4px 20px rgba(255,255,255,0.2);
}

/* MOBILE */

@media(max-width:768px){

    .navbar{

        flex-direction:column;

        text-align:center;
    }

    .menu{

        width:100%;

        justify-content:center;
    }

    .menu a{

        width:90%;

        text-align:center;
    }

    .logo{

        justify-content:center;
    }
}

</style>

<body>

<div class="overlay">

    <!-- NAVBAR -->

    <div class="navbar">

        <!-- LOGO -->

        <div class="logo">

            <img src="images/logo3.png">

            <span>MY BAREILLY UNIVERSITY</span>

        </div>

        <!-- MENU -->

        <div class="menu">

            <a class="btn1" href="register.jsp">
                Register Student
            </a>

            <a class="btn2" href="loginStudent.jsp">
                Login Student
            </a>

            <a class="btn3" href="viewStudent.jsp">
                View Students
            </a>

            <a class="btn4" href="addFees.jsp">
                Add Fees
            </a>

            <a class="btn5" href="logout.jsp">
                Logout
            </a>

        </div>

    </div>

    <!-- CONTENT -->

    <div class="content">

        <h1>
            Welcome Admin 👨‍💼
        </h1>

        <p>
            Modern Responsive University Management System
        </p>

    </div>

</div>

</body>

</head>

<body>

<!-- NAVBAR -->
<div class="overlay">

    <!-- NAVBAR -->
    <div class="navbar">

        <!-- LOGO + TITLE -->
        <div class="logo">

            <img src="images/logo.png">

            <span>MY BAREILLY UNIVERSITY</span>

        </div>

        <!-- MENU -->
        <div class="menu">

            <a class="btn1" href="register.jsp">Register Student</a>

            <a class="btn2" href="loginStudent.jsp">Login Student</a>

            <a class="btn3" href="viewStudent.jsp">View Students</a>

            <a class="btn4" href="addFees.jsp">Add Fees</a>

            <a class="btn5" href="logout.jsp">Logout</a>

        </div>

    </div>

    <!-- CENTER CONTENT -->
    <div class="content">

        <h1>Welcome Admin 👨‍💼</h1>

        <p>
            Modern Responsive University Management System
        </p>

    </div>

</div>

    <div class="content">

        <h1>Welcome Admin 👨‍💼</h1>

        <p>
            Modern Responsive University Management System
        </p>

    </div>

</div>

</body>
</html>