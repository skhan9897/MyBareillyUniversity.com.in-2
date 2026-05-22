<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Fees</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: url('images/university.jpeg') no-repeat center center/cover;
        height: 100vh;
    }

    .container {
        width: 400px;
        margin: 80px auto;
        background: rgba(0, 0, 0, 0.6);
        padding: 30px;
        border-radius: 15px;
        color: white;
        box-shadow: 0 0 15px rgba(0,0,0,0.5);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    input, select {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: none;
        border-radius: 5px;
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #00c853;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover {
        background: #009624;
    }

    .nav {
        text-align: center;
        margin-top: 15px;
    }

    .nav a {
        color: white;
        text-decoration: none;
        margin: 10px;
        padding: 8px 15px;
        border-radius: 5px;
        background: #2196f3;
    }

    .nav a:hover {
        background: #0b7dda;
    }
</style>

</head>

<body>

<div class="container">
    <h2>Add Student Fees</h2>

    <form action="addFees" method="post">

    <input type="number"
           name="studentId"
           placeholder="Enter Student ID"
           required>

    <select name="department" required>
        <option>BCA</option>
        <option>B.Tech</option>
        <option>BBA</option>
        <option>MBBS</option>
    </select>

    <select name="duration" required>
        <option>2 Years</option>
        <option>3 Years</option>
        <option>4 Years</option>
        <option>5 Years</option>
    </select>

    <input type="number"
           name="totalFees"
           placeholder="Enter Total Fees"
           required>

    <button type="submit">Add Fees</button>

</form>
    <div class="nav">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="viewFees">View Fees</a>
    </div>
</div>

</body>
</html>