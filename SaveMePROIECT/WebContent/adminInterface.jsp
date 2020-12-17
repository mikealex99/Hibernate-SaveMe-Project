<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="hibernate.model.Admin"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<%HibernateDao u= new HibernateDao();%>

<% String Utilizator=request.getParameter("Utilizator");
Admin existingAdmin = u.selectProfilAdmin(Utilizator); %>

<!DOCTYPE html>
<html>
<head>
<title>AdminInterfata</title>
<link rel="stylesheet" type="text/css" href="Css/adminInterfacestyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<meta charset="ISO-8859-1">
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul><li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li></ul>
		<ul><li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li></ul>
	</nav>
</header>

<div id="style" style="margin-bottom: 64px;"></div>
<div class="userlink">
	<div class="contain" style="display:flex;">
	<i class="fa fa-arrow-circle-right"></i>
	<form action="UsersAjutServlet" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit" class="userlink" style="background: none;border:none;margin-left:30px;" >Useri "vreau sa ajut"</button>
	</form></div>
	<div class="contain" style="display:flex;">
	<i class="fa fa-arrow-circle-right"></i>
	<form action="UsersCufarServlet" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit" class="userlink" style="background: none;border:none;margin-left:30px;" >Cufarul magic</button>
	</form></div>
	<div class="contain" style="display:flex;">
	<i class="fa fa-arrow-circle-right"></i>
	<form action="UsersVrAjutServlet" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit" class="userlink" style="background: none;border:none;margin-left:30px;" >Useri "am nevoie de ajutor"</button>
	</form></div>
	<div class="contain" style="display:flex;">
	<i class="fa fa-arrow-circle-right"></i>
	<form action="UsersNevoieServlet" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit" class="userlink" style="background: none;border:none;margin-left:30px;" >Nevoiasi</button>
	</form></div>
</div>

<!-- <a href="UsersCufar.jsp" class="userlink" ><i class="fa fa-arrow-circle-right" style="margin-right: 50px;"></i>Cufarul magic</a>
<a href="UsersVrAjut.jsp" class="userlink"><i class="fa fa-arrow-circle-right" style="margin-right: 50px;"></i>Useri "am nevoie de ajutor"</a>
<a href="UsersNevoie.jsp" class="userlink"><i class="fa fa-arrow-circle-right" style="margin-right: 50px;"></i>Nevoiasi</a>
 -->
 
</body>
</html>
