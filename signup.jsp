<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<String> tables= new ArrayList<>(); 
try { 
	String a = request.getParameter("name");
    String b = request.getParameter("email");
    String c = request.getParameter("pass");
    String d = request.getParameter("phone");
    String e = request.getParameter("gender");
    String f = request.getParameter("dob");
    String g = request.getParameter("address");

	
Class.forName("com.mysql.jdbc.Driver"); 


Connection con=DriverManager.getConnection( 
"jdbc:mysql://localhost:3306/usr?characterEncoding=latin1","root","7893933657svp");
Statement st = con.createStatement(); 
ResultSet r=st.executeQuery("show tables");
while(r.next()){
	tables.add(r.getString(1));
}
if (tables.contains(a)){
	out.println("<script>alert('Username Already Exists');</script>");
	out.println("<script>window.open('http://localhost:8080/PROJE/login.html','_self')</script>");
}
else{
	con=DriverManager.getConnection( 
	"jdbc:mysql://localhost:3306/usr?characterEncoding=latin1","root","7893933657svp");
	st = con.createStatement(); 
	String res=String.format("INSERT INTO users VALUES ('%s', '%s', '%s','%s','%s','%s','%s')",a,b,c,d,e,f,g);
	st.executeUpdate(res); 
	out.println("<script>alert('Registered sucessfully');</script>");
	con.close(); 
	con=DriverManager.getConnection( 
			"jdbc:mysql://localhost:3306/userdb?characterEncoding=latin1","root","7893933657svp");
	st=con.createStatement();
	res=String.format("create table %s (task varchar(50) not null unique primary key,date varchar(20),description varchar(255))",a);
	st.executeUpdate(res);
	out.println("<script>window.open('http://localhost:8080/PROJE/login.html','_self')</script>");
}
con.close();
} catch (Exception e) { 
System.err.println("Got an exception! "); 
System.err.println(e.getMessage()); 
} 
%>
</body>
</html>
