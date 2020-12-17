<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/logheazastyle.css">
<title>Logheaza-te</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:15px;margin-left:15px;">
		<ul><li><a href="admin.jsp">Admin</a></li></ul>
		<ul><li><a href="home.html">Home</a></li></ul>
	</nav>
</header>

<form action="<%=request.getContextPath()%>/logare" method="post">
<div class="wrapper">
  <div class="title">Introduceti datele de logare</div>
  <div class="form">
      <div class="input_field">
      	<input type="email" placeholder="Email" name="Email" class="input" required>
      	<i class="far fa-envelope"></i>
      </div>
       <div class="input_field">
      	<input type="password" placeholder="Parola" name="Parola" class="input" required>
      	<i class="fas fa-lock"></i>
      </div>
   	  <div class="btn">
      <input type="submit" value="Logheaza-te" class="btninreg">
      </div>    
      <div class="logare">Nu ai cont?<a href="home.html" style="text-decoration: none;color:#308f84;"> Inregistreaza-te!</a></div>    
  </div>
 </div>      
</form>

</body>
</html>