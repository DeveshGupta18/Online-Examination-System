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
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<style>
body{
background-image: url('https://backgrounddownload.com/wp-content/uploads/2018/09/professional-form-background-image-6.jpg');
  background-size: cover;

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
	<script> 
$(function(){
  $("#header").load("header1.html"); 
  
});
</script> 
<div id="header"></div>

<% 
int id=Integer.parseInt((String)application.getAttribute("sid"));
int examcode=Integer.parseInt((String)application.getAttribute("examcode"));
int marks=Integer.parseInt(request.getParameter("marks"));
String t2="r"+examcode ;

Connection c = DriverManager
		.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
				"system", "root");
PreparedStatement ps=c.prepareStatement("update " +t2+" set marks=? where id=?");
ps.setInt(1, marks);
ps.setInt(2, id);
ps.executeQuery();

c.close(); 
out.print("<center><h1>Marks Updated</h1></center>");

%>
<br>

<br>
<br>
<center>
<a href="showsolution.html"><button class="button button1"><h3>Go Back</h3></button></a>
</center>
</body>
</html>