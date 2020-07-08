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
String code=request.getParameter("ecode");
int marks=0;
try {
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager
			.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
					"system", "root");
	PreparedStatement ps = conn
			.prepareStatement("select * from r"+code);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		//out.print(rs.getInt(1));
		int id=rs.getInt(1);
		PreparedStatement pt = conn
				.prepareStatement("select * from q"+code);
		ResultSet rt=pt.executeQuery();
		PreparedStatement pr = conn
				.prepareStatement("select * from stu"+id+"id"+code);
		ResultSet rr=pr.executeQuery();
		
		while(rr.next()){
			rt.next();
			if((rt.getString(7)).equals(rr.getString(2))){
				marks+=rt.getInt(8);
			//out.print(rt.getString(7));
			//out.print(rr.getString(2));
			}
			
		}
		PreparedStatement pu=conn.prepareStatement("Update r"+code+" set marks=? where id=?");
		pu.setInt(1, marks);
		pu.setInt(2, id);
		pu.executeUpdate();
		marks=0;
		
	}
	
	conn.close();
}catch(Exception e){
	
}
%>
<center>
<h1> Result Declared</h1></center>
<center>
<a href="admin1.jsp"><button class="button button1"><h3>Go Back</h3></button></a>
</center>

</body>
</html>