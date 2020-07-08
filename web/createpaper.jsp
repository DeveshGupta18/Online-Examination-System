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
		String sname = request.getParameter("subjectname");
		String standard = request.getParameter("standard");
		String examtype = request.getParameter("examtype");
		String examdate= request.getParameter("examdate");
		if(examtype.equals("Objective")){
			%>
		<%-- 	<jsp:forward page="objective.jsp?subjectname="<%=sname %>"&standard="<%=standard %>"&examtype="<%=examtype %>"&examdate="<%=examdate %>"/> --%>
			<%-- <jsp:forward page="admin.jsp"/> --%>
			<jsp:forward page="objective.jsp"/>
			<%
		}
		
		try {
			boolean st = false;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
			PreparedStatement ps = conn
					.prepareStatement("select * from examcodegenerator");
			ResultSet rs=ps.executeQuery();
			rs.next();
			int examcode=rs.getInt(1);
			ps= conn.prepareStatement("delete from examcodegenerator");
			ps.executeUpdate();
			ps= conn.prepareStatement("insert into examcodegenerator values (?)");
			ps.setInt(1,examcode+1);
			ps.executeUpdate();
			conn.close();
			
			Connection con = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
			ps = con
					.prepareStatement("insert into examinfo values(?,?,?,?,?)");
			ps.setString(1, sname);
			ps.setString(2, standard);
			ps.setString(3, examtype);
			ps.setInt(4, examcode);
			ps.setString(5, examdate);
			
			ps.executeUpdate();
			con.close();
			
			String tablename="q" + String.valueOf(examcode);
			Connection co = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
			ps = co
					.prepareStatement("create table " +tablename+"(qno number, q varchar2(1000), marks number)");
			
			ps.executeUpdate();
			co.close();
			String tablenameh="r" + String.valueOf(examcode);
			out.print(tablenameh);
			Connection c = DriverManager
					.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"system", "root");
		Statement sta = c.createStatement();
			sta.execute("create table " +tablenameh+"(id number, marks number)");
			
		
			c.close(); 
			application.setAttribute("table", tablename);
			
		} catch (Exception e) {
			System.out.println(e);
	}
		%>
		<jsp:forward page="question.html"/>
		<%
	%>
</body>
</html>