<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% 
int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
Cufar existingCufar = u.selectCufar(id_cufar);
request.setAttribute("cufar", existingCufar);
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/cufarulMagicStyle.css">
<title>Cufarul magic</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul>
			<li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li>
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
			<li><a href="addGift?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Adauga gift</a></li>		
			<li><a href="nevoiasiServlet?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Nevoiasi</a></li>				
			<li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
            	<ul class="dropdown">
				 <li><a href="CufarulMagic?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit gift</a></li>            	            
               	 <li><a href="editProfil?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit</a></li>
               	 <li><a href="logout.jsp" style="text-decoration:none;color:white;">Logout</a></li>
            	</ul>	         		
			</li>	
		</ul>
	</nav>
</header>

		<!-- Daca nu exista un gift vom adauga unul -->
<%String titlu=existingCufar.getTitlu();

if(titlu == null){ %>
 <jsp:forward page="adaugaGift.jsp"/>
 
 <%} else if(titlu.equals("null")) {%>
 <jsp:forward page="adaugaGift.jsp"/>
 
<%}else if(titlu!=null){ %>

		<!-- Afisarea datelor introduse de utilizator cu optiune de editare-->

<form action="updateCufar2" method="post" >
<div class="blog">

<input type="hidden" class="inputID" name="Id_cufar" value="<%=existingCufar.getIdCufar()%>" />
<input type="hidden" class="inputID" name="Id" value="<%=existingCufar.getId()%>" />
<input type="hidden" class="inputID" name="Data" value="<%=existingCufar.getData()%>" />

<!-- Afisare data -->
	<div class="date"><%=existingCufar.getData()%></div>
<!-- Afisare titlu -->	
	<input type="text" class="inputTitlu" name="Titlu" value="<%=existingCufar.getTitlu()%>" />
<!-- Afisare text -->
			<div class="container" style="margin-left: 46px;margin-top:28px;">
				<div class= "vertical">&nbsp;<input type="text" class="inputText" name="Text" value="<%=existingCufar.getText()%>" /></div>
			</div>
<!-- Container care afiseaza gif si nr de telefon -->			
			<div class="left">
			    <img src="Imagini/ZKZu.gif" style="height: 90px;margin-bottom:30px;">
  			</div>		
				<div class="right">
					<div class="button">
        					<div class="icon">
							<i class="fas fa-phone"></i>
							</div>
							
   					</div><input type="text" class="inputTelefon" name="Telefon" value="<%=existingCufar.getTelefon()%>" />
				</div>		
</div>

<!-- Butoanele salveaza/sterge -->
<div class="actiuni" style="margin-left:650px;">
<input class="btn btn-outline-success" type="submit"  value="Salveaza" style="margin-right:18px " onclick="return confirm('Sunteti sigur ca vreti sa modificati acesti gift?')">
<button type="submit" formaction="deleteCufar2" class="btn btn-outline-danger"  onclick="return confirm('Doriti sa stergeti acest gift?')" >Sterge</button></form>
</div>
<%} %>

</body>
</html>