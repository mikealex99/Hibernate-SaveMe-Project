<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.Nevoie"%>
<%@ page import="hibernate.model.User2"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% int id_usernev = Integer.parseInt(request.getParameter("Id_UserNev"));
   Nevoie exNevoie = u.selectUserNevoie(id_usernev);
   User2 existingUser2 = u.selectUserProfil2(id_usernev);%>
								  								  
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
			<li><form action="home.html" method="get">
               	 		<button type="submit" formaction="home.html" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Home</button>               	 		
               	</form>
            </li>
			<li><form action="admin.jsp" method="get">
               	 		<button type="submit" formaction="admin.jsp" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Admin</button>               	 		
               	</form>
            </li>
            <li><form action="CufRedirect" method=post>
               	     	<input type="hidden" class="input" name="Id_UserNev" value="<%=existingUser2.getId_UserNev()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser2.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Cufarul Magic</button>
               	</form>
            </li>
			<li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
            	<ul class="dropdown">
               	 <li><form action="checkFormular" method=post>
               	     	<input type="hidden" class="input" name="Id_UserNev" value="<%=existingUser2.getId_UserNev()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser2.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:13px;" >Formular</button>
               	 	</form>
               	 </li>              	 
               	 <li><form action="editProfil2" method=post>
               	     	<input type="hidden" class="input" placeholder="Id_UserNev" name="Id_UserNev" value="<%=existingUser2.getId_UserNev()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser2.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Editeaza profil</button>
               	 	</form>
               	 </li>
               	 <li><form action="logout.jsp" method="get">
               	 		<button type="submit" formaction="logout.jsp" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Delogare</button>               	 		
               	 	</form>
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