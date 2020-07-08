<!DOCTYPE html>
<html lang="en">
<head>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
  <style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background: url('https://cdn.hipwallpaper.com/m/91/99/ZbJ5Oy.jpg');
	background-size: cover;
	color: #fff;
}

.signin {
	text-align: center;
	/* font-size: 30px; */
	background: rgba(44, 62, 80, 0.7);
	margin-left: 180px;
	font-weight: bold;
	width: 250px;
	padding: 40px;
	margin: auto;
	margin-top: 80px;
	height: 300px;
}

form {
	text-align: center;
	width: 240px;
}

input[type=email] {
	width: 240px;
	text-align: center;
	background: transparent;
	border: none;
	border-bottom: 1px solid white;
	font-family: 'play' sans-serif;
	font-size: 16px;
	font-weight: 200px;
	padding: 10px 0;
	transition: border 0.5s;
	outline: none;
	color: white;
}

input[type=date] {
	width: 240px;
	right-margin:-5px;
	text-align: center;
	background: transparent;
	border: none;
	border-bottom: 1px solid white;
	font-family: 'play' sans-serif;
	font-size: 16px;
	font-weight: 200px;
	padding: 10px 0;
	transition: border 0.5s;
	outline: none;
	color: white;
}

input[type=password] {
	width: 240px;
	text-align: center;
	background: transparent;
	border: none;
	border-bottom: 1px solid white;
	font-family: 'play' sans-serif;
	font-size: 16px;
	font-weight: 200px;
	padding: 10px 0;
	transition: border 0.5s;
	outline: none;
	color: white;
}

input[type=submit] {
	width: 190px;
	border: none;
	background: white;
	color: #000;
	font-size: 16px;
	line-height: 25px;
	padding: 10px 0;
	border-radius: 20px;
	cursor: pointer;
	font-weight: bold;
}

input[type=submit]:hover {
	color: #fff;
	background-color: #000;
	font-weight: bold;
}

h1 {
	color: #fff;
}

a {
	font-size: 13px;
	color: skyblue;
}

a:hover {
	color: blueviolet;
}

.container {
	display: flex;
	flex-direction: row;
	width: 100px;
	/* font-size: 15px; */
}

::placeholder {
	color: aliceblue;
	opacity: 0.8px;
}
</style>
</head>

<body id="c2">

	<script>
		function fun2() {
			document.getElementById("p1").innerHTML = "";
			document.getElementById("p2").innerHTML = "";

		}

		function fun() {
			var user = document.getElementById("demo");
			var password = document.getElementById("demo1");
			if (user.value == "" && password.value == "") {

				document.getElementById("p1").innerHTML = "please enter your usernamname";
				document.getElementById("p2").innerHTML = "please enter password";
			}

			else if (user.value == "") {
				document.getElementById("p1").innerHTML = "please enter your name";
			} else if (password.value == "") {
				document.getElementById("p2").innerHTML = "please enter password";
			}
		}
	</script>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
	<script> 
$(function(){
  $("#header").load("header.html"); 
  
});
</script> 
<div id="header"></div>
    <div class="signin">
        <form action="login.jsp" method="post">  
                <h1>Login</h1>
                <p id="p1"></p>
                <input type="email" name="email" id="demo" value="" onClick=fun2() required="required" placeholder="Email"><br><br>
                <p2 id="p2"></p2>
                <input type="password" name="pass" id="demo1" onclick="fun2()" required="required" placeholder="Password"><br><br>
                <p3 id="p3"></p3>
                <input type="submit" value="Submit" onclick=fun()><br><br>
                <div id="container">
                  
                  
               </div><br><br>

        </form>
    </div>
    <!-- <script>
        var user=document.getElementById("demo").value;
        function fun(){
            if(user==""){
            document.getElementById("demo").innerHTML="please enter ur name";
        }
        }
      
    </script> -->
</body>
</html>