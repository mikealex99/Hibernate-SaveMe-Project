<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.Nevoie"%>
<%@ page import="hibernate.model.User2"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% int id_usernev = Integer.parseInt(request.getParameter("Id_UserNev"));
  Nevoie exNevoie = u.selectUserNevoie(id_usernev);
  User2 exUser=u.selectUserProfil2(id_usernev);
  request.setAttribute("nevoie", exNevoie);
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="Css/nevoieformstyle.css">
<title>Formular</title>
</head>
<body>

<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200px" height="50px" style="margin-top:15px;margin-left:15px;">
		<ul><li><a href="home.html">Home</a></li>
			<li><a href="admin.jsp">Admin</a></li>
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

<%String Status=exNevoie.getStatus();
if(Status == null){%>

<form action="<%=request.getContextPath()%>/nevoieform" method="post" enctype="multipart/form-data">
	<div class="wrapper" style="margin-top:105px;max-width: 600px;margin-bottom:15px;">
		<div class="title"><h1>Bine ati venit, <%=exUser.getNume()%> <%=exUser.getPrenume()%></h1></div>
  		<div class="contact-form">
    		<div class="input-fields">	
    		<input type="hidden" class="input" placeholder="Status" name="Status" value="loading">
    		<input type="hidden" class="input" placeholder="Ziua" name="Ziua" value="">
    		<input type="hidden" class="input" placeholder="Luna" name="Luna" value="">
    		<input type="hidden" class="input" placeholder="Anul" name="Anul" value="">
    		<input type="hidden" class="input" placeholder="Id" name="Id" value="<%=exNevoie.getId()%>" />
    		<input type="hidden" class="input" placeholder="Id_UserNev" name="Id_UserNev" value="<%=exNevoie.getId_UserNev()%>">
    		<input type="text" class="input" placeholder="Nume" name="Nume">
    		<input type="text" class="input" placeholder="Prenume" name="Prenume">
    		<label for="Bani" class="input" style="font-size: 14px;">Bani &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      			<select name="Bani" id="bani" >
 		 			<option value="da">Da</option>
  		 			<option value="nu">Nu</option>
	  			</select></label>
    		<label for="Haine" class="input" style="font-size: 14px;">Haine &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      			<select name="Haine" id="haine" >
 		 			<option value="da">Da</option>
  		 			<option value="nu">Nu</option>
	  			</select></label>
    		<label for="Mancare" class="input" style="font-size: 14px;">Alimente &nbsp;
      			<select name="Mancare" id="mancare" >
 		 			<option value="da">Da</option>
  		 			<option value="nu">Nu</option>
	  			</select>  </label> 
			<label for="Descriere" style="font-size: 15px;color:#c5ecfd;margin-left:10px;margin-top:5px;">Descriere</label>
    		<textarea id="descriere" name="Descriere" rows="3" cols="40" ></textarea> 	
    		</div>
    
    		<div class="msg" style="margin-top: 25px;">
				<input type="text" class="input" placeholder="Oras" name="Adresa"> 
	  			<input type="text" class="input" placeholder="Adresa" name="Adresa2">
	  			<input type="text" class="input" placeholder="Cod Postal" name="CodPostal">
	  			<input type="text" class="input" placeholder="Telefon" name="Telefon">	<br><br><br><br>
      			<label for="text" style="font-size: 14px;color: white;margin-left:45px;">*Upload document oficial*</label>
     			<label for="text" style="font-size: 14px;color: white;margin-left:45px;font-style:italic;">&nbsp;&nbsp;&nbsp;&nbsp;Ex:CI,pasaport,permis</label>
      			<div class="input_field">
      				<input type="file" placeholder="Imagine" name="Document" id="file">
      				<label for="file">&nbsp;&nbsp;&nbsp;<i class="fas fa-id-badge ">&nbsp; Incarca document</i></label> 	
      			</div>
      		<div class="btn"> <input type="submit" value="Cere ajutor" class="btnnev" style="margin-left: 10px;" onclick="return confirm('Sunteti sigur ca datele introduse sunt corecte?')"></div>      
   			</div>
 		 </div>
	</div>
</form>

<!-- Daca statusul este valid : -->
<%} else if(Status.equals("valid")){%>

<div class="flip-card-container" style="--hue: 220;margin-left:40%;margin-top:2%;">
  <div class="flip-card">

    <div class="card-front">
      <figure>
        <div class="img-bg"></div>
        <img src="https://images.unsplash.com/photo-1486162928267-e6274cb3106f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="Brohm Lake">
        <figcaption><%=exNevoie.getNume()%> <%=exNevoie.getPrenume()%></figcaption>
      </figure>

    <ul class="carduser">
        <li><i class="fas fa-tshirt fa"></i> <%=exNevoie.getHaine()%></li>
        <li><i class="fa fa-shopping-cart fa"></i> <%=exNevoie.getMancare()%></li>
        <li><i class="fas fa-dollar-sign fa"></i> <%=exNevoie.getBani()%></li>
        <li><i class="fas fa-map-marker-alt"></i> <%=exNevoie.getAdresa()%></li>
        <li><i class="fas fa-home"></i> <%=exNevoie.getAdresa2()%></li>
        <li><i class="fas fa-shipping-fast"></i> <%=exNevoie.getCodPostal() %></li>
        <li><i class="fas fa-comments"></i> <%=exNevoie.getDescriere()%> <i class="fas fa-comments"></i></li>
        <li><i class="fas fa-phone"></i> <%=exNevoie.getTelefon()%> </li>
    </ul>
    </div>

    <div class="card-back">
      <figure>
        <div class="img-bg"></div>
        <img class="imgg" src="https://images.unsplash.com/photo-1486162928267-e6274cb3106f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" alt="Brohm Lake">
      </figure>

      <button><a href="updDirect?Id_UserNev=<%=exNevoie.getId_UserNev()%>" style="text-decoration:none;color:white;">Editeaza</a></button>

      <div class="design-container">
        <span class="design design--1"></span>
        <span class="design design--2"></span>
        <span class="design design--3"></span>
        <span class="design design--4"></span>
        <span class="design design--5"></span>
        <span class="design design--6"></span>
        <span class="design design--7"></span>
        <span class="design design--8"></span>
      </div>
    </div>

  </div>
</div>

<%} else if(Status.equals("loading")){ %>

<div class="wrapper2">
  <div class="title2">
    <h3>Formularul dvs. este in curs de validare !</h3>
  </div>
</div>

<%} else if(Status.equals("nevalid")){%>

<form action="<%=request.getContextPath()%>/nevoieform" method="post" enctype="multipart/form-data">
<div class="wrapper" style="margin-top:120px;max-width: 600px;margin-bottom:20px;">
  <div class="title"><h1>Bine ati venit, <%=exUser.getNume()%> <%=exUser.getPrenume()%></h1></div>  
  <h6 style="font-family:'Courier New';color:red;font-weight:bold;text-shadow: 1px 0px 1px #fff;"><%=exNevoie.getMesajAdmin()%></h6>

  <div class="contact-form">
    <div class="input-fields">
    	<input type="hidden" class="input" placeholder="Status" name="Status" value="loading">
    	<input type="hidden" class="input" placeholder="Ziua" name="Ziua" value="">
    	<input type="hidden" class="input" placeholder="Luna" name="Luna" value="">
    	<input type="hidden" class="input" placeholder="Anul" name="Anul" value="">
    	<input type="hidden" class="input" placeholder="Id" name="Id" value="<%=exNevoie.getId()%>" />
    	<input type="hidden" class="input" placeholder="Id_UserNev" name="Id_UserNev" value="<%=exNevoie.getId_UserNev()%>">
        <input type="text" class="input" value="<%=exNevoie.getNume()%>" name="Nume">
        <input type="text" class="input" value="<%=exNevoie.getPrenume()%>" name="Prenume">
        <label for="Bani" class="input" style="font-size: 14px;">Bani &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="Bani" id="bani" >
 		 	<option value="da">Da</option>
  		 	<option value="nu">Nu</option>
	    </select></label>
        <label for="Haine" class="input" style="font-size: 14px;">Haine &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="Haine" id="haine" >
 		 	<option value="da">Da</option>
  		 	<option value="nu">Nu</option>
	    </select></label>
        <label for="Mancare" class="input" style="font-size: 14px;">Alimente &nbsp;
        <select name="Mancare" id="mancare" >
 		 	<option value="da">Da</option>
  		 	<option value="nu">Nu</option>
	    </select> </label> 
	    <label for="Descriere" style="font-size: 14px;color:#c5ecfd;margin-left:10px;margin-top:5px;">Descriere</label>
        <textarea id="descriere" name="Descriere" rows="3" cols="40" ></textarea> 
    </div>
    
    <div class="msg" style="margin-top: 25px;">
	  <input type="text" class="input" value="<%=exNevoie.getId()%>" name="Adresa"> 
	  <input type="text" class="input" value="<%=exNevoie.getAdresa2()%>" name="Adresa2">
	  <input type="text" class="input" value="<%=exNevoie.getCodPostal()%>" name="CodPostal">
	  <input type="text" class="input" value="<%=exNevoie.getTelefon()%>" name="Telefon"> <br><br><br><br>
      <label for="text" style="font-size: 14px;color: white;margin-left:45px;">*Upload document oficial*</label>
     <label for="text" style="font-size: 14px;color: white;margin-left:45px;font-style:italic;">&nbsp;&nbsp;&nbsp;&nbsp;Ex:CI,pasaport,permis</label>
      <div class="input_field">
      	<input type="file" placeholder="Imagine" name="Document" id="file" value="<%=exNevoie.getDocument()%>">
      	<label for="file">
      	&nbsp;&nbsp;&nbsp;<i class="fas fa-id-badge ">&nbsp; Incarca document</i>
      	</label> 	
      </div>
      <div class="btn"> <input type="submit" value="Cere ajutor" class="btnnev" style="margin-left: 28px;" onclick="return confirm('Sunteti sigur ca datele introduse sunt corecte?')"></div>            
    </div>
  </div>
</div>
</form>

<%}else if(Status.equals("null")){ %>

<form action="<%=request.getContextPath()%>/nevoieform" method="post" enctype="multipart/form-data">
<div class="wrapper" style="margin-top:105px;max-width: 600px;margin-bottom:15px;">
  <div class="title"><h1>Bine ati venit, <%=exUser.getNume()%> <%=exUser.getPrenume()%></h1></div>
  <div class="contact-form">
    <div class="input-fields"> 	
    	<input type="hidden" class="input" placeholder="Status" name="Status" value="loading">
        <input type="hidden" class="input" placeholder="Ziua" name="Ziua" value="">
    	<input type="hidden" class="input" placeholder="Luna" name="Luna" value="">
    	<input type="hidden" class="input" placeholder="Anul" name="Anul" value="">
    	<input type="hidden" class="input" placeholder="Id" name="Id" value="<%=exNevoie.getId()%>" />
    	<input type="hidden" class="input" placeholder="Id_UserNev" name="Id_UserNev" value="<%=exNevoie.getId_UserNev()%>">
        <input type="text" class="input" placeholder="Nume" name="Nume">
        <input type="text" class="input" placeholder="Prenume" name="Prenume">
        <label for="Bani" class="input" style="font-size: 14px;">Bani &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="Bani" id="bani" >
 		 	<option value="da">Da</option>
  		 	<option value="nu">Nu</option>
	    </select></label>
        <label for="Haine" class="input" style="font-size: 14px;">Haine &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="Haine" id="haine" >
 		 	<option value="da">Da</option>
  		 	<option value="nu">Nu</option>
	    </select></label>
        <label for="Mancare" class="input" style="font-size: 14px;">Alimente &nbsp;
        <select name="Mancare" id="mancare" >
 		 	<option value="da">Da</option>
  		 	<option value="nu">Nu</option>
	   </select></label> 
	   <label for="Descriere" style="font-size: 15px;color:#c5ecfd;margin-left:10px;margin-top:5px;">Descriere</label>
       <textarea id="descriere" name="Descriere" rows="3" cols="40" ></textarea> 	
    </div>
    
    <div class="msg" style="margin-top: 25px;">
		<input type="text" class="input" placeholder="Oras" name="Adresa"> 
	    <input type="text" class="input" placeholder="Adresa" name="Adresa2">
	    <input type="text" class="input" placeholder="Cod Postal" name="CodPostal">
	    <input type="text" class="input" placeholder="Telefon" name="Telefon">	<br><br><br><br>
        <label for="text" style="font-size: 14px;color: white;margin-left:45px;">*Upload document oficial*</label>
        <label for="text" style="font-size: 14px;color: white;margin-left:45px;font-style:italic;">&nbsp;&nbsp;&nbsp;&nbsp;Ex:CI,pasaport,permis</label>
        <div class="input_field">
      	<input type="file" placeholder="Imagine" name="Document" id="file">
      	<label for="file">&nbsp;&nbsp;&nbsp;<i class="fas fa-id-badge ">&nbsp; Incarca document</i></label> 	
        </div>
        <div class="btn"> <input type="submit" value="Cere ajutor" class="btnnev" style="margin-left: 10px;" onclick="return confirm('Sunteti sigur ca datele introduse sunt corecte?')"></div>      
   </div>
    
  </div>
</div>
</form>
<%} %>

</body>
</html>