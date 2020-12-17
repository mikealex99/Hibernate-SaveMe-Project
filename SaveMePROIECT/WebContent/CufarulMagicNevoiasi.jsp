<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.User2"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.dao.HibernateDao"%>  
 <%@ page import="java.util.List"%>
 
<% HibernateDao u= new HibernateDao();   

int id_usernev = Integer.parseInt(request.getParameter("Id_UserNev"));
User2 existingUser2 = u.selectUserProfil2(id_usernev); 
%> 

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

<%
String Email=existingUser2.getEmail();
if(Email == null) {%>

<jsp:forward page="home.html" />

<%}else if(Email != null){ %>



<header>
	<nav>
		<img src="Imagini/logo.jpg" width="200px" height="50px" style="margin-top:15px;margin-left:15px;">
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
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Formular</button>
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
			</li>	
		</ul>	
	</nav>
</header>

<!-- Listam toate inregistrarile din tabelul 'Cufar' -->
<%List<Cufar> listCufar= u.selectAllCufarNev();%>

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
<%}} %>

</body>
</html>