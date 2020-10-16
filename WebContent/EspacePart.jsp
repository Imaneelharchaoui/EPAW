<% if( (session.getAttribute("TYPE")) != null  && (session.getAttribute("TYPE")).equals("Part")){ %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
      <link rel="stylesheet" type="text/css" href="newfile0.css" >
      <link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/4299138fb6.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    
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

            <a class="nav-link text-white" href="#"><i class="fas fa-home"></i>  Home</a>
            </li>
             <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <i class="fas fa-user active" ></i> ${sessionScope.prenom } ${sessionScope.nom }
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="<%= request.getContextPath()%>/Logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
	           <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#profil"><i class="fas fa-user-edit" data-toggle="modal" data-target="#profil"></i> Update profile</a>
	           
	        </div>
	      </li>
           
            <li class="navbar-item">
            <a class="nav-link text-white" href="#"><i class="fas fa-info-circle"></i>  About us</a>
            </li>
            <li class="navbar-item">
            <a href="#contactus" class="nav-link text-white " data-toggle="modal" data-target="#reclamation" ><i class="fas fa-envelope" data-toggle="modal" data-target="#reclamation"></i>  Contact us</a>
            </li>
          </ul>
          <a class="navbar-brand ml-auto" id="icon1" href="#"><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
        </nav>
    <!-- Navigation and header -->
    
    <!-- page content -->
    <div class="jumbotron pm-tile " id="jumbotron2" style="height:400px;">
      <div class="d-flex  flex-column container-fluid">
        <h1 class="text-center" id="jumbtitle" >Bienvenue dans l'espace ADOPTEURS de E-paw</h1>
        <p class="text-center" id="text2"> Veuillez choisir une action s'il vous plait  </p>
        <a href="<%=request.getContextPath()%>/Animals" ><button class="btn btn-outline-info"  id="centrebtn3" type="button" name="button1"> Voir animaux disponibles</button></a>
        <a href="<%=request.getContextPath()%>/AllOffers" ><button class="btn btn-outline-info"   id="centrebtn1" type="button" name="button2">Section veterinaires</button></a>

      </div>

    </div>
<div class="d-flex  flex-column container-fluid" style="margin-top:30px"id="div1" >
      <div class="row" >
         
          <div class="col-sm-6 " id="text1">
            <p>Visitez la section veterinaire pour profiter des reductions et des offres de soins proposees par les veterinaires membres de <span id="icon1"><i class="fas fa-paw fa-xl" ></i> E-PAW </span><i class="fas fa-syringe"></i> </p>
            <a href="<%=request.getContextPath()%>/AllOffers" ><button class="btn btn-info"type="button" name="button">Visiter</button></a>
          </div>
          <div class="col-sm-6 " id="text1">
            <p>Consultez les annonces d'adoption disponibles et choisissez l'aniaml qui vous accompagnera dans vos aventures </p>
            <a href="<%=request.getContextPath()%>/Animals" ><button class="btn btn-info"type="button" name="button"> Voir annonces</button></a>

          </div>
      </div>
</div>
<!-- Particulier update profile modal -->
  <div class="modal fade" id="profil" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Inscrivez vous </h5>
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
<script >
$(document).ready(function(){
	$("#Check").click(function(){
		$("#mdp").toggle();
		
		
	})
	
})
</script>

 


  </body>
</html>
    <% } else { response.sendRedirect("Homeepaw.jsp?msg:sessionExpired");} %>
