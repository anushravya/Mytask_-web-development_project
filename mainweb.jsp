<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.ArrayList" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="mainweb.css">
    
</head>
<body>
<%
/* Cookie c[] = request.getCookies();
String username = c[0].getValue(); */
var username = (String)session.getAttribute("name");
ArrayList<String> taskname = new ArrayList<>();
ArrayList<String> taskdate = new ArrayList<>();
ArrayList<String> taskdesc = new ArrayList<>();

out.println(username);

// Get an array of Cookies associated with the this domain

%>
	
		<div class="container">
        <div class="title">
            <h1>MY TASKS</h1>
        </div><br>
        <div class="main">
            <span id="startmsg">NO TASKS TODAY</span><br>
            <div class="tasks" style="display: flex; flex-direction:column; ">

            </div>
            <div class="taskpad" id="taskpad" style="display: none;">
                <span class="taskpad-span">
                <form action="addsql.jsp" method="post">
                <div class="task-name">
                        <h2>Task : </h2><input type="text" name="task-name" id="task-name" class="taskname"><br>
                    </div>
                    <div class="task-date">
                        <h2>Date : </h2><input type="date" name="task-date" id="task-date">
                    </div>
                    <div class="task-desc">
                        <h2>Description : </h2><textarea name="task-desc" id="task-desc" cols="20" rows="10"
                            style="resize:none;">
                    </textarea><br>
                	</div>
                    <input type="submit" value="save" id="savebuton" style="display: none;">
                    <input type="button" value="cancel" id="cancelbuton" style="display: none;" onclick='cancel()'>
                </form>
                </span>
            </div>
            <div class="new">
                <input type="button" id="newbuton" value="New Task"  onclick="create()">
            </div>
        </div>
    </div>

<script>

var taskname = [];
var taskdate = [];
var taskdesc = [];

<%
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection( 
		"jdbc:mysql://localhost:3306/userdb?characterEncoding=latin1","root","7893933657svp");
		Statement st = con.createStatement(); 
		String res=String.format("select * from %s;",username);
		ResultSet rs = st.executeQuery(res);
		int count = 0;
		while (rs.next()){
			count = count+1;
			taskname.add(rs.getString("task"));
			taskdate.add(rs.getString("date"));
			taskdesc.add(rs.getString("description"));
		}
		
		for(String x : taskname){
			out.println(String.format("taskname.push('%s');",x));
		}
		for(String x : taskdate){
			out.println(String.format("taskdate.push('%s');",x));
		}
		for(String x : taskdesc){
			out.println(String.format("taskdesc.push('%s');",x));
		}
		
		
		
	%>
function create(){
        document.getElementById("taskpad").style.display="block";
        document.getElementById("newbuton").style.display="none";
        document.getElementById("savebuton").style.display="block";
        document.getElementById("cancelbuton").style.display="block";
        document.getElementById("savebuton").style.alignitems="center"; 
        document.getElementById("cancelbuton").style.alignitems="center"; 
    }
function cancel(){
    document.getElementById("taskpad").style.display="none";
    document.getElementById("newbuton").style.display="block";
    document.getElementById("savebuton").style.display="none";
    document.getElementById("savebuton").style.display="none";
    document.getElementById("savebuton").style.alignitems="center";   
}

    count = "<%=count%>";
    count = parseInt(count);
    for(let i = 0 ; i < count ; i++){
    	document.getElementById("taskpad").style.display="none";
        document.getElementById("newbuton").style.display="block";
        document.getElementById("savebuton").style.display="none";
        var taskpad =  document.querySelector(".tasks");
        var a=document.createElement("div");
        a.classList.add("newtask");
        b=document.createElement("span");
        b.classList.add("spantask");
        c=document.createElement("span");
        c.classList.add("spandate");
        d=document.createElement("span");
        d.classList.add("spandesc");
        b.innerHTML= taskname[i] ;
        c.innerHTML= taskdate[i] ;
        d.innerHTML= taskdesc[i] ;
        a.prepend(d);
        a.prepend(c);
        a.prepend(b);
        taskpad.prepend(a);
        document.getElementById("task-name").value="";
        document.getElementById("task-date").value="";
        document.getElementById("task-desc").value="";
        document.getElementById("startmsg").style.display="none";
    }
    
    </script>
</body>
</html>
