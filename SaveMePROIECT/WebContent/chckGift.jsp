<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="hibernate.model.Cufar"%>
<%@ page import="hibernate.model.User"%>
<%@ page import="hibernate.dao.HibernateDao"%>

<% HibernateDao u= new HibernateDao();%>

<% 
int id_cufar = Integer.parseInt(request.getParameter("Id_cufar"));
User existingUser = u.selectUser(id_cufar);
Cufar existingCufar = u.selectCufar(id_cufar);
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
			<li><a href="admin.jsp" style="text-decoration:none;color:white;">Admin</a></li>
						<li><form action="nevoiasiServlet" method=post>
               	     	<input type="hidden" class="input" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Nevoiasi</button>
               	</form>
            </li>			
			<li><form action="addGift" method=post>
               	     	<input type="hidden" class="input" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Cufarul Magic</button>
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
    	<form action="CufarulMagic" method=post>
               	     	<input type="hidden" class="input" name="Id_cufar" value="<%=existingUser.getIdCufar()%>">
               	 		<input type="hidden" class="input"  name="Email" value="<%=existingUser.getEmail()%>">
               	 		<button type="submit" style="background: none;border:none;color:white;font-weight:bold;font-size:19px;margin-left:3px;" >Vezi gift-ul tau</button>
        </form>    	
    </div>
  </div> 
</div>

</body>
</html>