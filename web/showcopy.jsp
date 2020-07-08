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
	<script> 
$(function(){
  $("#header").load("header1.html"); 
  
});
</script> 
<div id="header"></div>

	<%
		String a = request.getParameter("code");
		String b = request.getParameter("id");

		String t1 = "stu" + b + "id" + a;
		try {
			Connection c = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
			Statement sta = c.createStatement();
			ResultSet rs = sta.executeQuery("select * from " + t1);
	%>
		<style>
		body{
background-image: url('https://backgrounddownload.com/wp-content/uploads/2018/09/professional-form-background-image-6.jpg');
  background-size: cover;

}
		table{
	font-size:20px;
		}
		th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
		</style>
		<center>
	<table border=1px style="width: 80%">
		<tr>
			<th>Q No</th>
			<th>Answer</th>



		</tr>
		<%
			while (rs.next()) {
		%>




		<tr>

			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>

		</tr>


</center>
		<%
			}
				c.close();
			} catch (Exception e) {
				out.print(e);

			}
		application.setAttribute("sid", b );
		application.setAttribute("examcode", a);
		%>
<div  align="center">
<form action="sendmarks.jsp">
<h3>Enter Total Marks for given answers</h3><input type="text" name="marks"/>
<input type="submit" value="Enter"/><br><br><br>
</form>
</div>
	
</body>
</html>