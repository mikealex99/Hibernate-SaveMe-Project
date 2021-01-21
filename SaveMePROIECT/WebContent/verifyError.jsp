<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.dao.HibernateDao"%>
<%@ page import="hibernate.model.User"%>

<%HibernateDao u= new HibernateDao();%>

<% String Email=request.getParameter("Email");
User existingUser = u.selectProfil(Email); %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/adminstyle.css">
<title>Admin</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:15px;margin-left:15px;">
		<ul><li><a href="home.html">Home</a></li></ul>
		<ul><li><a href="admin.jsp">Admin</a></li></ul>
	</nav>
</header>


<div class="wrapper">
  <div class="title" style="color:red;">Codul introdus este incorect!</div>
  <div class="form">
  		 <span style="margin-left: 40px;">Nu ai primit niciun cod? 
	 	<form action="ReVerify" method="post">
			<input type="hidden" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
			<input type="hidden" name="Verificat" value="<%=existingUser.getVerificat()%>">
			<input type="hidden" name="Id_user" value="<%=existingUser.getId()%>">
			<input type="hidden" name="Email" value="<%=existingUser.getEmail()%>">
			<input type="hidden" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
			<input type="hidden" name="Parola" value="<%=existingUser.getParola()%>">
			<input type="hidden" name="Nume" value="<%=existingUser.getNume()%>">
			<input type="hidden" name="Prenume" value="<%=existingUser.getPrenume()%>">
			<input type="hidden" name="Telefon" value="<%=existingUser.getTelefon()%>">
			<input type="hidden" name="Adresa" value="<%=existingUser.getAdresa()%>">
			<input type="submit" class="btnretrimite" value="Retrimite">
		</form>
	 </span>
  </div>
</div>
      
</body>
</html>