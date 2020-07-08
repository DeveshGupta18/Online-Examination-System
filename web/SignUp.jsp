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
	<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String pass= request.getParameter("pass");
	String dob= request.getParameter("dob");
	
	try {
		boolean st = false;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager
				
				.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
						"system", "root");
		PreparedStatement ps = conn
				.prepareStatement("select * from rollnumbergenerator");
		ResultSet rs=ps.executeQuery();
		rs.next();
		int id=rs.getInt(1);
		ps= conn.prepareStatement("delete from rollnumbergenerator");
		ps.executeUpdate();
		ps= conn.prepareStatement("insert into rollnumbergenerator values (?)");
		ps.setInt(1,id+1);
		ps.executeUpdate();
		conn.close();
		
		Connection con = DriverManager
				.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
						"system", "root");
		ps = con
				.prepareStatement("insert into registration values(?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2,	email);
		ps.setString(3, pass);
		ps.setString(4, dob);
		ps.setInt(5, id);
		ps.executeUpdate();
		con.close();
		
		String table="stu"+String.valueOf(id);
		Connection c = DriverManager
				.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
						"system", "root");
	Statement sta = c.createStatement();
		sta.execute("create table "+table+" (examcode number)");
		
	
		c.close(); 
	} catch (Exception e) {
		System.out.println(e);
}
	request.getRequestDispatcher("home.jsp").forward(request, response);
	%>

</body>
</html>