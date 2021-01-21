<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.dao.HibernateDao"%>
<%@ page import="hibernate.model.User2"%>

<%HibernateDao u= new HibernateDao();%>

<% String Email=request.getParameter("Email");
User2 existingUser = u.selectProfil2(Email); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/verifyStyle.css">
<title>Verificare</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:15px;margin-left:15px;">
		<ul><li><a href="admin.jsp">Admin</a></li></ul>
		<ul><li><a href="home.html">Home</a></li></ul>
	</nav>
</header>


<div class="wrapper">
  <div class="title">Introduceti codul de verificare</div>
  <div class="form">
  
  	<form action="VerifyCode2" method="post"> 
      <div class="input_field">
      	<input type="hidden" name="Id_UserNev" value="<%=existingUser.getId_UserNev()%>">
		<input type="hidden" name="Id_user" value="<%=existingUser.getId()%>">
		<input type="hidden" name="Email" value="<%=existingUser.getEmail()%>">
		<input type="hidden" name="Parola" value="<%=existingUser.getParola()%>">
		<input type="hidden" name="Nume" value="<%=existingUser.getNume()%>">
		<input type="hidden" name="Prenume" value="<%=existingUser.getPrenume()%>">
		<input type="hidden" name="Telefon" value="<%=existingUser.getTelefon()%>">
		<input type="hidden" name="Adresa" value="<%=existingUser.getAdresa()%>">
      	<input type="text" placeholder="COD" name="authcode2" class="input" required>
      	<i class="fa fa-user"></i>
      </div>
     <div class="btn">
      <input type="submit" value="Verifica" class="btnverif">
     </div> 
	</form>
	 	
	 <span style="margin-left: 40px;">Nu ai primit niciun cod? 
	 	<form action="ReVerify2" method="post">
			<input type="hidden" name="Id_UserNev" value="<%=existingUser.getId_UserNev()%>">
			<input type="hidden" name="Verificat" value="<%=existingUser.getVerificat()%>">
			<input type="hidden" name="Id_user" value="<%=existingUser.getId()%>">
			<input type="hidden" name="Email" value="<%=existingUser.getEmail()%>">
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