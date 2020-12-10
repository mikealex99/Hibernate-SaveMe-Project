<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.User"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% 
int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
User existingCufar = u.selectUser(id_cufar);
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

<% 
Cufar exCufar=u.selectCufar(id_cufar);
String titlu=exCufar.getTitlu();

if(titlu == null){
%>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul>
			<li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li>
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
			<li><a href="addGift?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Adauga gift</a></li>		
			<li><a href="nevoiasiServlet?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Nevoiasi</a></li>				
			<li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
            	<ul class="dropdown">  
				 <li><a href="CufarulMagic?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit gift</a></li>            	            
               	 <li><a href="editProfil?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit</a></li>
               	 <li><a href="logout.jsp" style="text-decoration:none;color:white;">Logout</a></li>
            	</ul>	         		
			</li>	
		</ul>
	</nav>
</header>

<h1 style="text-align:center;color:red;margin-top:37px;border: 0px solid black;  text-shadow: 1px 1px #fff;"><i class="fa fa-exclamation" aria-hidden="true"> </i> Poti adauga maxim un gift <i class="fa fa-exclamation" aria-hidden="true"></i></h1>
<form action="<%=request.getContextPath()%>/insertGift?Id_cufar=<%=exCufar.getIdCufar()%>" method="post">
<div class="wrapper">
  <div class="title">Vreau sa ajut!</div>
  <div class="form">
  <input type="hidden" name="Id" value="<%=exCufar.getId()%>" />
  <input type="hidden" name="Id_cufar" value="<%=exCufar.getIdCufar()%>" />
  
				<fieldset class="form-group">
					<label>Titlul</label>
					<input type="text" placeholder="Titlu" class="form-control" name="Titlu" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Descriere</label> <input type="text" placeholder="Descriere" class="form-control" name="Text" required="required">
				</fieldset>

				<fieldset  class="form-group">
					<label>Telefon</label> <input type="text" placeholder="073333333xxx" class="form-control" name="Telefon" required="required">
				</fieldset>			
	
				<input type="hidden" value="" class="form-control" name="Data" id="example-date-input" required="required">
				
				<button type="submit" class="btn btn-success" style="margin-left:120px;" >Adauga</button>				
   </div>
</div>
</form>	

<%} else if(titlu.equals("null")) {%>	

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul>
			<li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li>
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
			<li><a href="addGift?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Adauga gift</a></li>		
			<li><a href="nevoiasiServlet?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Nevoiasi</a></li>				
			<li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
            	<ul class="dropdown">
				 <li><a href="CufarulMagic?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit gift</a></li>            	            
               	 <li><a href="editProfil?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit</a></li>
               	 <li><a href="logout.jsp" style="text-decoration:none;color:white;">Logout</a></li>
            	</ul>	         		
			</li>	
		</ul>
	</nav>
</header>

<h1 style="text-align:center;color:red;margin-top:37px;border: 0px solid black;  text-shadow: 1px 1px #fff;"><i class="fa fa-exclamation" aria-hidden="true"> </i> Poti adauga maxim un gift <i class="fa fa-exclamation" aria-hidden="true"></i></h1>
<form action="<%=request.getContextPath()%>/insertGift?Id_cufar=<%=exCufar.getIdCufar()%>" method="post">
<div class="wrapper">
  <div class="title">Vreau sa ajut!</div>
  <div class="form">
  <input type="hidden" name="Id" value="<%=exCufar.getId()%>" />
  <input type="hidden" name="Id_cufar" value="<%=exCufar.getIdCufar()%>" />
  
				<fieldset class="form-group">
					<label>Titlul</label>
					<input type="text" value="Titlu" class="form-control" name="Titlu" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Descriere</label> <input type="text" value="Descriere" class="form-control" name="Text" required="required">
				</fieldset>

				<fieldset  class="form-group">
					<label>Telefon</label> <input type="text" value="073333333xxx" class="form-control" name="Telefon" required="required">
				</fieldset>			
	
				<input type="hidden" value="" class="form-control" name="Data" id="example-date-input" required="required">
				
				<button type="submit" class="btn btn-success" style="margin-left:120px;">Adauga</button>				
   </div>
</div>
</form>	
		
<%} else if(titlu !=null){ %>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200" height="50" style="margin-top:1px;margin-left:15px;">
		<ul>
			<li><a href="home.html" style="text-decoration:none;color:white;">Home</a></li>
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
			<li><a href="addGift?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Adauga gift</a></li>		
			<li><a href="nevoiasiServlet?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Nevoiasi</a></li>				
			<li><a href="#" style="text-decoration:none;color:white;">Profilul meu</a>			
            	<ul class="dropdown">
				 <li><a href="CufarulMagic?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit gift</a></li>            	            
               	 <li><a href="editProfil?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Edit</a></li>
               	 <li><a href="logout.jsp" style="text-decoration:none;color:white;">Logout</a></li>
            	</ul>	         		
			</li>	
		</ul>
	</nav>
</header>

<div class="wrapper">
  <div class="title">
    <h3>Ai adaugat deja un gift!</h3><br><h4 style="text-align:center;color:red;border: 0px solid black;  text-shadow: 1px 1px #fff;"><i class="fa fa-exclamation" aria-hidden="true"> </i> Poti adauga maxim un gift<i class="fa fa-exclamation" aria-hidden="true"> </i></h4>
  </div>
  <div class="btn">
  	<div class="btnnev">
    	<A HREF="CufarulMagic?Id_cufar=<%=exCufar.getIdCufar()%>" style="text-decoration:none;color:white;">Vezi gift-ul tau</A>
    </div>
  </div>  
</div>

<%}%>

</body>
</html>