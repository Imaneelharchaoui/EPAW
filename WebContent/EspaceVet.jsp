<% if( (session.getAttribute("TYPE")) != null  && (session.getAttribute("TYPE")).equals("Vet")){ %>

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
            <a class="nav-link text-white " href="#"><i class="fas fa-envelope"></i>  Contact us</a>
            </li>
          </ul>
          <a class="navbar-brand ml-auto" id="icon1" href="#"><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
        </nav>
    <!-- Navigation and header -->
    <!-- page content -->
    <div class="jumbotron pm-tile " id="jumbotron2" style="height:400px;">
      <div class="d-flex  flex-column container-fluid">
        <h1 class="text-center" id="jumbtitle" >Bienvenue dans l'espace VETERINAIRES de E-paw</h1>
        <p class="text-center" id="text2"> Veuillez choisir une action s'il vous plait  </p>
        <a href="<%=request.getContextPath()%>/MesOffres" ><button class="btn btn-outline-info"  id="centrebtn3" type="button" name="button1"> Mes offres</button></a>
        <button class="btn btn-outline-info" href="#formulaireannonces" data-toggle="modal" data-target="#formulaireannonces"  id="centrebtn1" type="button" name="button2">Déposer une offre de soin </button>

      </div>

    </div>
<div class="d-flex  flex-column container-fluid" style="margin-top:30px"id="div1" >
      <div class="row" >
          <div class="col-sm-4" id="text1">

              <p>Deposez vos annonces d'adoptions et recevez des dizaines de demande d'adoption par jours! <i class="fas fa-cat"></i> <i class="fas fa-dog"></i></p>
              <button class="btn btn-info"type="button" name="button" >Deposer une annonce</button>
          </div>
          <div class="col-sm-4 " id="text1">
            <p>Visitez la section veterinaire pour profiter des reductions et des offres de soins proposees par les veterinaires membres de <span id="icon1"><i class="fas fa-paw fa-xl" ></i> E-PAW </span><i class="fas fa-syringe"></i> </p>
            <button class="btn btn-info"type="button" name="button">Visiter</button>
          </div>
          <div class="col-sm-4 " id="text1">
            <p>Consultez a tout moment les annonces que vous deposez pour  pouvoir les supprimer ou les modifier </p>
            <button class="btn btn-info"type="button" name="button">Mes Annonces</button>
          </div>
      </div>
</div>
   
<!-- page content -->

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
          <form method="post"  action="<%= request.getContextPath() %>/AjoutOffre">
            <div class="form-group">
              <label for="exampleInputEmail1">Type offre :</label>
              <input type="text" class="form-control" name="type"  placeholder="Saisir offre">
            </div>
            <div class="form-group">
              <label for="race">Tarification :</label>
              <input type="text" class="form-control" id="race" name="tarification" placeholder="ex : prix-gratuit">
            </div>
            <div class="form-group">
            
              <label for="Description">Description</label>
              <textarea rows="3" cols="10" class="form-control" name="Description" maxlength="255" placeholder="Description..."></textarea>
            </div>
            <input type="hidden" name="telephone" value="${sessionScope.telephone }">	 
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
