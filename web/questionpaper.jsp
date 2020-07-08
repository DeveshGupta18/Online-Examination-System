<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
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
  margin: 220px 160px 2px;
  cursor: pointer;
}

.button1 {border-radius: 8px;}
.button2 {border-radius:8px;}
.button3 {border-radius: 8px;}
.button4 {border-radius: 8px;}

</style>

	<a href="question.html"><button class="button button1">Add More Question</button></a>
	<a href="admin1.jsp">	<button class="button button1">Go to Home</button></a>

	<%
		int qno = Integer.parseInt(request.getParameter("qno"));
		String question = request.getParameter("question");

		int marks = Integer.parseInt(request.getParameter("marks"));
		try {
			Connection co = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
			String a = (String) application.getAttribute("table");
			PreparedStatement ps = co.prepareStatement("insert into " + a
					+ " values(?,?,?)");
			ps.setInt(1, qno);
			ps.setString(2, question);
			ps.setInt(3, marks);

			ps.executeUpdate();
			co.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>