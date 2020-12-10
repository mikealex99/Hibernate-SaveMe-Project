<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.User2"%>
<%@ page import="hibernate.model.Nevoie"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<%HibernateDao u= new HibernateDao();%>

<% String Email=request.getParameter("Email");
User2 existingUser2 = u.selectProfil2(Email); 
int id=existingUser2.getId_UserNev();
Nevoie exNevoie =u.selectUserNevoie(id); 

String Status=exNevoie.getStatus();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

<!-- Daca statusul este null atunci utilizatorul poate adauga un formular -->

<%if(Status == null){ %>

<form action="<%=request.getContextPath()%>/nevoieform" method="post" enctype="multipart/form-data">
<div class="wrapper" style="margin-top:105px;max-width: 600px;margin-bottom:15px;">
  <div class="title"><h1>Bine ati venit, <%=existingUser2.getNume()%> <%=existingUser2.getPrenume()%></h1></div>
  <div class="contact-form">
    <div class="input-fields">
    	<input type="hidden" class="input" placeholder="Status" name="Status" value="loading">
       	<input type="hidden" class="input" placeholder="Ziua" name="Ziua" value="">
    	<input type="hidden" class="input" placeholder="Luna" name="Luna" value="">
     	<input type="hidden" class="input" placeholder="Anul" name="Anul" value="">
    	<input type="hidden" class="input" placeholder="Id" name="Id" value="<%=exNevoie.getId()%>" />
    	<input type="hidden" class="input" placeholder="Id_UserNev" name="Id_UserNev" value="<%=existingUser2.getId_UserNev()%>">
      	<input type="text" class="input" placeholder="Nume" name="Nume" required="required">
      	<input type="text" class="input" placeholder="Prenume" name="Prenume" required="required">
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
	  	<label for="Descriere" style="font-size: 14px;color:#c5ecfd;margin-left:10px;margin-top:5px;">Descriere</label>
      	<textarea id="descriere" required="required" name="Descriere" rows="3" cols="40" ></textarea>  	
    </div>
    
    <div class="msg" style="margin-top: 25px;"> 
		<input type="text" class="input" placeholder="Oras" name="Adresa" required="required"> 
	  	<input type="text" class="input" placeholder="Adresa" name="Adresa2" required="required">
	  	<input type="text" class="input" placeholder="Cod Postal" name="CodPostal" required="required"> 
	  	<input type="text" class="input" placeholder="Telefon" name="Telefon" required="required">	<br><br><br><br>
      	<label for="text" style="font-size: 14px;color: white;margin-left:45px;">*Upload document oficial*</label>
     	<label for="text" style="font-size: 14px;color: white;margin-left:45px;font-style:italic;">&nbsp;&nbsp;&nbsp;&nbsp;Ex:CI,pasaport,permis</label>
      	<div class="input_field">
      		<input type="file" placeholder="Imagine" name="Document" id="file" required="required">
      		<label for="file">&nbsp;&nbsp;&nbsp;<i class="fas fa-id-badge ">&nbsp; Incarca document</i>
      		</label> 	
      	</div>
      <div class="btn"> <input type="submit" value="Cere ajutor" class="btnnev" style="margin-left: 2px;margin-top:30px;" onclick="return confirm('Sunteti sigur ca datele introduse sunt corecte?')"></div>      
    </div>
  </div>
</div>
</form>

<!-- Daca statusul este 'loading' atunci utilizatorul poate adauga un formular -->

<%} else if(Status.equals("loading")){ %>

<div class="wrapper2">
  <div class="title2"><h3>Formularul dvs. este in curs de validare !</h3></div>
</div>

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

<!-- Daca statusul este nevalid atunci utilizatorul trebuie sa astepte validarea lui -->

<%}else if(Status.equals("nevalid")){%>

<div class="nevalidbox" style="display: inline-block">
<form action="<%=request.getContextPath()%>/nevoieform" method="post" enctype="multipart/form-data">
<div class="wrapper" >
  <div class="title">
  	<h1>Bine ati venit, <%=existingUser2.getNume()%> <%=existingUser2.getPrenume()%></h1>
  </div>
  
  <h4 style="font-family:'Courier New';color:red;font-weight:bold;text-shadow: 1px 0px 1px #fff;"> <%=exNevoie.getMesajAdmin()%></h4>  
  
  <div class="contact-form">
  <div class="input-fields">   
  	<input type="hidden" class="input" placeholder="Status" name="Status" value="loading">
  	<input type="hidden" class="input" placeholder="Ziua" name="Ziua" value="">
  	<input type="hidden" class="input" placeholder="Luna" name="Luna" value="">
  	<input type="hidden" class="input" placeholder="Anul" name="Anul" value="">
  	<input type="hidden" class="input" placeholder="Id" name="Id" value="<%=exNevoie.getId()%>" />
  	<input type="hidden" class="input" placeholder="Id_UserNev" name="Id_UserNev" value="<%=existingUser2.getId_UserNev()%>">
  	<input type="text" class="input" placeholder="Nume" name="Nume" required="required">
  	<input type="text" class="input" placeholder="Prenume" name="Prenume" required="required">
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
	  <label for="Descriere" style="font-size: 14px;color:#c5ecfd;margin-left:10px;margin-top:5px;">Descriere</label>
      <textarea id="descriere" name="Descriere" rows="3" cols="40" required="required"></textarea> 	
	</div>
    
    <div class="msg" style="margin-top: 25px;">
		<input type="text" class="input" placeholder="Oras" name="Adresa" required="required"> 
	  	<input type="text" class="input" placeholder="Adresa" name="Adresa2" required="required">
	  	<input type="text" class="input" placeholder="Cod Postal" name="CodPostal" required="required">
	  	<input type="text" class="input" placeholder="Telefon" name="Telefon" required="required">	<br><br><br><br>
      	<label for="text" style="font-size: 14px;color: white;margin-left:45px;">*Upload document oficial*</label>
     	<label for="text" style="font-size: 14px;color: white;margin-left:45px;font-style:italic;">&nbsp;&nbsp;&nbsp;&nbsp;Ex:CI,pasaport,permis</label>
      	<div class="input_field">
      	<input type="file" placeholder="Imagine" name="Document" id="file" value="<%=exNevoie.getDocument()%>" required="required">
      	<label for="file">&nbsp;&nbsp;&nbsp;<i class="fas fa-id-badge ">&nbsp; Incarca document</i></label> 	
      	</div>
    <div class="btn"> <input type="submit" value="Cere ajutor" class="btnnev" style="margin-left:2px;" onclick="return confirm('Sunteti sigur ca datele introduse sunt corecte?')"></div>            
    </div>
  </div>
</div>
</form>
</div>

<%}else if(Status.equals("null")){ %>
<form action="<%=request.getContextPath()%>/nevoieform" method="post" enctype="multipart/form-data">
<div class="wrapper" style="margin-top:105px;max-width: 600px;margin-bottom:15px;">
  <div class="title">
    <h1>Bine ati venit, <%=existingUser2.getNume()%> <%=existingUser2.getPrenume()%></h1>
  </div>
  <div class="contact-form">
    <div class="input-fields">
    	<input type="hidden" class="input" placeholder="Status" name="Status" value="loading">
       	<input type="hidden" class="input" placeholder="Ziua" name="Ziua" value="">
    	<input type="hidden" class="input" placeholder="Luna" name="Luna" value="">
     	<input type="hidden" class="input" placeholder="Anul" name="Anul" value="">
    	<input type="hidden" class="input" placeholder="Id" name="Id" value="<%=exNevoie.getId()%>" />
    	<input type="hidden" class="input" placeholder="Id_UserNev" name="Id_UserNev" value="<%=existingUser2.getId_UserNev()%>">
      	<input type="text" class="input" placeholder="Nume" name="Nume" required="required">
      	<input type="text" class="input" placeholder="Prenume" name="Prenume" required="required">
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
	  	<label for="Descriere" style="font-size: 14px;color:#c5ecfd;margin-left:10px;margin-top:5px;">Descriere</label>
      	<textarea id="descriere" name="Descriere" rows="3" cols="40" required="required"></textarea> 		  
    </div>
    
    <div class="msg" style="margin-top: 25px;">  
		<input type="text" class="input" placeholder="Oras" name="Adresa" required="required"> 
	 	<input type="text" class="input" placeholder="Adresa" name="Adresa2" required="required">
	  	<input type="text" class="input" placeholder="Cod Postal" name="CodPostal" required="required">
	  	<input type="text" class="input" placeholder="Telefon" name="Telefon" required="required">	<br><br><br><br>
      	<label for="text" style="font-size: 14px;color: white;margin-left:45px;">*Upload document oficial*</label>
     	<label for="text" style="font-size: 14px;color: white;margin-left:45px;font-style:italic;">&nbsp;&nbsp;&nbsp;&nbsp;Ex:CI,pasaport,permis</label>
      	<div class="input_field">
      		<input type="file" placeholder="Imagine" name="Document" id="file" required="required">
      		<label for="file">&nbsp;&nbsp;&nbsp;<i class="fas fa-id-badge ">&nbsp; Incarca document</i></label> 	
      	</div>
      	<div class="btn"> <input type="submit" value="Cere ajutor" class="btnnev" style="margin-left: 2px;margin-top:30px;" onclick="return confirm('Sunteti sigur ca datele introduse sunt corecte?')"></div>   
    </div>
  </div>
</div>
</form>
<%} %>

</body>
</html>