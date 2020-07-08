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
	height: 370px;
}

form {
	text-align: center;
	width: 240px;
}
textarea
{
height: 50px;
	width: 350px;
	text-align: center;
	background: transparent;
	border: 1px solid white;
	border-bottom: 1px solid white;
	font-family: 'play' sans-serif;
	font-size: 16px;
	font-weight: 200px;
	padding: 10px 0;
	transition: border 0.5s;
	outline: none;
	color: white;
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

input[type=button] {
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

input[type=button]:hover {
	color: #fff;
	background-color: #000;
	font-weight: bold;
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

<%
String user=(String)application.getAttribute("id");
String code=(String)application.getAttribute("ec");
int qno=(Integer)application.getAttribute("q");
boolean flag=true;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection con = DriverManager
			.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"system", "root");
	PreparedStatement ps=con.prepareStatement("select * from q"+code+ " where qno=?");
	ps.setInt(1, qno);
	ResultSet rs=ps.executeQuery();
	%>
	   
<%
boolean tf=false;
while(flag=rs.next())
	{
	tf=flag;
	%>
	
	 
	<div class="signin">
		<form action="sendsolution1.jsp">
	
	  
 
	    <%= "Question" %>
	   <%=rs.getString(1) %>
	   <%= ")" %>
	 <%= rs.getString(2) %>
	 
	
 
	
	
		
			<br>
			<br>
			<p3 id="p3"></p3>
			
    
      <label for="subject"> </label>
   <br> <br> <br>
			<textarea name="sol" rows="10" cols="30">Enter Answer...</textarea>
  <br><br><br><br><br>
  
  
			<input type="submit" value="Submit Answer" onclick=fun()><br> <br>
			<div id="container"></div>
			<br> <br>
				
		</form>
		<a href="completepaper.html"><input type="button" value="End Test"/></a>
		
	</div>

	<% 	
	}
if(!tf)
{
	%>
	<center>
	<h1>Exam Completed</h1>
	<a href="StudentHome.jsp"><button class="button button1"><h3>Go Home</h3></button></a>
	</center>

<%}

	%>
	
	
	
	<%
	

}catch(Exception e){
	out.print(e);
}


%>
</body>
</html>