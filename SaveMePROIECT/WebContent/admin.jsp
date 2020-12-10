<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		<ul><li><a href="admin.jsp">Admin</a></li></ul>
		<ul><li><a href="home.html">Home</a></li></ul>
	</nav>
</header>

<form action="<%=request.getContextPath()%>/logareadmin" method="post">
<div class="wrapper">
  <div class="title">Admin</div>
  <div class="form">
      <div class="input_field">
      	<input type="text" placeholder="Utilizator" name="Utilizator" class="input" required>
      	<i class="fa fa-user"></i>
      </div>
       <div class="input_field">
      	<input type="password" placeholder="Parola" name="Parola" class="input" required>
      	<i class="fas fa-lock"></i>
      </div>
     <div class="btn">
      <input type="submit" value="Logheaza-te" class="btninreg">
     </div>  
  </div>
</div>      
</form>
</body>
</html>