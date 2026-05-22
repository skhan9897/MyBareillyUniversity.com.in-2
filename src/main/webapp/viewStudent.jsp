<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<title>View Students</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial;
}

body{

    min-height:100vh;

    background:url('images/university.jpeg');

    background-size:cover;
    background-position:center;

    padding:30px;
}

.container{

    width:95%;

    margin:auto;

    background:rgba(255,255,255,0.15);

    backdrop-filter:blur(12px);

    border-radius:20px;

    padding:25px;

    box-shadow:0 0 15px rgba(0,0,0,0.3);
}

h1{

    text-align:center;

    color:white;

    margin-bottom:25px;
}

table{

    width:100%;

    border-collapse:collapse;

    background:rgba(255,255,255,0.12);

    overflow:hidden;

    border-radius:15px;
}

th{

    background:#00cfff;

    color:white;

    padding:14px;

    font-size:16px;
}

td{

    padding:12px;

    text-align:center;

    color:white;

    border-bottom:1px solid rgba(255,255,255,0.2);
}

tr:hover{

    background:rgba(255,255,255,0.1);
}

.photo{

    width:70px;
    height:70px;

    border-radius:50%;

    object-fit:cover;

    border:3px solid white;
}

.btn{

    padding:8px 14px;

    border:none;

    border-radius:8px;

    text-decoration:none;

    color:white;

    font-size:14px;
}

.edit{
    background:#00c853;
}

.delete{
    background:#ff1744;
}

</style>

</head>

<body>

<div class="container">

<h1>All Students</h1>

<table>

<tr>

    <th>ID</th>
    <th>Photo</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Department</th>
    <th>Duration</th>
    <th>Fees</th>
    <th>Action</th>

</tr>

<%

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con =
            DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Bareilly_University",
                    "root",
                    "1234"
            );

    Statement st = con.createStatement();

    ResultSet rs =
            st.executeQuery(
                    "select * from students"
            );

    while(rs.next()){

%>

<tr>

<td>
    <%=rs.getInt("id")%>
</td>

<td>

<img src="images/uploads/<%=rs.getString("photo")%>"
     class="photo">

</td>

<td>
    <%=rs.getString("name")%>
</td>

<td>
    <%=rs.getString("email")%>
</td>

<td>
    <%=rs.getString("phone")%>
</td>

<td>
    <%=rs.getString("department")%>
</td>

<td>
    <%=rs.getString("duration")%>
</td>

<td>
    <%=rs.getString("fees")%>
</td>

<td>

<a href="editStudent.jsp?id=<%=rs.getInt("id")%>"
   class="btn edit">

   Edit
</a>

<a href="DeleteStudentServlet?id=<%=rs.getInt("id")%>"
   class="btn delete">

   Delete
</a>

</td>

</tr>

<%

    }

    con.close();

}catch(Exception e){

    out.println(e);

}

%>

</table>

</div>

</body>
</html>