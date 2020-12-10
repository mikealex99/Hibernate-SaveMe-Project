<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.User"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
   User existingUser = u.selectUserProfil(id_cufar);%>
								  								  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/editProfil.css">
<title>EditeazaProfil</title>
</head>
<body>

<header>
	<nav style="position: relative;">
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul>
			<li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li>
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
			<li><a href="nevoiasiServlet?Id_cufar=<%=existingUser.getIdCufar()%>" style="text-decoration:none;color:white;">Nevoiasi</a></li>
			<li><a href="addGift?Id_cufar=<%=existingUser.getIdCufar()%>" style="text-decoration:none;color:white;">Adauga gift</a></li>		
			<li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
            	<ul class="dropdown">
            	 <li><a href="CufarulMagic?Id_cufar=<%=existingUser.getIdCufar()%>" style="text-decoration:none;color:white;">Edit gift</a></li>          
               	 <li><a href="editProfil?Id_cufar=<%=existingUser.getIdCufar()%>" style="text-decoration:none;color:white;">Edit profil</a></li>
               	 <li><a href="logout.jsp" style="text-decoration:none;color:white;">Logout</a></li>
            	</ul>	         		
			</li>	
		</ul>
	</nav>
</header>

<form action="updateProfilServlet" method="post">								
<div class="wrapper">
  <div class="title">Editati informatiile dvs.</div>
  <div class="form">

   	  <input type="hidden" name="Id_cufar" value="<%=existingUser.getIdCufar()%>" />
      <input type="hidden" name="Id_user" value="<%=existingUser.getId()%>" />
				<fieldset class="form-group">
					<label>Parola</label>
					<input type="text" value="<%= existingUser.getParola()%>" class="form-control" name="Parola" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Email</label> <input type="email" value="<%=existingUser.getEmail()%>" class="form-control" name="Email" >
				</fieldset>

				<fieldset class="form-group">
					<label>Nume</label> <input type="text" value="<%=existingUser.getNume()%>" class="form-control" name="Nume" >
				</fieldset>

				<fieldset class="form-group">
					<label>Prenume</label> <input type="text" value="<%=existingUser.getPrenume()%>" class="form-control" name="Prenume" >
				</fieldset>
				
				<fieldset class="form-group">
					<label>Adresa</label> <input type="text" value="<%=existingUser.getAdresa()%>" class="form-control" name="Adresa" >
				</fieldset>
				
				<fieldset class="form-group">
					<label>Telefon</label> <input type="text" value="<%=existingUser.getTelefon()%>" class="form-control" name="Telefon" >
				</fieldset>	
											
				<button type="submit" class="btn btn-success" onclick="return confirm('Doriti sa modificati informatiile?')">Salveaza</button>
        	    <button type="submit" formaction="deleteUserpage" class="btn btn-danger" style="margin-left:140px;" onclick="return confirm('Esti sigur ca doresti sa stergi acest cont?')">Sterge contul</button>    
  
  </div>
 </div>    
</form>

</body>
</html>