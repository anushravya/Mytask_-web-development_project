<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	Cookie c[] = request.getCookies();
	String username = c[0].getValue();
	
	String a = request.getParameter("task-name");
	String b = request.getParameter("task-date");
	String d = request.getParameter("task-desc");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection( 
			"jdbc:mysql://localhost:3306/userdb?characterEncoding=latin1","root","7893933657svp");
			Statement st = con.createStatement(); 
			String res=String.format("INSERT INTO %s VALUES ('%s', '%s', '%s')",username,a,b,d);
			st.executeUpdate(res); 
			out.println("<script>alert('Task Saved Succesfully');</script>");
			out.println("<script>window.open('http://localhost:8080/PROJE/mainweb.jsp','_self')</script>");
			con.close(); 
	%>
</body>
</html>
