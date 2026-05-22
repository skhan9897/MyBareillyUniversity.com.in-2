<%@page import="java.sql.*"%>

<%

String email =
(String)session.getAttribute("studentEmail");

if(email == null){

response.sendRedirect("loginStudent.jsp");

return;

}

%>

<!DOCTYPE html>

<html>

<head>

<title>View Fees</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:url('images/university.jpeg');
    background-size:cover;
    background-position:center;
}

.overlay{
    width:100%;
    height:100vh;
    background:rgba(0,0,0,0.6);
    display:flex;
    justify-content:center;
    align-items:center;
}

.box{

    width:700px;

    background:rgba(255,255,255,0.12);

    backdrop-filter:blur(12px);

    border-radius:20px;

    padding:40px;

    color:white;

    position:relative;

    overflow:hidden;
}

.box::before{

    content:'';

    position:absolute;

    top:50%;

    left:50%;

    transform:translate(-50%,-50%);

    width:320px;

    height:320px;

    background:url('images/logo2.png');

    background-size:contain;

    background-repeat:no-repeat;

    opacity:0.08;
}

h1{

    text-align:center;

    margin-bottom:30px;

    position:relative;

    z-index:2;
}

table{

    width:100%;

    border-collapse:collapse;

    position:relative;

    z-index:2;
}

table td{

    padding:16px;

    border-bottom:1px solid rgba(255,255,255,0.2);

    font-size:18px;
}

.back{

    text-align:center;

    margin-top:30px;

    position:relative;

    z-index:2;
}

.back a{

    text-decoration:none;

    background:#00bcd4;

    color:white;

    padding:12px 24px;

    border-radius:10px;

    font-weight:bold;
}

</style>

</head>

<body>

<div class="overlay">

<div class="box">

<h1>Student Fees Details</h1>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con =
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/Bareilly_University",
"root",
"1234"
);

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM students WHERE email=?"
);

ps.setString(1,email);

ResultSet rs = ps.executeQuery();

if(rs.next()){

%>

<table>

<tr>
<td><b>Student ID</b></td>
<td><%=rs.getInt("id")%></td>
</tr>

<tr>
<td><b>Name</b></td>
<td><%=rs.getString("name")%></td>
</tr>

<tr>
<td><b>Email</b></td>
<td><%=rs.getString("email")%></td>
</tr>

<tr>
<td><b>Department</b></td>
<td><%=rs.getString("department")%></td>
</tr>

<tr>
<td><b>Course Duration</b></td>
<td><%=rs.getString("duration")%></td>
</tr>

<tr>
<td><b>Total Fees</b></td>
<td><%=rs.getString("fees")%></td>
</tr>

</table>

<%

}

con.close();

}catch(Exception e){

out.println(e);

}

%>

<div class="back">

<a href="studentDashboard.jsp">

Back To Dashboard

</a>

</div>

</div>

</div>

</body>

</html>