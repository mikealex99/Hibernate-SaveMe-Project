<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="hibernate.model.Nevoie"%>
<%@ page import="hibernate.model.Admin"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<%HibernateDao u= new HibernateDao();%>

<% String Utilizator=request.getParameter("Utilizator");
Admin existingAdmin = u.selectProfilAdmin(Utilizator); %>

<%List<Nevoie> listNevoie = u.selectAllNevoieUsers();
request.setAttribute("listNevoi", listNevoie);%>

<!DOCTYPE html>
<html>
<head>
<title>AdminInterfata</title>
<link rel="stylesheet" type="text/css" href="Css/adminInterfaceNevoistyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<meta charset="ISO-8859-1">
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul><li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li></ul>
		<ul><li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li></ul>
	</nav>
</header>

<h1 style="color:rgba(0,0,0,0.6);position:relative;text-align:center;padding-top:30px;text-shadow: -2px 0px 11px rgba(61, 57, 78, 1);">Nevoiasi</h1>
<form action="adminInterfaceServlet" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit" class="btn btn-success" style="border:none;margin-left: 217px;" >Inapoi</button>
</form>

<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn" style="margin-left: 150px;">Status: </button>
  <div id="myDropdown" class="dropdown-content">
  <input type="text" placeholder="Cauta..." id="myInput" onkeyup="filterFunction()">
    <form action="adminNevValid" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit"  style="background: none;border:none;margin-left:30px;" >Valid</button>
	</form>   
    <form action="adminNevLoading" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit"  style="background: none;border:none;margin-left:30px;" >Loading</button>
	</form>	
	<form action="adminNevNevalid" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit"  style="background: none;border:none;margin-left:30px;" >Nevalid</button>
	</form>
	<form action="UsersNevoieServlet" method=post>
               	     	<input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 		<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
               	 		<button type="submit"  style="background: none;border:none;margin-left:30px;" >Totul</button>
	</form>
  </div>
</div>

<script>
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

function filterFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdown");
  a = div.getElementsByTagName("a");
  for (i = 0; i < a.length; i++) {
    txtValue = a[i].textContent || a[i].innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      a[i].style.display = "";
    } else {
      a[i].style.display = "none";
    }
  }
}
</script>

<div class="container">
<%for (Nevoie nev: listNevoie) {   %>

<!-- Display nevoiasi si dupa ce stergem/modificam userul -->
<%String test=nev.getNume();
if(test != null && !test.equals("null")){%>

	<div class="card">
		<div class="box">
			<div class="content">
				<form action="updateNevoie" method="post">
				    <input type="hidden" class="input" name="ID" value="<%=existingAdmin.getId()%>">
               	 	<input type="hidden" class="input"  name="Utilizator" value="<%=existingAdmin.getUtilizator()%>">
				
				
					<input type="hidden" class="form-control" name="Document" value="<%=nev.getDocument()%>">
					<input type="hidden" name="Id_UserNev" value="<%=nev.getId_UserNev()%>" />
					<input type="hidden" name="Ziua" value="<%=nev.getZiua()%>" />
					<input type="hidden" name="Luna" value="<%=nev.getLuna()%>" />
					<input type="hidden" name="Anul" value="<%=nev.getAnul()%>" />
					<input type="text" class="inputID" name="Id" placeholder="<%=nev.getId()%>" value="<%=nev.getId()%>" /><br><br><br><br>
					<input type="text" class="inputNume" name="Nume" value="<%=nev.getNume()%>" />
					<input type="text" class="inputNume" name="Prenume" value="<%=nev.getPrenume()%>" /><br><br>
					<i class="fa fa-map-marker" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Adresa" value="<%=nev.getAdresa()%>" /><br>
					<i class="fa fa-map-marker" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<input type="text" class="inputInfo" name="Adresa2" value="<%=nev.getAdresa2()%>" /><br>
					<i class="fas fa-shipping-fast" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="CodPostal" value="<%=nev.getCodPostal()%>" /><br>
					<i class="fas fa-dollar-sign fa" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<label style="color:rgba(255,255,255,0.8); font-size:20px;"> Bani </label>&nbsp;
					<select name="Bani" class="inputInfo" style="color: black;" >
 	
 						<% if(nev.getBani().equals("da")) {%>
 		 					<option value="<%=nev.getBani()%>" style="color: black;"><%=nev.getBani()%></option>
  		 					<option value="nu" style="color: black;">Nu</option>
  		 				<%} else if(nev.getBani().equals("nu")) {%>
  		 					<option value="<%=nev.getBani()%>" style="color: black;"><%=nev.getBani()%></option>
  		 					<option value="da" style="color: black;">Da</option>
  		 				<%}%>
  		 
					</select><br>
					<i class="fa fa-shopping-cart fa" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<label style="color:rgba(255,255,255,0.8);font-size:20px; "> Alimente </label>&nbsp;
					<select name="Mancare" class="inputInfo" style="color: black;">

 						<% if(nev.getMancare().equals("da")) {%>
 		 					<option value="<%=nev.getMancare()%>" style="color: black;"><%=nev.getMancare()%></option>
  		 					<option value="nu" style="color: black;">Nu</option>
  		 				<%} else if(nev.getMancare().equals("nu")) {%>
  		 					<option value="<%=nev.getMancare()%>" style="color: black;"><%=nev.getMancare()%></option>
  		 					<option value="da" style="color: black;">Da</option>
  		 				<%}%>

					</select><br>	  
					<i class="fas fa-tshirt fa" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<label style="color:rgba(255,255,255,0.8);font-size:20px; "> Haine </label>&nbsp;
					<select name="Haine" class="inputInfo" style="color: black;">

 						<% if(nev.getHaine().equals("da")) {%>
 		 					<option value="<%=nev.getHaine()%>" style="color: black;"><%=nev.getHaine()%></option>
  		 					<option value="nu" style="color: black;">Nu</option>
  		 				<%} else if(nev.getHaine().equals("nu")) {%>
  		 					<option value="<%=nev.getHaine()%>" style="color: black;"><%=nev.getHaine()%></option>
  		 					<option value="da" style="color: black;">Da</option>
  		 				<%}%>

					</select><br>
					<i class="fas fa-comments" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<input type="text" class="inputInfo" name="Descriere" value="<%=nev.getDescriere()%>" /><br>
					<i class="fa fa-phone" style="color: rgba(255,255,255,0.8);"></i><input type="text" class="inputInfo" name="Telefon" value="<%=nev.getTelefon()%>" /><br>
					<i class="fa fa-image" style="color: rgba(255,255,255,0.8);"></i><a href="Imagini\<%=nev.getDocument()%>" style="text-decoration:none;color:rgba(255,255,255,0.8);font-weight: bold;top:-1px;">Click aici</a><br>
					<i class="fa fa-spinner" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<label style="color:rgba(255,255,255,0.8);font-size:20px; "><%=nev.getStatus()%></label>&nbsp;<label style="color:rgba(255,255,255,0.8);font-size:20px; border-left: 3px solid black; ">&nbsp;Modifica:</label>&nbsp;
					<select name="Status" class="inputInfo" style="color: black;">
 		 				<option value="valid" style="color: black;">valid</option>
  		 				<option value="loading" style="color: black;">loading</option>
  		 				<option value="nevalid" style="color: black;">nevalid</option>
					</select><br>
					<i class="fas fa-comments" style="color: rgba(255,255,255,0.8);"></i>&nbsp;<input type="text" class="inputInfo" name="MesajAdmin" placeholder="Mesaj de la admin..."><br>
					<button type="submit" class="btn btn-primary" style="display:inline-block;
						padding: 8px 20px;
						text-decoration:none;position:relative;
						font-weight:400;
						top:37px;
						margin-right:110px;
					">Salveaza</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" formaction="deleteNevoie" class="btn btn-danger"  style="	
						margin-bottom:64px;	
						margin-left:100px;" 
						onclick="return confirm('Sunteti sigur ca doriti sa stergeti acest nevoias?')" >Sterge</button>
			</form>
		</div>
	</div>
</div>

<%}}%>
</div>

</body>
</html>
