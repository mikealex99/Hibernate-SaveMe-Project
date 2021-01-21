<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="hibernate.model.User2"%>
<%@ page import="hibernate.model.Nevoie"%>
<%@ page import="hibernate.model.Admin"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<%HibernateDao u= new HibernateDao();%>

<% String Utilizator=request.getParameter("Utilizator");
Admin existingAdmin = u.selectProfilAdmin(Utilizator); %>

<%List<User2> listUser2 = u.selectAllUsers2();
request.setAttribute("listUsers2", listUser2);%>

<!DOCTYPE html>
<html>
<head>
<title>Useri "vreau ajutor"</title>
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

<h1 style="color:rgba(0,0,0,0.6);position:relative;text-align:center;padding-top:30px;text-shadow: -2px 0px 11px rgba(61, 57, 78, 1);">Useri "Am nevoie de ajutor"</h1>
<form action="adminInterfaceServlet" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit" class="btn btn-success" style="border:none;margin-left: 217px;" >Inapoi</button>
</form>

<div class="container">
<%for (User2 user2: listUser2) {   %>

	<div class="card">
		<div class="box">
			<div class="content">
				<form action="updateUser2" method="post">
					<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 	<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
					<input type="hidden" class="inputID" name="Code" value="<%=user2.getCode()%>" />
					<input type="hidden" class="inputID" name="Verificat" value="<%=user2.getVerificat()%>" />
					<input type="hidden" class="inputID" name="Id_UserNev" value="<%=user2.getId_UserNev()%>" />
					<input type="text" class="inputID" name="Id_user" value="<%=user2.getId()%>" />
					<input type="text" class="inputNume" name="Nume" value="<%=user2.getNume()%>" />
					<input type="text" class="inputNume" name="Prenume" value="<%=user2.getPrenume()%>" /><br><br>
					<i class="fa fa-map-marker" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Adresa" value="<%=user2.getAdresa()%>" /><br>
					<i class="far fa-envelope" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<input type="text" class="inputInfo" name="Email" value="<%=user2.getEmail()%>" /><br>
					<i class="fas fa-lock" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Parola" value="<%=user2.getParola()%>" /><br>
					<i class="fa fa-phone" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Telefon" value="<%=user2.getTelefon()%>" />
					<button type="submit" class="btn btn-primary" style="
						display:inline-block;
						padding: 8px 20px;
						text-decoration:none;position:relative;
						font-weight:400;
						top:75px;
						margin-right:110px;
					">Salveaza</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" formaction="deleteUser2" class="btn btn-danger"  style="		
						margin-top:35px;	
						margin-left:100px;" 
						onclick="return confirm('Sunteti sigur ca doriti sa stergeti acest user?')" >Sterge</button> 
				</form>
			</div>
		</div>
	</div>
	
<%} %>
</div>

</body>
</html>
