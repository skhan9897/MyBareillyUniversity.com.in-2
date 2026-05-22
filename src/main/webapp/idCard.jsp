<%@page import="java.sql.*"%>

<%

String email =
        (String)session.getAttribute("studentEmail");

if(email == null){

    response.sendRedirect("loginStudent.jsp");
    return;
}

String id = "";
String name = "";
String phone = "";
String department = "";
String photo = "";

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
                    "select * from students where email=?"
            );

    ps.setString(1,email);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){

        id = rs.getString("id");
        name = rs.getString("name");
        phone = rs.getString("phone");
        department = rs.getString("department");
        photo = rs.getString("photo");
    }

}catch(Exception e){
    out.println(e);
}

if(photo == null || photo.equals("")){
    photo = "default.png";
}

%>

<!DOCTYPE html>
<html>
<head>

<title>ID Card</title>

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

.card{

    width:330px;

    padding:25px;

    border-radius:20px;

    background:white;

    text-align:center;

    box-shadow:0 0 20px rgba(0,0,0,0.4);
}

.logo{

    width:90px;
    margin-bottom:10px;
}

.photo{

    width:120px;
    height:120px;

    border-radius:50%;

    object-fit:cover;

    border:4px solid #00cfff;

    margin-top:15px;
}

h2{
    margin-top:10px;
    color:#333;
}

.info{

    margin-top:20px;
    text-align:left;
}

.info p{

    margin-top:10px;
    font-size:16px;
}

.btns{

    margin-top:25px;
}

.btn{

    padding:10px 18px;

    border:none;

    border-radius:8px;

    color:white;

    text-decoration:none;

    margin:5px;

    display:inline-block;
}

.download{
    background:#00c853;
}

.back{
    background:#2196f3;
}

</style>

</head>

<body>

<div class="card">

    <img src="images/logo2.png" class="logo">

    <h2>Bareilly University</h2>

    <p>Student ID Card</p>

    <img src="images/uploads/<%=photo%>"
         class="photo">

    <div class="info">

        <p><b>ID :</b> <%=id%></p>

        <p><b>Name :</b> <%=name%></p>

        <p><b>Email :</b> <%=email%></p>

        <p><b>Phone :</b> <%=phone%></p>

        <p><b>Department :</b> <%=department%></p>

    </div>

    <div class="btns">

        <a href="#"
           onclick="window.print()"
           class="btn download">

           Download
        </a>

        <a href="studentDashboard.jsp"
           class="btn back">

           Back
        </a>

    </div>

</div>

</body>
</html>