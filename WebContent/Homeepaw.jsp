<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
      <link rel="stylesheet" type="text/css" href="NewFile1.css" >
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

            <a class="nav-link text-white" href="#"><i class="fas fa-home"></i>  Home</a>
            </li>
            <li class="navbar-item">
            <a class="nav-link text-white" href="#connection" data-toggle="modal" data-target="#connection"><i class="fas fa-user" data-toggle="modal" data-target="#connection"></i>  Connection</a>
            </li>
            <li class="navbar-item">
            <a class="nav-link text-white" href="#"><i class="fas fa-info-circle"></i>  About us</a>
            </li>
            <li class="navbar-item">
            <a class="nav-link text-white " href="#"><i class="fas fa-envelope"></i>  Contact us</a>
            </li>
          </ul>
           <a class="navbar-brand ml-auto" id="icon1" href="#"><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
          
          
        </nav>
        
    <!-- Navigation and header -->
    
    <!-- page content -->
      <div class="jumbotron pm-tile" id="jumbotron2" style="height:400px; ">
        <div class="d-flex  flex-column container-fluid">
          <h1 class="text-center" id="jumbtitle" >Bienvenue dans la plateforme  E-paw</h1>
          <p class="text-center" id="text2">La platefrom E-paw est un espace concu pour faciliter l'operation d'adoption et de d'offre de dons , a travers notre platefrome vous pouvez soit adopter un animal et faire des offres de dons (croquettes,produits hygienique...) en tant qu'utilisateur normal , soit deposer une offre d'adoption et faire des offres de dons en tant que membre association .   </p>
          <button class="btn btn-outline-info" href="#choixinscription" data-toggle="modal" data-target="#choixinscription"  id="centrebtn" type="button" name="button">S'inscrire</button>
	
        </div>

    </div>

    <div class="d-flex  flex-column container-fluid" style="margin-top:30px"id="div1" >
      <div class="row" >
          <div class="col-sm-4" id="text1">

              <p>Besoin de compagnie? venez decouvrir les animaux disponibles en adoption et choisissez celui qui vous accompagnera durant vos aventures !</p>
              <button class="btn btn-info"type="button"data-toggle="modal" data-target="#connection" name="button" >Adopter</button>
          </div>
          <div class="col-sm-4 " id="text1">
            <p>Vous etes une association et vous voulez mettre vos animaux en adoption ? rejoignez nous en vous inscrivant en tant que membre association et decouvrez les options que propose notre plateforme !</p>
            <button class="btn btn-info"type="button" data-toggle="modal" data-target="#inscriptionAssociation" name="button">S'inscrire</button>
          </div>
          <div class="col-sm-4 " id="text1">
            <p>Cette rubrique est concue pour les veterinaires qui souhaitent offrir des offres de soin ou proposer des services cliniques avec des tarifs reduits</p>
            <button class="btn btn-info"type="button" data-toggle="modal" data-target="#connection" name="button">Déposer mon offre</button>
          </div>
      </div>
</div>
<!-- page content -->


<!-- choix inscription modal -->
  <div class="modal fade" id="choixinscription" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i>  S'incrire en tant que </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body ">
          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#inscriptionParticulier"   style="margin-left:20px">PARTICULIER</button>
          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#inscriptionAssociation" style="margin-left:20px">ASSOCIATION</button>
          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#inscriptionVeterinaire" style="margin-left:20px">VETERINAIRE</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- choix inscription modal -->
<!-- connection modal -->
  <div class="modal fade" id="connection" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Connectez-vous</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body form-group">
          <form method="post" action="<%=request.getContextPath() %>/Connection" >
            <div class="form-group">
              <label for="exampleInputEmail1">Adresse email</label>
              <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Mot de passe</label>
              <input type="password" name="motdepasse" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="d-flex justify-content-between">
            <button type="button" data-toggle="modal" data-target="#choixinscription" data-dismiss="modal"  class="btn btn-info">S'inscrire</button> 
            <button type="submit" class="btn btn-success">Se connecter</button>
          	</div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- connection modal -->
  <!-- Association subscription modal -->
  <div class="modal fade" id="inscriptionAssociation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Inscrivez vous </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body form-group">
          <form action="<%= request.getContextPath() %>/InscriptionAssoc" method="post">
            <div class="form-group">
              <label for="exampleInputEmail1">Adresse email : </label>
              <input type="email" name="email" nom="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Nom de l'association :</label>
              <input type="text" name="nom" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Domaine d'activité :</label>
              <input type="text" name="domaine" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Adresse :</label>
              <input type="text" name="localisation" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Numéro de telephone :</label>
              <input type="text" name="telephone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Mot de passe :</label>
              <input type="password" class="form-control" name="motdepasse" id="exampleInputPassword1" placeholder="Password">
            </div>
             <div class="form-group">
              <label for="exampleInputPassword1">Confirmez votre mot de passe :</label>
              <input type="password" class="form-control" name="motdepasse1" id="exampleInputPassword1" placeholder="Password">
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
  <!-- Association subscription modal -->
<!-- Particulier subscription modal -->
  <div class="modal fade" id="inscriptionParticulier" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Inscrivez vous </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body form-group">
          <form action="<%= request.getContextPath() %>/InscriptionParticulier" method="post">
            <div class="form-group">
              <label for="exampleInputEmail1">Adresse email : </label>
              <input type="email" name="email" nom="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Nom :</label>
              <input type="text" name="nom" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Prenom :</label>
              <input type="text" name="prenom" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter first name">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Adresse :</label>
              <input type="text" name="adresse" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter adress">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Numéro de telephone :</label>
              <input type="text" name="telephone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter number">
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Description :</label>
              <textarea  rows="5" cols="10" name="description" class="form-control"  placeholder="Dans cette section essayez de decrire votre habitat pour augmenter les chances de validation de votre demande d'adoption "></textarea>
              
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Mot de passe :</label>
              <input type="password" class="form-control" name="motdepasse" id="exampleInputPassword1" placeholder="Password">
            </div>
             <div class="form-group">
              <label for="exampleInputPassword1">Confirmez votre mot de passe :</label>
              <input type="password" class="form-control" name="motdepasse1" id="exampleInputPassword1" placeholder="Password">
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
  
  

<!-- Veterinaire subscription modal -->
  <div class="modal fade" id="inscriptionVeterinaire" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Inscrivez vous </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body form-group">
          <form action="<%= request.getContextPath() %>/InscriptionVet" method="post">
            <div class="form-group">
              <label for="exampleInputEmail1">Adresse email : </label>
              <input type="email" name="email" nom="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Nom du cabinet veterinaire :</label>
              <input type="text" name="nom" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">N° autorisation :</label>
              <input type="text" name="autorisation" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Adresse cabinet:</label>
              <input type="text" name="adresse" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
             <div class="form-group">
              <label for="exampleInputEmail1">Numéro de telephone :</label>
              <input type="text" name="telephone" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            </div>
			  <div class="form-group">
              <label for="exampleInputEmail1">Description :</label>
              <textarea  rows="5" cols="10" name="description" class="form-control"  placeholder=""></textarea>
            </div>            
            <div class="form-group">
              <label for="exampleInputPassword1">Mot de passe :</label>
              <input type="password" class="form-control" name="motdepasse" id="exampleInputPassword1" placeholder="Password">
            </div>
             <div class="form-group">
              <label for="exampleInputPassword1">Confirmez votre mot de passe :</label>
              <input type="password" class="form-control" name="motdepasse1" id="exampleInputPassword1" placeholder="Password">
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
  <!-- Veterinaire subscription modal -->

  </body>
</html>
    