<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
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
	height: 400px;
}

form {
	text-align: center;
	width: 240px;
}

input[type=text] {
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
input[type=radio] {
	width: 240px;

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
.anuj{

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
.select{
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

				document.getElementById("p1").innerHTML = "please fill this field";
				document.getElementById("p2").innerHTML = "please fill this field";
			}

			else if (user.value == "") {
				document.getElementById("p1").innerHTML = "please fill this field";
			} else if (password.value == "") {
				document.getElementById("p2").innerHTML = "please fill this field";
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
	
	


<!-- Subject<input type="text" name="subject"/><br> -->
<%
try {
	boolean st = false;
	Class.forName("oracle.jdbc.driver.OracleDriver");
		
	Connection con = DriverManager
			.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"system", "root");
	PreparedStatement ps=con.prepareStatement("select unique subject from examinfo ");

	
	ResultSet rs=ps.executeQuery();
%>
 <center>
       <div class="signin">
		<form action="register.jsp">
			<h1>Enter Exam Details</h1>
		<p2 id="p2"></p2>
			<input type="text" name="standard" id="demo1" onclick="fun2()"
				placeholder="Standard" required="required"><br>
			<br>
			<br><br>
			
	Select Subject : <select id="select" name="Subject">
	
<%
while(rs.next())
	{
	%>
	
	 <p2 id="p2"></p2>
			
			
			<!-- <input type="radio" value="Subjective" name="examtype"  />Subjective
			<input type="radio" value="Objective" name="examtype" />Objective
		 -->
			

<option><%out.print(rs.getString(1));%></option>
 

	<%
	}
	%>
	 </select>
	
	
<%con.close(); %>

	
<%}catch (Exception e) {
	System.out.println(e);
}

%>        
      
			
			
		
		
          
<br><br><br><br>
<p2 id="p2"></p2>
			ExamType : <select id="select" name="type">
			<option>Subjective</option>
			<option>Objective</option>
			</select>
			<br><br><br>
<p3 id="p3"></p3>
			<input type="submit" value="Submit" onclick=fun()><br>
			<br>
			<div id="container"></div>
			<br>
			<br>

	</form>
	
	</div>
</center>
</body>
</html>