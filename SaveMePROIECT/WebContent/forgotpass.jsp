<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/adminstyle.css">
<title>Reintializare parola</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:15px;margin-left:15px;">
		<ul><li><a href="admin.jsp">Admin</a></li></ul>
		<ul><li><a href="home.html">Home</a></li></ul>
	</nav>
</header>

<form action="forgotPass" method="post">
<div class="wrapper">
  <div class="title">Introduceti adresa dvs de email</div>
  <div class="form">
      <div class="input_field">
      	<input type="text" placeholder="Email" name="Email" class="input" required>
      	<i class="fa fa-user"></i>
      </div>
     <div class="btn">
      <input type="submit" value="Trimite" class="btninreg">
     </div> 
  </div>
</div>      
</form>
</body>
</html>