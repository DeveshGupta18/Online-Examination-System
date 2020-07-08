<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- <script>
function ale{
alert("Paper Deleted Successfully");}
</script> -->
</head>
<body>
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
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
	<script> 
$(function(){
  $("#header").load("header1.html"); 
  
});
</script> 
<div id="header"></div>
<%
	String examcode=request.getParameter("examcode");
try {
	Connection co = DriverManager
			.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"system", "root");
	PreparedStatement ps = co.prepareStatement("delete from examinfo where examcode=?");
	ps.setInt(1, Integer.parseInt(examcode));
	ps.executeUpdate();
	Statement st=co.createStatement();
	st.execute("drop table q"+examcode);
	co.close();
} catch (Exception e) {
	out.print(e);
}
%>
<center>
<h1> Paper Deleted</h1></center>
<center>
<a href="admin1.jsp"><button class="button button1"><h3>Go Back</h3></button></a>
</center>


</body>
</html>