<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
function aler(){
alert("Invalid details");
window.location.replace("home.jsp");}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String a = request.getParameter("email");
		String b = request.getParameter("pass");
		out.print(a);
		out.print(b);
		try {
			boolean st = false;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
			PreparedStatement ps = conn
					.prepareStatement("select * from registration where email=? and password=?");
			ps.setString(1, a);
			ps.setString(2, b);
			ResultSet rs = ps.executeQuery();
			st = rs.next();
			out.print(st);
			if (st) {

				out.print("Login Successfully");
				application.setAttribute("id", String.valueOf(rs.getInt(5))); 
				response.sendRedirect("StudentHome.jsp");
			} else {

				out.print("Login Failed");
				application.setAttribute("id", "");%>
				<script>aler();</script>
		<%	}

			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>