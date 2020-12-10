<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.Nevoie"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% int id_usernev = Integer.parseInt(request.getParameter("Id_UserNev"));
   Nevoie exNevoie = u.selectUserNevoie(id_usernev);%>
								  								  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/editNevoie.css">
<title>Editeaza formular</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul>
			<li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li>
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
			<li><a href="CufRedirect?Id_UserNev=<%=exNevoie.getId_UserNev()%>" style="text-decoration:none;color:white;">Cufarul magic</a></li>
			<li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
            	<ul class="dropdown">
            	 <li><a href="checkFormular?Id_UserNev=<%=exNevoie.getId_UserNev()%>" style="text-decoration:none;color:white;">Formular</a></li>          
               	 <li><a href="editProfil2?Id_UserNev=<%=exNevoie.getId_UserNev()%>" style="text-decoration:none;color:white;">Editeaza profil</a></li>
               	 <li><a href="logout.jsp" style="text-decoration:none;color:white;">Delogheaza-te</a></li>
            	</ul>	         		
			</li>	
		</ul>
	</nav>
</header>

<form action="updNevoie" method="post">								
<div class="wrapper" style="top:65%;">
  <div class="title">Editati informatiile dvs.</div>
  <div class="form">
				<input type="hidden" name="Id" value="<%=exNevoie.getId()%>" />
				<input type="hidden" name="Anul" value="<%=exNevoie.getAnul()%>" />
				<input type="hidden" name="Ziua" value="<%=exNevoie.getZiua()%>" />
				<input type="hidden" name="Luna" value="<%=exNevoie.getLuna()%>" />				
				<input type="hidden" name="Document" value="<%=exNevoie.getDocument()%>" />
				<input type="hidden" class="input" name="Status" value="loading">
				<input type="hidden" value="<%= exNevoie.getId_UserNev()%>" class="form-control" name="Id_UserNev" >
				
				<fieldset class="form-group">
					<label>Nume</label> <input type="text" value="<%=exNevoie.getNume()%>" class="form-control" name="Nume" >
				</fieldset>
				
				<fieldset class="form-group">
					<label>Prenume</label> <input type="text" value="<%=exNevoie.getPrenume()%>" class="form-control" name="Prenume" >
				</fieldset>
				
				<fieldset class="form-group">
					<label>Oras</label> <input type="text" value="<%=exNevoie.getAdresa()%>" class="form-control" name="Adresa" >
				</fieldset>

				<fieldset class="form-group">
					<label>Adresa</label> <input type="text" value="<%=exNevoie.getAdresa2()%>" class="form-control" name="Adresa2" >
				</fieldset>
				
				<fieldset class="form-group">
					<label>CodPostal</label> <input type="text" value="<%=exNevoie.getCodPostal()%>" class="form-control" name="CodPostal" >
				</fieldset>
				
				<fieldset class="form-group">
					<label>Telefon</label> <input type="text" value="<%=exNevoie.getTelefon()%>" class="form-control" name="Telefon" >
				</fieldset>	
				
				<fieldset class="form-group">
					<label >Bani <select name="Bani" >
 		 					<option value="da">Da</option>
  							<option value="nu">Nu</option>
	  				</select></label>
				</fieldset>
				
				<fieldset class="form-group">
					<label >Haine <select name="Haine" >
 		 					<option value="da">Da</option>
  							<option value="nu">Nu</option>
	  				</select></label>
				</fieldset>				

				<fieldset class="form-group">
					<label>Alimente <select name="Mancare" >
 		 					<option value="da">Da</option>
  							<option value="nu">Nu</option>
	  				</select></label>
				</fieldset>
    
				<fieldset class="form-group">
					<label>Descriere</label> <input type="text" value="<%=exNevoie.getDescriere()%>" class="form-control" name="Descriere" >
				</fieldset>
    
    <button type="submit" class="btn btn-success" onclick="return confirm('Doriti sa modificati informatiile?')">Salveaza</button>
    <button type="submit" formaction="deleteNevoiepage" class="btn btn-danger" style="margin-left:132px;" onclick="return confirm('Esti sigur ca doresti sa stergi acest nevoias?')">Sterge nevoias</button>
    
  </div>
 </div>    
</form>

</body>
</html>