<% if( (session.getAttribute("TYPE")) != null  && (session.getAttribute("TYPE")).equals("Assoc")){ %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
      <link rel="stylesheet" type="text/css" href="newfile0.css" >
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
        </nav>
    <!-- Navigation and header -->
    <!-- page content -->
    <div class="jumbotron pm-tile " id="jumbotron2" style="height:400px;">
      <div class="d-flex  flex-column container-fluid">
        <h1 class="text-center" id="jumbtitle" >Bienvenue dans l'espace ASSOCIATION de E-paw</h1>
        <p class="text-center" id="text2"> Veuillez choisir une action s'il vous plait  </p>
        <a href="<%=request.getContextPath()%>/MyAnimals" ><button class="btn btn-outline-info"  id="centrebtn3" type="button" name="button1"> Mes annonces</button></a>
        <button class="btn btn-outline-info" href="#formulaireannonces" data-toggle="modal" data-target="#formulaireannonces"  id="centrebtn1" type="button" name="button2">Déposer une annonce d'adoption</button>
        <a href="<%=request.getContextPath()%>/AllOffers" ><button class="btn btn-outline-info" href="#inscription" id="centrebtn2" type="button" name="button3">Section veterinaires</button></a>

      </div>

    </div>
<div class="d-flex  flex-column container-fluid" style="margin-top:30px"id="div1" >
      <div class="row" >
          <div class="col-sm-4" id="text1">

              <p>Deposez vos annonces d'adoptions et recevez des dizaines de demande d'adoption par jours! <i class="fas fa-cat"></i> <i class="fas fa-dog"></i></p>
              <button class="btn btn-info"type="button" href="#formulaireannonces" data-toggle="modal" data-target="#formulaireannonces"  >Deposer une annonce</button>
          </div>
          <div class="col-sm-4 " id="text1">
            <p>Visitez la section veterinaire pour profiter des reductions et des offres de soins proposees par les veterinaires membres de <span id="icon1"><i class="fas fa-paw fa-xl" ></i> E-PAW </span><i class="fas fa-syringe"></i> </p>
            <a href="<%=request.getContextPath()%>/AllOffers" ><button class="btn btn-info"type="button" name="button">Visiter</button></a>
          </div>
          <div class="col-sm-4 " id="text1">
            <p>Consultez a tout moment les annonces que vous deposez pour  pouvoir les supprimer ou les modifier </p>
            <a href="<%=request.getContextPath()%>/MyAnimals" ><button class="btn btn-info"type="button" name="button">Mes Annonces</button></a>
          </div>
      </div>
</div>
   
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
  <!-- Info animale -->
  <div class="modal fade" id="formulaireannonces" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Veuilez saisire les infomations de l'animale. </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body form-group">
          <form method="post"  action="<%= request.getContextPath() %>/AjoutAnnonce">
            <div class="form-group">
              <label for="exampleInputEmail1">Espece de l'animale*</label>
              <input type="text" class="form-control" name="espece"  placeholder="Enter text">
            </div>
            <div class="form-group">
              <label for="race">Race</label>
              <input type="text" class="form-control" id="race" name="race" placeholder="ex : Husky">
            </div>
            <div class="form-group">
              <label for="Sexe">Sexe</label>
              <div class="custom-control custom-radio" id="Radio">
                  <input type="radio" class="custom-control-input" value="Male" id="customControlValidation2" name="sexe" required>
                  <label class="custom-control-label" for="customControlValidation2">Male</label>
                  </div>

              <div class="custom-control custom-radio mb-3" id="Radio">
                  <input type="radio" class="custom-control-input" value="Femelle" id="customControlValidation3" name="sexe" required>
                  <label class="custom-control-label" for="customControlValidation3">Femelle</label>
                 </div>

            </div>

            <div class="form-group">
              <label for="Age">Age(en mois)</label>
              <input type="text" class="form-control" name="age" id="exampleInputPassword1" placeholder="ex : 18 mois">
            </div>
            <div class="form-group">
              <label for="Handicap">Handicap</label>
              <div class="custom-control custom-radio" id="Radio">
                  <input type="radio" class="custom-control-input" value="Oui" id="customControlValidation4" name="handicap" required>
                  <label class="custom-control-label" for="customControlValidation4">Oui</label>
                  </div>

              <div class="custom-control custom-radio mb-3" id="Radio">
                  <input type="radio" class="custom-control-input" value="Non" id="customControlValidation5" name="handicap" required>
                  <label class="custom-control-label" for="customControlValidation5">Non</label>
                 </div>

            </div>
            <div class="form-group">
              <label for="Vaccin">Vacciné?</label>
              <div class="custom-control custom-radio" id="Radio">
                  <input type="radio" class="custom-control-input" value="Oui" id="customControlValidation6" name="vaccin" required>
                  <label class="custom-control-label" for="customControlValidation6">Oui</label>
                  </div>

              <div class="custom-control custom-radio mb-3" id="Radio">
                  <input type="radio" class="custom-control-input"  value="Non" id="customControlValidation7" name="vaccin" required>
                  <label class="custom-control-label" for="customControlValidation7">Non</label>
                 </div>

            </div>
            <div class="form-group" >
              <label for="Radio">Castré/sterilisée?</label>
                <div class="custom-control custom-radio" id="Radio">
                    <input type="radio" class="custom-control-input" value="Oui" id="customControlValidation8" name="cs" required>
                    <label class="custom-control-label" for="customControlValidation8">Oui</label>
                    </div>

                <div class="custom-control custom-radio mb-3" id="Radio">
                    <input type="radio" class="custom-control-input" value="Non"  id="customControlValidation9" name="cs" required>
                    <label class="custom-control-label" for="customControlValidation9">Non</label>
                   </div>
              <div class="form-group">
             		 <label for="Description">Description</label>
              		 <textarea rows="3" cols="10" class="form-control" name="Description" maxlength="120" placeholder="Description..."></textarea>
            </div>
                 <div class="form-group">
              		<label for="exampleInputEmail1">Saisir URL imge</label>
              		<input type="text"  name="image"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter url">
            </div>
				 
            

            <button type="submit" class="btn btn-info" >Valider</button>
          </form>
        </div>

      </div>
    </div>
  </div>
  <!-- info animale -->




  </body>
</html>
   <% } else { response.sendRedirect("Homeepaw.jsp?msg:sessionExpired");} %>
