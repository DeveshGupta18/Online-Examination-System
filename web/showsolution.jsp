<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
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


<br>
<br>
<!-- The Modal -->
<%
String code=request.getParameter("code");
		try {
			Connection co = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
	
			PreparedStatement ps = co.prepareStatement("select id from r"+code); //id of all the students who have 
                                                                                          //given the exam
		ResultSet rs=ps.executeQuery();
		PreparedStatement pt=co.prepareStatement("select * from registration where id=?");
		
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
		<table border=1px style="width:80%">
			  <tr>
			    <th>Name</th>
			    <th>Id</th> 
			    <th>Answer</th>
			    
			 
				 </tr>
		
		<%
		
		while(rs.next()){
			pt.setInt(1, rs.getInt(1));
			ResultSet rt=pt.executeQuery();
		
%>

<%
		while(rt.next())
			{
			%>
		 
			  <tr>
			  
			    <td><%=rt.getString(1) %></td>
			   <td><%=rt.getInt(5) %></td>
			    <td><a href="showcopy.jsp?code=<%=code%>&id=<%=rt.getInt(5)%>">Show</a></td>
			  </tr>
			  
			<% 	
			}
			%>
			 <%} %>
			<%
			co.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>

</table>
</center>
</body>
</html>