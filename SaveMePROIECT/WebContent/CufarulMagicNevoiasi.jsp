<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.Nevoie"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.dao.HibernateDao"%>  
 <%@ page import="java.util.List"%>
 
<% HibernateDao u= new HibernateDao();%>
<% 
int id_usernev = Integer.parseInt(request.getParameter("Id_UserNev"));
Nevoie exNevoie = u.selectUserNevoie(id_usernev);
%>    

<!-- Listam toate inregistrarile din tabelul 'Cufar' -->
<%List<Cufar> listCufar= u.selectAllCufarNev();%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/CufMagicNevstyle.css">
<title>Cufarul magic</title>
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

<% for(Cufar cufarr:listCufar){ %>
<div class="blog">
<!-- Afisare data -->
	<div class="date"><%=cufarr.getData()%></div>
<!-- Afisare titlu -->	
		<h1><%=cufarr.getTitlu()%></h1>
<!-- Afisare text -->
	<div class="container" style="margin-left: 46px;margin-top:28px;">
		<div class= "vertical"><div class="text">&ensp;<%=cufarr.getText()%></div></div>
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
				<span ><%=cufarr.getTelefon()%></span>
   		</div>
	</div>			
</div>
<%} %>

</body>
</html>