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
int qno=(Integer)application.getAttribute("q");
String ans=request.getParameter("sol");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
String t=String.valueOf(application.getAttribute("ec"));
String t1="stu" +(String)application.getAttribute("id")+"id" +t;

Connection con = DriverManager
		.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
				"system", "root");
PreparedStatement ps=con.prepareStatement("insert into "+t1+" values(?,?)");
ps.setInt(1, qno);
ps.setString(2, ans);
ps.executeUpdate();
}catch(Exception e){
out.print(e);
}
application.setAttribute("q", qno+1);
response.sendRedirect("subexam.jsp");

%>
</body>
</html>ml>