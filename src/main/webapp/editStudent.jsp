<%@ page import="java.sql.*" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/Bareilly_University","root","1234");

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM students WHERE id=?");

ps.setInt(1,id);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Student</title>

<style>
body{
    margin:0;
    font-family:Arial;
    background:url('images/university.jpeg') no-repeat center;
    background-size:cover;
}

/* ? TOP LOGO */
.top-logo{
    text-align:center;
    margin-top:20px;
}

.top-logo img{
    width:120px;
}

/* ? FORM BOX */
.container{
    width:400px;
    margin:30px auto;
    background:rgba(255,255,255,0.95);
    padding:25px;
    border-radius:10px;
    position:relative;
    box-shadow:0 0 15px rgba(0,0,0,0.3);
}

/* ? WATERMARK */
.container::before{
    content:"";
    background:url('images/logo2.png') no-repeat center;
    background-size:200px;
    opacity:0.08;
    position:absolute;
    width:100%;
    height:100%;
    top:0;
    left:0;
    pointer-events:none;
}

/* FORM */
input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border:1px solid #ccc;
    border-radius:5px;
}

/* BUTTON */
button{
    width:100%;
    padding:10px;
    background:#007bff;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
    font-weight:bold;
}

button:hover{
    background:#0056b3;
}

h2{
    text-align:center;
    margin-bottom:10px;
}
</style>

</head>

<body>

<!-- ? TOP LOGO -->
<div class="top-logo">
    <img src="images/logo2.png">
    <h2>Edit Student</h2>
</div>

<!-- ? FORM BOX -->
<div class="container">

<form action="updateStudent" method="post">

<input type="hidden" name="id" value="<%=id%>">

<input type="text" name="name" value="<%=rs.getString("name")%>" placeholder="Name">

<input type="text" name="email" value="<%=rs.getString("email")%>" placeholder="Email">

<input type="text" name="phone" value="<%=rs.getString("phone")%>" placeholder="Phone">

<button type="submit">Update Student</button>

</form>

</div>

</body>
</html>