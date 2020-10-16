<% if((session.getAttribute("TYPE")) != null && (session.getAttribute("TYPE")).equals("Part")){ %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.io.*"%>
<%@ page import ="java.io.File.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List.*"%>
<%@ page import ="Beans.Animal"%>
<%@ page import ="Beans.Association"%>



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
            <li class="navbar-item">

            <a class="nav-link text-white" href="<%= request.getContextPath()%>/EspacePart.jsp"><i class="fas fa-home"></i>  Home</a>
            </li>
            <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <i class="fas fa-user active" ></i> ${sessionScope.prenom } ${sessionScope.nom }
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#profil"><i class="fas fa-user-edit" data-toggle="modal" data-target="#profil"></i> Update profile</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="<%= request.getContextPath()%>/Logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
	        </div>
	      </li>
            <li class="navbar-item">
            <a class="nav-link text-white" href="#"><i class="fas fa-info-circle"></i>  About us</a>
            </li>
            <li class="navbar-item">
            <a href="#contactus" class="nav-link text-white " data-toggle="modal" data-target="#reclamation" ><i class="fas fa-envelope" data-toggle="modal" data-target="#reclamation"></i>  Contact us</a>
            </li>
          </ul>
          
       <a class="navbar-brand ml-auto" id="icon1" href="#" ><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
      		 <form class="form-inline my-2 my-lg-0 ml-auto" method="post" action="<%= request.getContextPath()%>/Recherche">
		      <input class="form-control mr-sm-2" name="espece" type="search" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><i class="fas fa-search"></i> Search</button>
		    </form>
          
        </nav>
    <!-- Navigation and header -->
<!-- Particulier update profile modal -->
  <div class="modal fade" id="profil" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Modifiez vos informations </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body form-group">
          <form action="<%= request.getContextPath() %>/UpdateParticulier" method="post">
            <div class="form-group">
              <label for="exampleInputEmail1">Adresse email : </label>
              <input type="email" name="email"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.email}" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Nom :</label>
              <input type="text" name="nom" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.nom}" placeholder="Enter name">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Prenom :</label>
              <input type="text" name="prenom" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.prenom}" placeholder="Enter first name">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Adresse :</label>
              <input type="text" name="adresse" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.adresse}" placeholder="Enter adress">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Numéro de telephone :</label>
              <input type="text" name="telephone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.tel}" placeholder="Enter number">
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Description :</label>
              <textarea  rows="5" cols="10" name="description" class="form-control"  placeholder="Dans cette section essayez de decrire votre habitat pour augmenter les chances de validation de votre demande d'adoption ">${sessionScope.description}</textarea>
              
            </div>
            <div class="form-check" style="margin-bottom:10px;" >
			  <input class="form-check-input" name="checked" type="checkbox" value="1" id="Check">
			  <label class="form-check-label" for="Check">
			    Modifier mot de passe ?
			  </label>
			</div>
			<input type="hidden" name="idPart" value="${sessionScope.id}">
			
			<div id="mdp" style="display:none;">
            
            <div class="form-group">
              <label for="exampleInputPassword1">Nouveau mot de passe :</label>
              <input type="password" class="form-control" name="motdepasse" id="exampleInputPassword1" placeholder="New password">
            </div>
             <div class="form-group">
              <label for="exampleInputPassword1">Confirmez votre mot de passe :</label>
              <input type="password" class="form-control" name="motdepasse1" id="exampleInputPassword1" placeholder="Confirm new password">
            </div>
            
            </div>
            <button type="submit" class="btn btn-info">Valider</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Particulier subscription modal -->
  <div class="modal fade bd-example-modal-lg" id="reclamation" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content">
		<div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Contactez nous</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
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
  
<!-- page content -->

  <div class="container">
    <div class="row justify-content-center" style="margin-top:30px;">
      <%
      ArrayList<Animal> val= new ArrayList<Animal>();
      ArrayList<Association> val1= new ArrayList<Association>();
      

       val =(ArrayList<Animal>) request.getAttribute("animaux");

      for(int i=0;i<val.size();i++) {
    	   
		    val1 =(ArrayList<Association>) request.getAttribute("association");
    	  
    	  %>
          	  
      		  
      <div class="col-sm-4" style="margin-top:30px;">
        <div class="card shadow  " style="width:15rem;height:30rem;">
  <img class="card-img-top rounded-sm" style="height:170px;" src="<%= val.get(val.size()-1-i).image %>"  alt="Card image cap" />
  <div class="card-body">
    <h5 class="card-title" ><%= val.get(val.size()-1-i).espece %></h5>
    <p class="card-text text-center"><strong>Description : </strong><%= val.get(val.size()-1-i).desc %></p>
    <button  class="btn btn-info"  data-toggle="modal" data-target="#ficheanimal<%= i%>"><i class="far fa-eye"></i> Voir fiche</button>

  </div>
  <div class="card-footer">
      <small class="text-muted">posted on : <%= val.get(val.size()-1-i).date %></small>
    </div>
</div>
      </div>
      <div class="modal fade" id="ficheanimal<%= i%>" tabindex="-1" role="dialog" aria-labelledby="ficheanimal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Fiche de l'animal </h5>
      </div>
      <div class="modal-body">
         <img class="card-img-top rounded-sm" style="height:250px;" src="<%= val.get(val.size()-1-i).image %>"  alt="Card image cap" />
        <p class=" text-center"> <strong>RACE: </strong><%= val.get(val.size()-1-i).race %> </br> <strong>SEXE: </strong> <%= val.get(val.size()-1-i).sexe %></br><strong>AGE: </strong><%= val.get(val.size()-1-i).age %> MOIS
     </br><strong>HANDICAP: </strong><%= val.get(val.size()-1-i).handicap %></br><strong>VACCIN: </strong> <%= val.get(val.size()-1-i).vaccin %> </br><strong>CASTRE/STERILISEE: </strong> <%= val.get(val.size()-1-i).cs %></p>
    
      </div>
      
      <div class="modal-footer">
         <button  class="btn btn-success" data-toggle="modal" data-target="#infoassociation<%= i%>" data-dismiss="modal" ><i class="far fa-comment-dots fa-1x"></i> Contacter association</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
<div class="modal" tabindex="-1" id="infoassociation<%= i%>" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">ASSOCIATION : <%= val1.get(val1.size()-1-i).nom %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p class=" text-center"> <strong>NOM DE L'ASSOCIATION: </strong><%= val1.get(val1.size()-1-i).nom %> </br> <strong>DOMAINE D'ACTIVITE : </strong> <%= val1.get(val1.size()-1-i).domaine %></br><strong>EMAIL : </strong><%= val1.get(val1.size()-1-i).email %>
     </br><strong>N° DE TELEPHONE : </strong><%= val1.get(val1.size()-1-i).telephone %></br><strong>ADRESSE: </strong> <%= val1.get(val1.size()-1-i).localisation %> </br></p>
      </div>
      <div class="modal-footer">
       <form action="<%= request.getContextPath()%>/SENDINGMAIL" method="post">
       	<input type="hidden" name="idAnnonce" value="<%= val.get(val.size()-1-i).id %>">
       	<input type="hidden" name="nomAssoc" value="<%= val1.get(val1.size()-1-i).nom %>">
       	<input type="hidden" name="nomPart" value="${sessionScope.nom }">
        <input type="hidden" name="prenomPart" value="${sessionScope.prenom }">
        <input type="hidden" name="telPart" value="${sessionScope.tel }">
        <input type="hidden" name="emailPart" value="${sessionScope.email }">
       	<input type="hidden" name="idPart" value="${sessionScope.id }">
      	<input type="hidden" name="email" value="<%= val1.get(val1.size()-1-i).email %>">
       	
 
       <button type="submit" class="btn btn-success"  >Envoyer demande automatique</button></a>
        <button  class="btn btn-warning" type="button" data-toggle="modal" data-target="#signaler<%= i%>" data-dismiss="modal" >Signaler Association</button>
      </form>
      </div>
    </div>
  </div>
</div>


<!-- Modal signaler-->
<div class="modal fade" id="signaler<%= i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Signaler Association</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" action="<%=request.getContextPath() %>/Signaler">
      
	      <div class="modal-body">
	         		<input type="hidden" name="NomAssoc" value="<%= val1.get(val1.size()-1-i).nom %>">        		
	        		<input type="hidden" name="id" value="<%= val1.get(val1.size()-1-i).id %>"> 
	        		<input type="hidden" name="email" value="${sessionScope.email}"> 
	  			<div class="form-group">
	              <label for="exampleInputEmail1"><strong>Motif de signalisation :</strong></label>
	              <input type="text" class="form-control" name="Motif"  placeholder="Motif de la signalisation..">
	            </div>               	
	        	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-success">Envoyer</button>
	      </div>
        </form>
      
    </div>
  </div>
</div>
<!-- Modal signaler-->

      <% } %>

    </div>
  </div>





  </body>
</html>
    <% } else { response.sendRedirect("Homeepaw.jsp?msg:sessionExpired");} %>
    