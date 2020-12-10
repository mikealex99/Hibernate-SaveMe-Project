<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
  Cufar existingCufar = u.selectCufar(id_cufar);
  request.setAttribute("cufar", existingCufar);
  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/chkstyle.css">
<title>GiftValidare</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul>
			<li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li>
			<li><a href="addGift?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Adauga gift</a></li>		
			<li><a href="#" style="text-decoration:none;color:white;">Nevoiasi</a></li>				
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
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

<div class="wrapper">
  <div class="title">
    <h3>Ai adaugat cu succes un gift!</h3>
  </div>
  <div class="btn">
  	<div class="btnnev">
    	<A HREF="CufarulMagic?Id_cufar=<%=existingCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Vezi gift-ul tau</A>
    </div>
  </div> 
</div>

</body>
</html>