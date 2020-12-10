<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Css/inregajutstyle.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<title>Inregistrare</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:15px;margin-left:15px;">
		<ul><li><a href="admin.jsp">Admin</a></li></ul>
		<ul><li><a href="home.html">Home</a></li></ul>
	</nav>
</header>

<form action="<%=request.getContextPath()%>/inregnevoi" method="post">
<div class="wrapper">
  <div class="title">Introduceti datele dvs.</div>
  <div class="form">
      <div class="input_field">
      	<input type="hidden" placeholder="Id" maxlength = "7" name="Id_UserNev" class="input" required="required">
      	<i class="fas fa-user"></i>
      </div>
      <div class="input_field">
      	<input type="email" placeholder="Email" name="Email" class="input" required="required">
      	<i class="far fa-envelope"></i>
      </div>
       <div class="input_field">
      	<input type="password" placeholder="Parola" name="Parola" class="input" required="required">
      	<i class="fas fa-lock"></i>
      </div>      
      <div class="input_field">
      	<input type="text" placeholder="Nume" name="Nume" class="input" required="required">
      	<i class="fas fa-user"></i>
      </div>
      <div class="input_field">
     	<input type="text" placeholder="Prenume" name="Prenume" class="input" required="required">
      	<i class="fas fa-user"></i>
      </div>
      <div class="input_field">
     	<input type="text" placeholder="Oras" name="Adresa" class="input" required="required">
      	<i class="fa fa-map-marker"></i>
      </div>      
      <div class="input_field">
     	<input type="text" placeholder="Telefon" name="Telefon" class="input" required="required">
      	<i class="fa fa-phone"></i>
      </div>  
      <div class="btn">
      <input type="submit" value="Inregistreaza-te" class="btninreg">
      </div>
      <div class="logare">Ai deja un cont?<a href="logarenevoi.jsp"> Logheaza-te!</a></div> 
  </div>
</div>
</form>

</body>
</html>