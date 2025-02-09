<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<%
	try {
		String mail = request.getParameter("mail");
		String name = request.getParameter("name");
		String passwordd = request.getParameter("password");
		

		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection(

		"jdbc:mysql://localhost:3306/usr?characterEncoding=latin1", "root", "7893933657svp");

		//here project is database name, root is anil and anil

		PreparedStatement pst = con.prepareStatement("Select username,pass from users where username=? and pass=?");
        pst.setString(1, name);
        pst.setString(2, passwordd);
        ResultSet rs = pst.executeQuery(); 
        
        if(rs.next()) {          
           out.println("Valid login credentials");
       	   out.println("<script>window.open('http://localhost:8080/PROJE/mainweb.jsp','_self')</script>");
       	   /* Cookie c1 = new Cookie("name",name);
       	   response.addCookie(c1); */
       	   session.setAttribute("name",name);
        }
        else{%>
        <script>
        alert("invalid login credentials");
        window.open("http://localhost:8080/PROJE/login.html","_self");
        </script>
        <%}
           
		con.close();
		

	} catch (Exception e) {
		System.out.println(e);
	}
	%>
</body>
</html>
