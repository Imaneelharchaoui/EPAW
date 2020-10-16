<% if( (session.getAttribute("TYPE")) != null  && (session.getAttribute("TYPE")).equals("Assoc")){ %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.io.*"%>
<%@ page import ="java.io.File.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List.*"%>
<%@ page import ="Beans.Animal"%>


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

            <a class="nav-link text-white" href="<%= request.getContextPath()%>/EspaceAssoc.jsp"><i class="fas fa-home"></i>  Home</a>
            </li>
             <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <i class="fas fa-user active" ></i> ${sessionScope.nom }
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
             <li class="navbar-item">
            <a href="#reclamation" class="nav-link text-white " data-toggle="modal" data-target="#reclamations" ><i class="fas fa-envelope" data-toggle="modal" data-target="#reclamations"></i>  Contact us</a>
            </li>
          </ul>
			 <a class="navbar-brand ml-auto" id="icon1" href="#"><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
      		 <form class="form-inline my-2 my-lg-0 ml-auto" method="post" action="<%= request.getContextPath()%>">
		      <input class="form-control mr-sm-2" name="espece" type="search" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-light my-2 my-sm-0" type="submit" ><i class="fas fa-search"></i> Search</button>
		    </form>
        </nav>
    <!-- Navigation and header -->

<!-- page content -->
<div class="modal fade bd-example-modal-lg" id="reclamations" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
  <div class="container">
    <div class="row justify-content-center" style="margin-top:30px;">
      <%
      ArrayList<Animal> val= new ArrayList<Animal>();
       val =(ArrayList<Animal>) request.getAttribute("animaux");
      for(int i=0;i<val.size();i++) {
    	  
    	  
    	  %>
      
      <div class="col-sm-4" style="margin-top:30px;">
        <div class="card shadow" id="card" style="width:17rem;height:35rem;">
  <img class="card-img-top rounded-sm" style="height:170px;" src="<%= val.get(val.size()-1-i).image %>"  alt="Card image cap" />
  <div class="card-body">
    <h5 class="card-title" ><%= val.get(val.size()-1-i).espece %></h5>
    <p class="card-text text-center"><strong>Description : </strong><%= val.get(val.size()-1-i).desc %></p>
    <button  class="btn btn-info" data-toggle="modal" data-target="#ficheanimal<%= i%>"><i class="far fa-eye"></i> Voir fiche</button>
    <button  class="btn btn-warning" data-toggle="modal" data-target="#update<%= i%>" style="margin-top:10px;"><i  class="far fa-edit"></i> Modifier informations</button>
   <% if((val.get(val.size()-1-i).status).equals("0")){ %>  	
      	
    <button  class="btn btn-danger" data-toggle="modal" data-target="#delete<%= i%>" style="margin-top:10px;"><i class="fas fa-trash" ></i> Supprimer</button>
      			
      		
      		<% } else { %>
      		<form method="post" action="<%= request.getContextPath() %>/DelAnn">
      		<input id="email" name="email" type="hidden" value="<%= val.get(val.size()-1-i).email %>">
      		<input id="id" name="id" type="hidden" value="<%= val.get(val.size()-1-i).id %>">
      		<input id="status" name="status" type="hidden" value="0">
      	    <button type="submit" class="btn btn-success" style="margin-top:10px;" >Restaurer</button>	
      		</form>
      		<%} %> 
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>

 <div class="modal fade" id="delete<%= i%>" tabindex="-1" role="dialog" aria-labelledby="ficheanimal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <div class="modal-body">
        <p class=" text-center">Est ce que vous etes sur de vouloir supprimer l'annonce concernant :<strong><%= val.get(val.size()-1-i).espece %></strong></p>
        <form method="post" action="<%= request.getContextPath() %>/DelAnn">
       <input type="hidden" name="email" value="<%= val.get(val.size()-1-i).email %>">
       <input type="hidden" name="id" value="<%= val.get(val.size()-1-i).id %>">
 	   <input type="hidden" name="status" value="1">
 
        <button type="submit" class="btn btn-danger">Oui</button>
        <button type="button" class="btn btn-secondary">Non</button>
        </form>
      </div>
      
    </div>
  </div>
</div>


<div class="modal fade" id="update<%= i%>" tabindex="-1" role="dialog" aria-labelledby="ficheanimal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Modifier les informations de l'animal </h5>
      </div>
      <div class="modal-body">
       <form method="post"  action="<%= request.getContextPath() %>/UpdateAnnonce">
            <div class="form-group">
              <label for="exampleInputEmail1">Espece de l'animale*</label>
              <input type="text" class="form-control" name="espece" value="<%= val.get(val.size()-1-i).espece %>" placeholder="Enter text">
            </div>
            <div class="form-group">
              <label for="race">Race</label>
              <input type="text" class="form-control" id="race" name="race" value="<%= val.get(val.size()-1-i).race %>" placeholder="ex : Husky">
            </div>
            <div class="form-group">
              <label for="Sexe">Sexe</label>
              <div class="custom-control custom-radio" id="Radio">
                  <input type="radio" class="custom-control-input active " value="Male"  id="customControlValidation2" name="sexe" required <% if((val.get(val.size()-1-i).sexe).equals("Male")) {  %> checked><% }else{%>><% }; %>
                  <label class="custom-control-label" for="customControlValidation2">Male</label>
                  </div>

              <div class="custom-control custom-radio mb-3" id="Radio">
                  <input type="radio" class="custom-control-input active" value="Femelle"  id="customControlValidation3" name="sexe" required<% if((val.get(val.size()-1-i).sexe).equals("Femelle")) {  %> checked><% }else{%>><% }; %>	
                  <label class="custom-control-label" for="customControlValidation3">Femelle</label>
                 </div>

            </div>

            <div class="form-group">
              <label for="Age">Age(en mois)</label>
              <input type="text" class="form-control" name="age" id="exampleInputPassword1" value="<%= val.get(val.size()-1-i).age %>" placeholder="ex : 18 mois">
            </div>
            <div class="form-group">
              <label for="Handicap">Handicap</label>
              <div class="custom-control custom-radio" id="Radio">
                  <input type="radio" class="custom-control-input" value="Oui" id="customControlValidation4" name="handicap" required<% if((val.get(val.size()-1-i).handicap).equals("Oui")) {  %> checked><% }else{%>><% }; %>
                  <label class="custom-control-label" for="customControlValidation4">Oui</label>
                  </div>

              <div class="custom-control custom-radio mb-3" id="Radio">
                  <input type="radio" class="custom-control-input" value="Non" id="customControlValidation5" name="handicap" required<% if((val.get(val.size()-1-i).handicap).equals("Non")) {  %> checked><% }else{%>><% }; %>
                  <label class="custom-control-label" for="customControlValidation5">Non</label>
                 </div>

            </div>
            <div class="form-group">
              <label for="Vaccin">Vacciné?</label>
              <div class="custom-control custom-radio" id="Radio">
                  <input type="radio" class="custom-control-input" value="Oui" id="customControlValidation6" name="vaccin" required<% if((val.get(val.size()-1-i).vaccin).equals("Oui")) {  %> checked><% }else{%>><% }; %>
                  <label class="custom-control-label" for="customControlValidation6">Oui</label>
                  </div>

              <div class="custom-control custom-radio mb-3" id="Radio">
                  <input type="radio" class="custom-control-input"  value="Non" id="customControlValidation7" name="vaccin" required<% if((val.get(val.size()-1-i).vaccin).equals("Non")) {  %> checked><% }else{%>><% }; %>
                  <label class="custom-control-label" for="customControlValidation7">Non</label>
                 </div>

            </div>
            <div class="form-group" >
              <label for="Cs">Castré/sterilisée?</label>
                <div class="custom-control custom-radio" id="Radio">
                    <input type="radio" class="custom-control-input" value="Oui" id="customControlValidation8" name="cs" required<% if((val.get(val.size()-1-i).cs).equals("Oui")) {  %> checked><% }else{%>><% }; %>
                    <label class="custom-control-label" for="customControlValidation8">Oui</label>
                    </div>

                <div class="custom-control custom-radio mb-3" id="Radio">
                    <input type="radio" class="custom-control-input" value="Non"  id="customControlValidation9" name="cs" required<% if((val.get(val.size()-1-i).cs).equals("Non")) {  %> checked><% }else{%>><% }; %>
                    <label class="custom-control-label" for="customControlValidation9">Non</label>
                   </div>
                 </div>  
              <div class="form-group">
             		 <label for="Description">Description</label>
              		 <textarea rows="3" cols="10" class="form-control" name="Description" maxlength="120"  placeholder="Description..."><%= val.get(val.size()-1-i).desc %></textarea>
            </div>
                 <div class="form-group">
              		<label for="exampleInputEmail1">Saisir URL imge</label>
              		<input type="text"  name="image"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= val.get(val.size()-1-i).image %>" placeholder="Enter url">
            </div>
             
                 <input type="number" name="id" id="Id" value="<%= val.get(val.size()-1-i).id %>" style="display:none;"/>
                 
            
				 
            

            <button type="submit" class="btn btn-info" >Valider</button>
          </form>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>


      <% 
       } %>

    </div>
  </div>

<!-- page content -->



</script>

  



  </body>
</html>
    <% } else { response.sendRedirect("Homeepaw.jsp?msg:sessionExpired");} %>
    