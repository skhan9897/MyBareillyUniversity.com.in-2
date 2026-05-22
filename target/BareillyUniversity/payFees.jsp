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

<title>Pay Fees</title>

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

    background:rgba(0,0,0,0.55);

    display:flex;
    justify-content:center;
    align-items:center;
}

.box{

    width:700px;

    background:rgba(255,255,255,0.95);

    border-radius:20px;

    padding:40px;

    position:relative;

    overflow:hidden;

    box-shadow:0 0 20px rgba(0,0,0,0.4);
}

.box::before{

    content:'';

    position:absolute;

    top:50%;
    left:50%;

    transform:translate(-50%,-50%);

    width:300px;
    height:300px;

    background:url('images/logo.png');

    background-size:contain;
    background-repeat:no-repeat;

    opacity:0.06;
}

h1{

    text-align:center;

    margin-bottom:30px;

    color:#222;

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

    border-bottom:1px solid #ddd;

    font-size:18px;

    color:#222;
}

.label{

    font-weight:bold;

    width:40%;
}

.formbox{

    margin-top:30px;

    position:relative;

    z-index:2;
}

input{

    width:100%;

    padding:14px;

    border-radius:8px;

    border:1px solid #ccc;

    margin-top:10px;

    font-size:18px;
}

button{

    width:100%;

    padding:15px;

    background:#00b894;

    border:none;

    color:white;

    font-size:18px;

    border-radius:10px;

    margin-top:20px;

    cursor:pointer;

    font-weight:bold;
}

button:hover{

    background:#00997a;
}

.back{

    text-align:center;

    margin-top:20px;
}

.back a{

    text-decoration:none;

    background:#00bcd4;

    color:white;

    padding:12px 24px;

    border-radius:10px;

    display:inline-block;
}

</style>

</head>

<body>

<div class="overlay">

<div class="box">

<h1>Pay Fees</h1>

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
<td class="label">Student ID</td>
<td><%=rs.getInt("id")%></td>
</tr>

<tr>
<td class="label">Student Name</td>
<td><%=rs.getString("name")%></td>
</tr>

<tr>
<td class="label">Department</td>
<td><%=rs.getString("department")%></td>
</tr>

<tr>
<td class="label">Total Fees</td>
<td><%=rs.getString("fees")%></td>
</tr>

</table>

<div class="formbox">

<form action="PayFeesServlet" method="post">

<input type="hidden"
name="studentId"
value="<%=rs.getInt("id")%>">

<input type="number"
name="amount"
placeholder="Enter Amount To Pay"
required>

<button type="submit">

Proceed To Pay

</button>

</form>

</div>

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