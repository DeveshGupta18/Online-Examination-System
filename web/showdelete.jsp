<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

</style>
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
	width: 350px;
	padding: 40px;
	margin: auto;
	margin-top: 80px;
	height: 200px;
}

form {
	text-align: center;
	width: 240px;
}

input[type=text] {
	height: 50px;
	width: 350px;
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
	width: 350px;
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
<style>
	
		table{
	font-size:20px;
	font-color:BLACK;
		}
		th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: 	#696969;}
tr:nth-child(odd) {background-color: 	GREY;}
.button {
  background-color: GREY; /* Green */
 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
}

.button1 {border-radius: 8px;}

		</style>

</head>
<body>

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

<!-- Trigger/Open The Modal --><div align="center">
<!-- <a href="showsolution.html"><button class="button button1"><h3>Go Back</h3></button></a> -->
<button class="button button1" id="myBtn">Show Examcode</button></div>
<br>
<br>
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    
    
    
    
<%

		try {
			Connection co = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
	
			PreparedStatement ps = co.prepareStatement("select * from examinfo");
		ResultSet rs=ps.executeQuery();
%><center>
<table border=1px style="width:80%">
			  <tr>
			    <th>Subject</th>
			    <th>Standard</th> 
			    <th>Exam Type</th>
			    <th>Exam Code</th>
			    <th>Exam Date</th>
				 </tr>
<%
		while(rs.next())
			{
			%>
			
			 
			  <tr>
			  
			    <td><%=rs.getString(1) %></td>
			   <td><%=rs.getString(2) %></td>
			   <td><%=rs.getString(3)%></td>
			   <td><%=rs.getInt(4)%></td>
			   <td><%=rs.getString(5) %></td>
			  </tr>
			 

			<% 	
			}
			%>
			 </table>
			 </center>
			<%
			co.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>



  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</head>
<body>


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
	<script src="https://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous">
		
	</script>
	<script>
		$(function() {
			$("#header").load("header1.html");

		});
	</script>
	<center>
		<h1>Delete Paper</h1>
	</center>
	<div id="header"></div>

	<div class="signin">
		<form action="deletepaper.jsp">

			<p id="p1"></p>
			<input type="text" name="examcode" id="demo" value="" onClick=fun2()
				placeholder="Enter Exam Code"><br> <br>
			<br>
			<br>
			<p3 id="p3"></p3>
			<input type="submit" value="Delete" onclick=fun()><br> <br>
			<div id="container"></div>
			<br> <br>

		</form>
	</div>


<!-- <form action="deletepaper.jsp">
Exam Code<input type="text" name="examcode"/>
<input type="submit" value="Delete"/>
</form> -->
</body>
</html>