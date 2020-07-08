<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
body{
background-image: url('https://backgrounddownload.com/wp-content/uploads/2018/09/professional-form-background-image-6.jpg');
  background-size: cover;

}
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



		</style>

</head>
<body>






	<script src="https://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous">
		
	</script>
	<script>
		$(function() {
			$("#header").load("header.html");

		});
	</script>
	
	<div id="header"></div>
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

<center>

<table border=1px style="width:80%">
	  <tr>
	    <th>Subject</th>
	    <th>Standard</th> 
	    <th>Exam Type</th>
	    <th>Exam Code</th>
	    <th>Exam Date</th>
	    <th>Start Test</th>
	    
		 </tr>
<%

try {
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
		
	Connection con = DriverManager
			.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"system", "root");
	PreparedStatement ps=con.prepareStatement("select * from"
			+ " stu" + (String)application.getAttribute("id") );
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		PreparedStatement pt=con.prepareStatement("select * from examinfo where examcode=?");
		pt.setInt(1, rs.getInt(1));
		ResultSet rt=pt.executeQuery();
		rt.next();	
	%>
	

	
	 
	  <tr>
	  
	    <td><%=rt.getString(1) %></td>
	   <td><%=rt.getString(2) %></td>
	   <td><%=rt.getString(3)%></td>
	   <td><%=rt.getInt(4)%></td>
	   <td><%=rt.getString(5) %></td>
		<td><a href="examtime.jsp?ec=<%=rt.getInt(4)%>">Click to Start</a>
	  </tr>
	 

	<%
	}
	%>
	 </table></center>
	
	
	
	<% con.close();%>

	
<%}catch (Exception e) {
	System.out.println(e);
}

%>
<%

%>
</body>
</html>