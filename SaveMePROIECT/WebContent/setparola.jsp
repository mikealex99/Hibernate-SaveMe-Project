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
<link rel="stylesheet" type="text/css" href="Css/verifyStyle.css">
<title>Reinitializare parola</title>
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
  <div class="title">Setati noua parola</div>
  <div class="form">
  
  	<form action="setPassword" method="post"> 
      <div class="input_field">
      	<input type="hidden" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
		<input type="hidden" name="Id_user" value="<%=existingUser.getId()%>">
		<input type="hidden" name="Email" value="<%=existingUser.getEmail()%>">
		<input type="hidden" name="Nume" value="<%=existingUser.getNume()%>">
		<input type="hidden" name="Prenume" value="<%=existingUser.getPrenume()%>">
		<input type="hidden" name="Telefon" value="<%=existingUser.getTelefon()%>">
		<input type="hidden" name="Adresa" value="<%=existingUser.getAdresa()%>">
      	<input type="hidden" name="Code" value="<%=existingUser.getCode()%>">
      	
      	<i class="fas fa-lock"></i><input type="password" name="Parola" placeholder="Introduceti noua parola" id="password" class="input" required><br>
        </div>
        <div class="input_field">
        <i class="fas fa-lock"></i><input type="password" placeholder="Confirmati parola" id="confirm_password" class="input" required>
      	
      	<!-- JavaScript pentru a corespunde parolele -->
      	<Script>
      		var password = document.getElementById("password"), confirm_password = document.getElementById("confirm_password");

      		function validatePassword(){
        		if(password.value != confirm_password.value) {
          			confirm_password.setCustomValidity("Parolele nu corespund!");
        			} else {
          			confirm_password.setCustomValidity('');
        			}
      			}

      		password.onchange = validatePassword;
      		confirm_password.onkeyup = validatePassword;
      	</Script>
     
      </div>
     <div class="btn">
      <input type="submit" value="Seteaza" class="btnverif">
     </div> 
	</form>
		 	
  </div>
</div>



</body>
</html>