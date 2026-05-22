<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial;
        }

        body{

            min-height:100vh;
            padding:30px;

            display:flex;
            justify-content:center;
            align-items:center;

            background:url('images/university.jpeg');
            background-size:cover;
            background-position:center;
            background-attachment:fixed;
        }

        .container{

            width:450px;

            background:rgba(255,255,255,0.18);
            backdrop-filter:blur(10px);

            padding:25px;

            border-radius:20px;

            box-shadow:0 0 20px rgba(0,0,0,0.3);
        }

        .logo{
            text-align:center;
            margin-bottom:10px;
        }

        .logo img{
            width:100px;
            height:100px;
            object-fit:contain;
        }

        h2{
            text-align:center;
            color:white;
            margin-bottom:20px;
        }

        input,select{

            width:100%;
            padding:12px;

            border:none;
            outline:none;

            border-radius:10px;

            margin-top:12px;

            background:rgba(255,255,255,0.9);
        }

        label{
            color:white;
            font-size:14px;
            margin-top:12px;
            display:block;
        }

        button{

            width:100%;
            padding:14px;

            margin-top:20px;

            border:none;
            border-radius:10px;

            background:#00d9ff;

            color:white;
            font-size:17px;
            font-weight:bold;

            cursor:pointer;
        }

        button:hover{
            background:#00b4d8;
        }

        ::placeholder{
            color:#666;
        }

    </style>

</head>

<body>

<div class="container">

    <div class="logo">
        <img src="images/logo.png">
    </div>

    <h2>Student Registration</h2>

    <form action="RegisterStudentServlet"
          method="post"
          enctype="multipart/form-data">

        <input type="text"
               name="name"
               placeholder="Full Name"
               required>

        <input type="number"
               name="age"
               placeholder="Age"
               required>

        <input type="email"
               name="email"
               placeholder="Email"
               required>

        <input type="text"
               name="phone"
               placeholder="Phone Number"
               required>

        <!-- DEPARTMENT -->

        <select name="department"
                id="department"
                onchange="setCourseDetails()"
                required>

            <option value="">Select Course</option>

            <option value="B.Tech CSE">B.Tech CSE</option>
            <option value="B.Tech AI">B.Tech AI</option>
            <option value="B.Tech Mechanical">B.Tech Mechanical</option>
            <option value="B.Tech Civil">B.Tech Civil</option>

            <option value="BCA">BCA</option>
            <option value="MCA">MCA</option>
            <option value="B.Sc IT">B.Sc IT</option>

            <option value="D Pharma">D Pharma</option>
            <option value="B Pharma">B Pharma</option>
            <option value="M Pharma">M Pharma</option>
            <option value="Pharm D">Pharm D</option>

        </select>

        <!-- DURATION -->

        <select name="duration"
                id="duration"
                required>

            <option value="">Course Duration</option>

        </select>

        <!-- FEES -->

        <input type="number"
               name="fees"
               id="fees"
               placeholder="Total Fees"
               readonly>

        <!-- PASSWORD -->

        <input type="password"
               name="password"
               placeholder="Password"
               required>

        <!-- PHOTO -->

        <label>Upload Photo</label>

        <input type="file"
               name="photo"
               accept=".jpg,.jpeg,.png"
               required>

        <!-- AADHAAR -->

        <label>Upload Aadhaar</label>

        <input type="file"
               name="aadhaar"
               accept=".pdf,.jpg,.jpeg,.png"
               required>

        <!-- 10TH -->

        <label>Upload 10th Marksheet</label>

        <input type="file"
               name="marksheet10"
               accept=".pdf,.jpg,.jpeg,.png"
               required>

        <!-- 12TH -->

        <label>Upload 12th Marksheet</label>

        <input type="file"
               name="marksheet12"
               accept=".pdf,.jpg,.jpeg,.png"
               required>

        <button type="submit">
            Register Student
        </button>
<a href="dashboard.jsp"
           class="btn back">

           Back
        </a>

    </form>

</div>

<script>

function setCourseDetails(){

    let course =
        document.getElementById("department").value;

    let duration =
        document.getElementById("duration");

    let fees =
        document.getElementById("fees");

    duration.innerHTML = "";

    // BTECH

    if(course === "B.Tech CSE"
        || course === "B.Tech AI"
        || course === "B.Tech Mechanical"
        || course === "B.Tech Civil"){

        duration.innerHTML =
            "<option>4 Years</option>";

        fees.value = 450000;
    }

    // BCA

    else if(course === "BCA"){

        duration.innerHTML =
            "<option>3 Years</option>";

        fees.value = 180000;
    }

    // MCA

    else if(course === "MCA"){

        duration.innerHTML =
            "<option>2 Years</option>";

        fees.value = 150000;
    }

    // BSC IT

    else if(course === "B.Sc IT"){

        duration.innerHTML =
            "<option>3 Years</option>";

        fees.value = 170000;
    }

    // D PHARMA

    else if(course === "D Pharma"){

        duration.innerHTML =
            "<option>2 Years</option>";

        fees.value = 220000;
    }

    // B PHARMA

    else if(course === "B Pharma"){

        duration.innerHTML =
            "<option>4 Years</option>";

        fees.value = 500000;
    }

    // M PHARMA

    else if(course === "M Pharma"){

        duration.innerHTML =
            "<option>2 Years</option>";

        fees.value = 250000;
    }

    // PHARM D

    else if(course === "Pharm D"){

        duration.innerHTML =
            "<option>6 Years</option>";

        fees.value = 700000;
    }

}

</script>

</body>
</html>