<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<%HibernateDao u= new HibernateDao();%>

<%List<Cufar> listCufar= u.selectAllCufarNev();
request.setAttribute("listUsers2", listCufar);%>

<!DOCTYPE html>
<html>
<head>
<title>Useri "cufar"</title>
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

<h1 style="color:rgba(0,0,0,0.6);position:relative;text-align:center;padding-top:30px;text-shadow: -2px 0px 11px rgba(61, 57, 78, 1);">Lista gift-uri</h1>
<a href="adminInterface.jsp" class="btn btn-success" style="margin-left: 217px;">Inapoi</a>
<div class="container">
<%for (Cufar users: listCufar) {   %>

	<!-- Afisare gift-uri -->
<%String test=users.getTitlu();
if(test != null && !test.equals("null")){%>

	<div class="card">	
		<div class="box">
			<div class="content">
				<form action="updateCufar" method="post">
					<input type="hidden" class="inputID" name="Data" value="<%=users.getData()%>" />
					<input type="hidden" class="inputID" name="Id_cufar" value="<%=users.getIdCufar()%>" />
					<input type="text" class="inputID" name="Id" value="<%=users.getId()%>" />
					<input type="text" class="inputNume" name="Titlu" value="<%=users.getTitlu()%>" />
					<i class="fas fa-comments" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<input type="text" class="inputInfo" name="Text" value="<%=users.getText()%>" style="width: 210px;"><br>
					<i class="fa fa-phone" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Telefon" value="<%=users.getTelefon()%>" />
					<button type="submit" class="btn btn-primary" style="display:inline-block;
						padding: 8px 20px;
						text-decoration:none;position:relative;
						font-weight:400;
						top:75px;
						margin-right:110px;
					">Salveaza</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" formaction="deleteCufar" class="btn btn-danger"  style="		
						margin-top:30px;	
						margin-left:100px;" 
						onclick="return confirm('Sunteti sigur ca doriti sa stergeti acest gift?')" >Sterge</button>	
				</form>
			</div>
		</div>
	</div>
<%}} %>
</div>

</body>
</html>
