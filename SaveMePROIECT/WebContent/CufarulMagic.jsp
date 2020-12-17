<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.model.User"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% 
int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
User existingUser = u.selectUserProfil(id_cufar);
Cufar existingCufar = u.selectCufar(id_cufar);
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
			<li><form action="home.html" method="get">
               	 		<button type="submit" formaction="home.html" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Home</button>               	 		
               	</form>
            </li>
			<li><form action="admin.jsp" method="get">
               	 		<button type="submit" formaction="admin.jsp" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Admin</button>               	 		
               	</form>
            </li>			
			<li><form action="nevoiasiServlet" method=post>
               	     	<input type="hidden" class="input" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Nevoiasi</button>
               	</form>
            </li>
            <li><form action="addGift" method=post>
               	     	<input type="hidden" class="input" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Adauga gift</button>
               	</form>
            </li>		
		  <li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
          <ul class="dropdown">
			<li><form action="CufarulMagic" method=post>
               	     	<input type="hidden" class="input" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Edit gift</button>
               	</form>
            </li>
            <li><form action="editProfil" method=post>
               	     	<input type="hidden" class="input" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Edit profil</button>
               	</form>
            </li>					 
            <li><form action="logout.jsp" method="get">
               	 		<button type="submit" formaction="logout.jsp" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Delogare</button>               	 		
               	</form>
           </li>
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