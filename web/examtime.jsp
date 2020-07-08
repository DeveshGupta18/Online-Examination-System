<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background: url('https://cdn.hipwallpaper.com/m/91/99/ZbJ5Oy.jpg');
	background-size: cover;
	color: #fff;
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

.button1 {
	border-radius: 8px;
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
	<%
		int i = Integer.parseInt(request.getParameter("ec")); //examcode
		String str = "";
		String type = "";
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		String st = format.format(d); //current Date
		//out.println(i + st);
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
			PreparedStatement ps = con
					.prepareStatement("select * from examinfo where examcode=?");
			ps.setInt(1, i);

			ResultSet rs = ps.executeQuery();
			rs.next();
			str = (rs.getString(5)); //exam date
			type = rs.getString(3);
	%>

	<%
		con.close();
	%>


	<%
		} catch (Exception e) {
			System.out.println(e);
		}

		/* application.setAttribute("que", 1); */
		if (str.equals(st)) {
			if (type.equals("Objective")) {
				request.getRequestDispatcher(
						"Objexam1.jsp?ec=" + String.valueOf(i)).forward(
						request, response);
			}
			if (type.equals("Subjective")) {
				request.getRequestDispatcher(
						"Subexam1.jsp?ec=" + String.valueOf(i)).forward(
						request, response);
			}
		} else {
	%>

	<center>

		<h1>
			Exam will start on
			<%=str%></h1>
		<a href="StudentHome.jsp"><button class="button button1">
				<h3>Go Home</h3>
			</button></a>
	</center>
	<%
		}
	%>



</body>
</html>