<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: url("images/university.jpeg") no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .box {
            background: rgba(255,255,255,0.9);
            padding: 30px;
            border-radius: 15px;
            width: 350px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        input {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 20px;
            color: white;
            cursor: pointer;
        }

        .login-btn {
            background: linear-gradient(45deg, #2196f3, #21cbf3);
        }

        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="box">

        <h2>Admin Login</h2>

        <% if(request.getParameter("error") != null){ %>
            <div class="error">Invalid Email or Password</div>
        <% } %>

        <form action="loginAdmin" method="post">
            <table>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" required></td>
                </tr>

                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <button class="btn login-btn">Login</button>
                    </td>
                </tr>
            </table>
        </form>

    </div>
</div>

</body>
</html>