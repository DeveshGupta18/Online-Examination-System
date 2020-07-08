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
  $("#header").load("header.html"); 
  
});
</script> 
<div id="header"></div>
<div id="header"></div>
	<%
		 try {
			boolean st = false;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager

			.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system",
					"root");
			String t=request.getParameter("id"); //examcode
			PreparedStatement ps = conn.prepareStatement("insert into"
					+ " r" + t + " values(?,?)");
			ps.setInt(1, Integer.parseInt((String) application
					.getAttribute("id"))); //rollnumber
			ps.setInt(2, 0);
			ps.executeUpdate();
			conn.close();
		
			Connection con= DriverManager

					.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system",
							"root");
					PreparedStatement p = con.prepareStatement("insert into"
							+ " stu" + (String)application.getAttribute("id") + " values(?)");
					p.setInt(1, Integer.parseInt(t));
					p.executeUpdate();
					con.close(); 
							
		String t1="stu" +(String)application.getAttribute("id")+"id" +t;
	//out.print(t1); 
 Connection co= DriverManager
		.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system",
				"root");
			PreparedStatement pt = co.prepareStatement("create table "+t1+" (qno number, ans varchar2(1000))");
			
			pt.executeQuery();
			co.close();			
					 
					
					
		 } catch (Exception e) {
			System.out.println(e);
		}
		//out.print("Registration Done");
	%>
	<center>
<h1> Registration Successful</h1></center>
<center>
<a href="StudentHome.jsp"><button class="button button1"><h3>Go Home</h3></button></a>
</center>
</body>
</html>