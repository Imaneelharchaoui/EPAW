<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.io.*"%>
<%@ page import ="java.io.File.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List.*"%>
<%@ page import ="Beans.*"%>



<!DOCTYPE html>
<html lang="en" dir="ltr">
 <head>
      <link rel="stylesheet" type="text/css" href="cssfile0.css" >
      <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/4299138fb6.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <!-- Navigation and header -->
    <div class="jumbotron" id="jumbotron" style="margin-bottom:0px;">
      <h1 id="titletext"><i class="fas fa-paw fa-1x" id="logo"></i>  E-paw</h1>
    </div>

        <nav class="navbar navbar-expand-md navbar-dark bg-info  sticky-top" >
          <ul class="navbar-nav">
          <% 
            HttpSession session1 = request.getSession();
            if((session1.getAttribute("TYPE")).equals("Part")){ %>
            <li class="navbar-item">
            <a class="nav-link text-white" href="<%= request.getContextPath()%>/EspacePart.jsp"><i class="fas fa-home"></i>  Home</a>
            </li>
             <%} else if((session1.getAttribute("TYPE")).equals("Assoc")){ %>
            <li class="navbar-item">
            <a class="nav-link text-white" href="<%= request.getContextPath()%>/EspaceAssoc.jsp"><i class="fas fa-home"></i>  Home</a>
            </li>
             <%} else {  %>
            <li class="navbar-item">
            <a class="nav-link text-white" href="<%= request.getContextPath()%>/EspaceVet.jsp"><i class="fas fa-home"></i>  Home</a>
            </li>
              <%}  %>
            
            <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <i class="fas fa-user active" ></i> ${sessionScope.prenom } ${sessionScope.nom }
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#"><i class="fas fa-user-edit"></i> Update profile</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="<%= request.getContextPath()%>/Logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
	        </div>
	      </li>
            <li class="navbar-item">
            <a class="nav-link text-white" href="#"><i class="fas fa-info-circle"></i>  About us</a>
            </li>
            <% 
            if((session1.getAttribute("TYPE")).equals("Part")){ %>
             <li class="navbar-item">
            <a href="#contactus" class="nav-link text-white " data-toggle="modal" data-target="#reclamation" ><i class="fas fa-envelope" data-toggle="modal" data-target="#reclamation"></i>  Contact us</a>
            </li>
            <%} else if((session1.getAttribute("TYPE")).equals("Assoc")){ %>
            <li class="navbar-item">
            <a href="#contactus" class="nav-link text-white " data-toggle="modal" data-target="#reclamationAssoc" ><i class="fas fa-envelope" data-toggle="modal" data-target="#reclamationAssoc"></i>  Contact us</a>
            </li>
            <%}  %>
            
          </ul>
          
          <a class="navbar-brand ml-auto" id="icon1" href="#"><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
      		 <form class="form-inline my-2 my-lg-0 ml-auto" method="post" action="<%= request.getContextPath()%>/Recherche">
		      <input class="form-control mr-sm-2" name="espece" type="search" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><i class="fas fa-search"></i> Search</button>
		    </form>
          
        </nav>
    <!-- Navigation and header -->
<div class="modal fade bd-example-modal-lg" id="reclamation" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content">
		<div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Contactez nous</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          </button>
        </div>
        <form method="post" action="<%=request.getContextPath() %>/SEND" >
        	<div class="modal-body form-group">
           <div class="form-group">
              <label for="object">Objet de votre message :</label>
              <textarea  rows="1" cols="10" name="objet" class="form-control"  placeholder="Objet du message.."></textarea>
            </div>
            <div class="form-group">
          	<input id="email" name="email" type="hidden" value="${sessionScope.email }">
              
            </div>
            <div class="form-group">
              <label for="message">Veuillez saisir vote message :</label>
              <textarea  rows="10" cols="10" name="message" class="form-control"  placeholder="Votre message ..."></textarea>
            </div>
            </div>
            <div class="modal-footer">
          		<button type="submit" class="btn btn-success" >Envoyer</button>
           		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          		
       		</div>
          </form>
        
        
    </div>
  </div>
</div>

<div class="modal fade bd-example-modal-lg" id="reclamationAssoc" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content">
		<div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Contactez nous</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          </button>
        </div>
        <form method="post" action="<%=request.getContextPath() %>/SENDAssoc" >
        	<div class="modal-body form-group">
           <div class="form-group">
              <label for="object">Objet de votre message :</label>
              <textarea  rows="1" cols="10" name="objet" class="form-control"  placeholder="Objet du message.."></textarea>
            </div>
            <div class="form-group">
          	<input id="email" name="email" type="hidden" value="${sessionScope.email }">
              
            </div>
            <div class="form-group">
              <label for="message">Veuillez saisir vote message :</label>
              <textarea  rows="10" cols="10" name="message" class="form-control"  placeholder="Votre message ..."></textarea>
            </div>
            </div>
            <div class="modal-footer">
          		<button type="submit" class="btn btn-success" >Envoyer</button>
           		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          		
       		</div>
          </form>
        
        
    </div>
  </div>
</div>
<!-- page content -->

  <div class="container">
    <div class="row justify-content-center" style="margin-top:30px;">
      <%
      ArrayList<Offre> val= new ArrayList<Offre>();
      

       val =(ArrayList<Offre>) request.getAttribute("offres");

      for(int i=0;i<val.size();i++) {
    	   
    	  
    	  %>
          	  
      		  
      <div class="col-sm-4" style="margin-top:30px;">
        <div class="card shadow  " style="width:15rem;height:30rem;">
  <img class="card-img-top rounded-sm" style="height:170px;" src="https://d2g8igdw686xgo.cloudfront.net/18558218_1488311282.064.jpg"  alt="Card image cap" />
  <div class="card-body">
    <h5 class="card-title" > <strong>TYPE :</strong><span class="d-inline-block text-truncate" style="max-width: 200px;"> <%= val.get(val.size()-1-i).type %></span></h5>
    <p class="text-align-left"><strong>DESCRIPTION : </strong> <span class="d-inline-block text-truncate" style="max-width: 200px;"><%= val.get(val.size()-1-i).description %></span></p>

    <button  class="btn btn-info"  data-toggle="modal" data-target="#Offre<%= i%>">Voir Offre </button>
       <%  if((session1.getAttribute("TYPE")).equals("Vet")){ %>
       <form method="post" action="<%= request.getContextPath()%>/DelOffre">
       <% if((val.get(val.size()-1-i).status).equals("0")){ %>  	
      	
		<input id="id" name="id" type="hidden" value="<%= val.get(val.size()-1-i).id %>">
   		<input id="email" name="email" type="hidden" value="<%= val.get(val.size()-1-i).email %>">
		     		
    	<input id="id" name="status" type="hidden" value="1">
		<button type="submit" class="btn btn-danger" style="margin-top:10px;">Supprimer</button>	
								      		
		<% } else { %>
        <input id="id" name="id" type="hidden" value="<%= val.get(val.size()-1-i).id %>">
		<input id="email" name="email" type="hidden" value="<%= val.get(val.size()-1-i).email %>">
		<input id="status" name="status" type="hidden" value="0">
		 <button type="submit" class="btn btn-success" style="margin-top:10px;" >Restaurer</button>	
								      		
			<%} %>
     </form>
       <%}  %>

  </div>
  <div class="card-footer">
      <small class="text-muted">posted on : <%= val.get(val.size()-1-i).date %></small>
    </div>
</div>
      </div>
     
<div class="modal fade" id="Offre<%= i%>" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><strong>Fiche de l'offre :</strong> <%= val.get(val.size()-1-i).type %> </h5>
       
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <p class="text-center"><strong>TARIF : </strong><%= val.get(val.size()-1-i).tarification %><br><strong>DESCRIPTION : </strong><%= val.get(val.size()-1-i).description %><br><strong>EMAIL CABINET : </strong><%= val.get(val.size()-1-i).email %><br><strong>TELEPHONE : </strong><%= val.get(val.size()-1-i).telephone %> </p>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



      <% } %>

    </div>
  </div>





  </body>
</html>
    