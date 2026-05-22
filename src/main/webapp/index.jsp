<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>My Bareilly University</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

body {
    margin: 0;
    font-family: Arial;
    background: url("images/university.jpeg") no-repeat center center;
    background-size: cover;
}

/* POPUP */
#popup {
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.7);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 999;
}

/* POPUP CENTER */
.popup-content {
    text-align: center;
}

/* BIG LOGO */
.logo {
    width: 340px;
    margin-bottom: 30px;
}

/* SLOW PERFECT TYPING */
.typing {
    color: white;
    font-size: 38px;
    font-weight: bold;
    border-right: 3px solid white;
    white-space: nowrap;
    overflow: hidden;
    width: 0;
    margin: auto;
    animation: typing 6s steps(45, end) forwards, blink 1s infinite;
}

@keyframes typing {
    from { width: 0 }
    to { width: 600px } /* FULL TEXT SHOW FIX */
}

@keyframes blink {
    50% { border-color: transparent }
}

/* MAIN PAGE */
.main {
    display: none;
    height: 100vh;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

/* DARK OVERLAY (NO WHITE BOX NOW) */
.overlay {
    background: rgba(0,0,0,0.5);
    padding: 40px 60px;
    border-radius: 12px;
    text-align: center;
}

/* HEADING */
h1 {
    color: white;
    font-size: 42px;
    margin-bottom: 25px;
}

/* BUTTON */
.btn {
    padding: 14px 35px;
    border: none;
    border-radius: 6px;
    background: linear-gradient(45deg, #00bcd4, #2196f3);
    color: white;
    font-size: 18px;
    cursor: pointer;
}

.btn:hover {
    transform: scale(1.1);
}


@media screen and (max-width: 768px){

    body{
        overflow-x:hidden;
    }

    nav{
        display:flex;
        flex-wrap:wrap;
        justify-content:center;
        align-items:center;
    }

    nav a{
        font-size:14px !important;
        padding:5px !important;
        margin:2px !important;
    }

    img{
        max-width:100%;
        height:auto;
    }

    h1{
        font-size:28px;
        text-align:center;
    }

}

</style>

<script>
window.onload = function() {
    setTimeout(function() {
        document.getElementById("popup").style.display = "none";
        document.getElementById("mainContent").style.display = "flex";
    }, 6000);
};
</script>

</head>

<body>

<!-- POPUP -->
<div id="popup">
    <div class="popup-content">
        <img src="images/logo3.png" class="logo">
        <div class="typing">Welcome To My Bareilly University</div>
    </div>
</div>

<!-- MAIN -->
<div class="main" id="mainContent">
    <div class="overlay">
        <h1>Welcome To My Bareilly University</h1>

        <button class="btn" onclick="location.href='loginAdmin.jsp'">
            Admin Login
        </button>
    </div>
</div>

</body>
</html>