<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="hibernate.model.User"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.model.Nevoie"%>
<%@ page import="hibernate.dao.HibernateDao"%>
<%@ page import="java.util.List"%>

<%HibernateDao u= new HibernateDao();%>

<%List<User> listUser = u.selectAllUsers();
request.setAttribute("listUsers", listUser);%>

<% List<Nevoie> listNevoie = u.selectAllNevoie();
request.setAttribute("listUsers", listNevoie);

String Email=request.getParameter("Email");
User existingUser=u.selectProfil(Email);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Css/nevoiasistyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<meta charset="ISO-8859-1">
<title>Nevoiasi</title>
</head>
<body>

<%
if(Email==null){
%>

<%
int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
Cufar existingCufar = u.selectCufar(id_cufar);
%>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul>
			<li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li>
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
			<li><a href="nevoiasiServlet?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Nevoiasi</a></li>				
			<li><a href="addGift?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Adauga gift</a></li>		
			<li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
            	<ul class="dropdown">
				 <li><a href="CufarulMagic?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit gift</a></li>            	 
               	 <li><a href="editProfil?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit profil</a></li>
               	 <li><a href="logout.jsp" style="text-decoration:none;color:white;">Logout</a></li>
            	</ul>	         		
			</li>	
		</ul>
	</nav>
</header>

<%for (Nevoie nevoie:listNevoie) {   %>
<div class="Center-Container">
<div class="adresa">
	<div class="buttonAdresa" >
        <div class="icon">
			<i class="fas fa-home"></i>
		</div>
		<span><%=nevoie.getAdresa2()%></span>
    </div>
</div>
<div class="card" style="margin-bottom:82px;">
		<div class="thumbnail">
			<img src="Imagini\save_me.jpg">
		</div>
	
	<!-- Display 'Nume si Prenume' -->
	
	<div class="right">
	<h4><%=nevoie.getNume()%>&nbsp;<%=nevoie.getPrenume()%> </h4><div class="verif" style="margin-left: 5px;margin-bottom:3px;"><i class="fas fa-check-circle" style="color:#00BFFF;"></i><span class="txt"> Utilizator verificat</span></div>  
		   <p ><%=nevoie.getDescriere()%></p>  
	</div>
	
	<!-- Display 'Ziua,Luna,Anul' -->
	
	<h5 class="ziua"><%=nevoie.getZiua()%></h5>
	<h6 class="luna"><%=nevoie.getLuna()%></h6>
	<h5 class="rotate"><%=nevoie.getAnul()%></h5>
	
	<!-- Display 'Mancare', 'Bani', 'Haine' -->
	
	<ul style="margin-top:270px;margin-bottom:32px;">
		<li><i class="fa fa-shopping-cart fa-2x"></i> <%=nevoie.getMancare()%></li>
		<li><i class="fas fa-dollar-sign fa-2x"></i> <%=nevoie.getBani()%></li>
		<li><i class="fas fa-tshirt fa-2x"></i> <%=nevoie.getHaine()%></li>
	</ul>
	
	<!-- Display 'Butoanele de contact' -->
	
	<div class="wrapper" >
	
		<div class="button">
        	<div class="icon">
				<i class="fas fa-map-marker-alt"></i>
			</div>
			<span><%=nevoie.getAdresa()%></span>
    	</div>
    
		<div class="button">
        	<div class="icon">
				<i class="fas fa-shipping-fast"></i>
			</div>
			<span><%=nevoie.getCodPostal()%></span>
    	</div>
    
		<div class="button">
        	<div class="icon">
				<i class="fas fa-phone"></i>
			</div>
			<span><%=nevoie.getTelefon()%></span>
    	</div>
     
	</div>

</div>
<%} %> 

<!-- Daca emailul != null putem accesa 'nevoiasii' de pe celelalte pagini atunci cand navigam -->

<%} else if(Email!=null) {%>

<header>
	<nav>
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

<%for (Nevoie nevoie:listNevoie) {   %>
<div class="Center-Container">

<div class="adresa">
	<div class="buttonAdresa" >
        <div class="icon">
			<i class="fas fa-home"></i>
		</div>
		<span><%=nevoie.getAdresa2()%></span>
    </div>
</div>
<div class="card" style="margin-bottom:82px;">
	
	<div class="thumbnail">
			<img src="Imagini\save_me.jpg">
	</div>
	
	<!-- Display 'Nume si Prenume' -->
	
	<div class="right">
	<h4><%=nevoie.getNume()%>&nbsp;<%=nevoie.getPrenume()%></h4> <div class="verif" style="margin-left: 5px;margin-bottom:3px;"><i class="fas fa-check-circle" style="color:#00BFFF;"></i><span class="txt"> Utilizator verificat</span></div> 
		   <p ><%=nevoie.getDescriere()%></p>  
	</div>
	
	<!-- Display 'Ziua,Luna,Anul' -->
	
	<h5 class="ziua"><%=nevoie.getZiua()%></h5>
	<h6 class="luna"><%=nevoie.getLuna()%></h6>
	<h5 class="rotate"><%=nevoie.getAnul()%></h5>
	
	<!-- Display 'Mancare', 'Bani', 'Haine' -->
	
	<ul style="margin-top:270px;margin-bottom:32px;">
		<li><i class="fa fa-shopping-cart fa-2x"></i> <%=nevoie.getMancare()%></li>
		<li><i class="fas fa-dollar-sign fa-2x"></i> <%=nevoie.getBani()%></li>
		<li><i class="fas fa-tshirt fa-2x"></i> <%=nevoie.getHaine()%></li>
	</ul>
	
	<!-- Display 'Butoanele de contact' -->
	
	<div class="wrapper" >
	
		<div class="button">
        	<div class="icon">
				<i class="fas fa-map-marker-alt"></i>
			</div>
			<span><%=nevoie.getAdresa()%></span>
    	</div>
    
		<div class="button">
        	<div class="icon">
				<i class="fas fa-shipping-fast"></i>
			</div>
			<span><%=nevoie.getCodPostal()%></span>
    	</div>
    
		<div class="button">
        	<div class="icon">
				<i class="fas fa-phone"></i>
			</div>
			<span><%=nevoie.getTelefon()%></span>
    	</div>
    
	</div>
</div>
</div>
<%}} %>

</body>
</html>
