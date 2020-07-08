<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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





</head>
<body>




	<script src="https://code.jquery.com/jquery-3.3.1.js"
		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
		crossorigin="anonymous">
		
	</script>
	<script>
		$(function() {
			$("#header").load("header1.html");

		});
	</script>
	
	<div id="header"></div>
	</body>
	</html>