<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="hibernate.model.User"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<%HibernateDao u= new HibernateDao();%>

<%List<User> listUser = u.selectAllUsers();
request.setAttribute("listUsers", listUser);%>


<!DOCTYPE html>
<html>
<head>
<title>Useri "Ajut"</title>
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

<h1 style="color:rgba(0,0,0,0.6);position:relative;text-align:center;padding-top:30px;text-shadow: -2px 0px 11px rgba(61, 57, 78, 1);">Useri "Vreau sa ajut"</h1>
<a href="adminInterface.jsp" class="btn btn-success" style="margin-left: 217px;">Inapoi</a>			
<div class="container">
<%for (User user: listUser) {   %>

	<div class="card">
		<div class="box">
			<div class="content">
				<form action="updateUser" method="post">
					<input type="hidden" class="inputID" name="Id_cufar" value="<%=user.getIdCufar()%>" />
					<input type="text" class="inputID" name="Id_user" value="<%=user.getId()%>" />	
					<input type="text" class="inputNume" name="Nume" value="<%=user.getNume()%>" />
					<input type="text" class="inputNume" name="Prenume" value="<%=user.getPrenume()%>" /><br><br>
					<i class="fa fa-map-marker" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Adresa" value="<%=user.getAdresa()%>" /><br>
					<i class="far fa-envelope" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<input type="text" class="inputInfo" name="Email" value="<%=user.getEmail()%>" /><br>
					<i class="fas fa-lock" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Parola" value="<%=user.getParola()%>" /><br>
					<i class="fa fa-phone" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Telefon" value="<%=user.getTelefon()%>" />
					<button type="submit" class="btn btn-primary" style="display:inline-block;
						padding: 8px 20px;
						text-decoration:none;position:relative;
						font-weight:400;
						top:75px;
						margin-right:110px;
					">Salveaza</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" formaction="deleteUser" class="btn btn-danger"  style="		
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
