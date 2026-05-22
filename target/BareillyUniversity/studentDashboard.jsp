<%@page import="java.sql.*"%>

<%

String email = (String)session.getAttribute("studentEmail");

if(email == null){

    response.sendRedirect("loginStudent.jsp");
    return;
}

String id="";
String name="";
String phone="";
String dept="";
String photo="default.jpg";



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

        id = rs.getString("id");
        name = rs.getString("name");
        email = rs.getString("email");
        phone = rs.getString("phone");
        dept = rs.getString("department");

        photo = rs.getString("photo");

        if(photo == null || photo.trim().equals("")){

            photo = "default.jpg";
        }
    }

}catch(Exception e){

    out.println(e);
}

%>

<!DOCTYPE html>

<html>

<head>

<title>Student Dashboard</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial;
}

body{

height:100vh;

display:flex;
justify-content:center;
align-items:center;

background:url('images/university.jpeg');

background-size:cover;
background-position:center;
}

.container{

width:720px;

padding:40px;

border-radius:25px;

background:rgba(255,255,255,0.15);

backdrop-filter:blur(12px);

box-shadow:0 0 20px rgba(0,0,0,0.5);

position:relative;

overflow:hidden;

color:white;
}

.container::before{

content:"";

position:absolute;

top:50%;
left:50%;

transform:translate(-50%,-50%);

width:300px;
height:300px;

background:url('images/logo.png');

background-size:contain;
background-repeat:no-repeat;
background-position:center;

opacity:0.08;
}

.profile{

text-align:center;

margin-bottom:25px;

position:relative;

z-index:2;
}

.profile img{

width:130px;
height:130px;

border-radius:50%;

border:4px solid #55e6ff;

object-fit:cover;

background:white;
}

.profile h2{

margin-top:15px;

font-size:34px;
}

table{

width:100%;

border-collapse:collapse;

position:relative;

z-index:2;
}

table tr{

border-bottom:1px solid rgba(255,255,255,0.3);
}

table td{

padding:15px;

font-size:18px;
}

table td:first-child{

font-weight:bold;

width:220px;
}

.buttons{

margin-top:35px;

display:flex;

justify-content:center;

gap:20px;

flex-wrap:wrap;

position:relative;

z-index:2;
}

.buttons a{

padding:12px 22px;

border-radius:10px;

text-decoration:none;

font-weight:bold;

color:white;

transition:0.3s;
}

.view{
background:#00c3ff;
}

.id{
background:#00d26a;
}

.pay{
background:#ffc107;
color:black !important;
}

.logout{
background:#ff5c5c;
}

.buttons a:hover{

transform:scale(1.08);
}

.topmenu{

position:absolute;

top:20px;

display:flex;

gap:35px;
}

.topmenu a{

color:white;

font-weight:bold;

text-decoration:none;
}

</style>

</head>

<body>

<div class="topmenu">

<a href="viewFees.jsp">View Fees</a>

<a href="idCard.jsp">ID Card</a>

<a href="payFees.jsp">Pay Fees</a>

<a href="StudentLogoutServlet">Logout</a>

</div>

<div class="container">

<div class="profile">

<%
String photoPath = photo;

if(photoPath == null || photoPath.equals("")){
    photoPath = "default.png";
}
%>

<img src="images/uploads/<%=photoPath%>"
     width="120"
     height="120"
     style="
        border-radius:50%;
        border:4px solid #55e6ff;
        object-fit:cover;
     ">

<h2>Student Dashboard</h2>

</div>

<table>

<tr>
<td>Student ID</td>
<td><%=id%></td>
</tr>

<tr>
<td>Name</td>
<td><%=name%></td>
</tr>

<tr>
<td>Email</td>
<td><%=email%></td>
</tr>

<tr>
<td>Phone</td>
<td><%=phone%></td>
</tr>

<tr>
<td>Department</td>
<td><%=dept%></td>
</tr>

</table>

<div class="buttons">

<a href="viewFees.jsp" class="view">
View Fees
</a>

<a href="idCard.jsp" class="id">
ID Card
</a>

<a href="payFees.jsp" class="pay">
Pay Fees
</a>

<a href="StudentLogoutServlet" class="logout">
Logout
</a>

</div>

</div>

</body>

</html>