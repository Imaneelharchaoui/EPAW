<% if((session.getAttribute("AdminMdp"))!= null){ %>

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
      <link rel="stylesheet" type="text/css" href="NewFile3.css" >
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

        <nav class="navbar navbar-expand-md navbar-dark bg-dark  sticky-top" >
          <ul class="navbar-nav">
            <li class="navbar-item">

            <a class="nav-link text-white" href="<%= request.getContextPath()%>/HomeAdmin.jsp"><i class="fas fa-home"></i>  Home</a>
            </li>
             
	      
           
          </ul>
			 <a class="navbar-brand " id="icon1" href="#" style="margin-left:650px;"><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
      		
        </nav>
    <!-- Navigation and header -->

<!-- page content -->


   <%  
   HttpSession session1=request.getSession();
   if((session1.getAttribute("Table")).equals("Part")){ %>

<div class="p-2">
<table class="table table-sm table-dark" id="table" >
  <thead>
    <tr>
      <th scope="col" >ID</th>
      <th scope="col" colspan="2">PRENOM </th>
      <th scope="col" colspan="2">NOM</th>
      <th scope="col" colspan="2">EMAIL</th>
      <th scope="col" colspan="2">TELEPHONE</th>
      <th scope="col" colspan="2">ADRESSE</th>
      <th scope="col" colspan="2">DATE INSCR</th>
      <th scope="col" colspan="2">ACTION</th>
      
      
    </tr>
  </thead>
  <tbody>
  <%
      ArrayList<Particulier> val1= new ArrayList<Particulier>();
       val1 =(ArrayList<Particulier>) request.getAttribute("Part");
      for(int i=0;i<val1.size();i++) {
    	  
    	  
    	  %>
    <tr>
      <th scope="row"><%= val1.get(val1.size()-1-i).id %></th>
      <td colspan="2"><%= val1.get(val1.size()-1-i).prenom %></td>
      <td colspan="2"><%= val1.get(val1.size()-1-i).nom %></td>
      <td colspan="2"><%= val1.get(val1.size()-1-i).email %></td>
      <td colspan="2"><%= val1.get(val1.size()-1-i).telephone %></td>
      <td colspan="2"><%= val1.get(val1.size()-1-i).adresse %></td>
      <td colspan="2"><%= val1.get(val1.size()-1-i).date %></td>
      <td colspan="3">
      
      	<div class="btn-group text-align" >
      	<form method ="post" action="<%= request.getContextPath() %>/BANNE">
      	    <% if((val1.get(val1.size()-1-i).status).equals("0")){ %>  	
      	
      		<input id="status" name="id" type="hidden" value="<%= val1.get(val1.size()-1-i).id %>">
      		<input id="id" name="status" type="hidden" value="1">
      		<button type="submit" class="btn btn-danger" style="margin-right:10px;" >Bannir</button>	
      		
      		<% } else { %>
      		<input id="id" name="id" type="hidden" value="<%= val1.get(val1.size()-1-i).id %>">
      		<input id="status" name="status" type="hidden" value="0">
      	    <button type="submit" class="btn btn-success" style="margin-right:10px;" >Debannir</button>	
      		
      		<%} %>
		</form>
      	<form method="post" action="<%= request.getContextPath() %>/Avertir">
		  <input type="hidden" name="nom" value="<%= val1.get(val1.size()-1-i).nom %>">
		  <input type="hidden" name="email" value="<%= val1.get(val1.size()-1-i).email %>">
		  <input type="hidden" name="status" value="<%= val1.get(val1.size()-1-i).status %>">	
		   <button type="submit" class="btn btn-warning"style="margin-right:10px;"  >Avertire</button>	
		</form>
		     
  		</div>
		     
	</td>
      
      
      
    </tr>
   
     <% 
       } %>
  </tbody>
</table>
</div>
<% } else if ((session1.getAttribute("Table")).equals("Assoc")) { %>
<div class="p-2">
<table class="table table-sm table-dark" id="table1" >
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col" colspan="2">ASSOC NAME</th>
      <th scope="col" colspan="2">DOMAINE</th>
      <th scope="col" colspan="2">EMAIL</th>
      <th scope="col" colspan="2">PHONE NUMBER</th>
      <th scope="col" colspan="2">ADRESS</th>
      <th scope="col" colspan="2">DATE INSC</th>
      <th scope="col" colspan="3">ACTIONS</th>
      
      
      
    </tr>
  </thead>
  <tbody>
  <%
      ArrayList<Association> val= new ArrayList<Association>();
 		 

       val =(ArrayList<Association>) request.getAttribute("association");
      for(int i=0;i<val.size();i++) {
    	  
    	  
    	  %>
    <tr>
      <th scope="row"><%= val.get(val.size()-1-i).id %></th>
      <td colspan="2"><%= val.get(val.size()-1-i).nom %></td>
      <td colspan="2"><%= val.get(val.size()-1-i).domaine %></td>
      <td colspan="2"><%= val.get(val.size()-1-i).email %></td>
      <td colspan="2"><%= val.get(val.size()-1-i).telephone %></td>
      <td colspan="2"><%= val.get(val.size()-1-i).localisation %></td>
      <td colspan="2"><%= val.get(val.size()-1-i).date %></td>
      <td colspan="3">
      	<div class="btn-group text-align" >
		  <form method ="post" action="<%= request.getContextPath() %>/BANNEASSOC">
      	    <% if((val.get(val.size()-1-i).status).equals("0")){ %>  	
      	
      		<input id="id" name="id" type="hidden" value="<%= val.get(val.size()-1-i).id %>">
       		<input id="email" name="email" type="hidden" value="<%= val.get(val.size()-1-i).email %>">
      		
      		<input id="id" name="status" type="hidden" value="1">
      		<button type="submit" class="btn btn-danger" style="margin-right:10px;" >Bannir</button>	
      		
      		<% } else { %>
      		<input id="id" name="id" type="hidden" value="<%= val.get(val.size()-1-i).id %>">
       		<input id="email" name="email" type="hidden" value="<%= val.get(val.size()-1-i).email %>">
      		<input id="status" name="status" type="hidden" value="0">
      	    <button type="submit" class="btn btn-success" style="margin-right:10px;" >Debannir</button>	
      		
      		<%} %>
		</form>
      	<form method="post" action="<%= request.getContextPath() %>/Avertir">
		  <input type="hidden" name="nom" value="<%= val.get(val.size()-1-i).nom %>">
		  <input type="hidden" name="email" value="<%= val.get(val.size()-1-i).email %>">
	
		   <button type="submit" class="btn btn-warning"style="margin-right:10px;"  >Avertire</button>	
		</form>
		<form action="">
		  
		   <button type="button" class="btn btn-light" data-toggle="modal" data-target="#annonces<%=i %>" style="margin-right:10px;"  >Annonces</button>	
		   
		</form>
		   
				
  		</div>
		     
	</td>
      
      
    </tr>
	<!-- Modal -->
				<div class="modal fade bd-example-modal-lg" id="annonces<%=i %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header text-align">
				        <h5 class="modal-title" id="exampleModalLabel"><strong>ANNONCES DE : </strong> <%= val.get(val.size()-1-i).nom %> <br> <strong>ID : </strong> <%= val.get(val.size()-1-i).id %></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
							    <div class="container">
							    <div class="row justify-content-center" >
							      <%
							      ArrayList<Animal> val3= new ArrayList<Animal>();
							      
							
							       val3 =(ArrayList<Animal>) request.getAttribute("annonces");
							
							      for(int j=0;j<val3.size();j++) {
							    	   
							    	 if((val3.get(val3.size()-1-j).email).equals(val.get(val.size()-1-i).email)){ 
							    	  %>
							          	 	  
							      <div class="col-sm-4" style="margin-top:30px;">
							        <div class="card shadow  " style="width:15rem;height:30rem;">
							  <img class="card-img-top rounded-sm" style="height:170px;" src="<%= val3.get(val3.size()-1-j).image %>"  alt="Card image cap" />
							  <div class="card-body">
							    <h5 class="card-title" ><%= val3.get(val3.size()-1-j).espece %></h5>
							    <p class="card-text text-center"><strong>Description : </strong><%= val3.get(val3.size()-1-j).desc %></p>
							    
				    		   <form method="post" action="<%= request.getContextPath() %>/Del">
				    		  	 <button  class="btn btn-info" type="button" data-toggle="modal" data-target="#ficheanimal<%= j%>" >Voir fiche</button>
				    		   		
				    		   		<% if((val3.get(val3.size()-1-j).status).equals("0")){ %>  	
      	
								      		<input id="id" name="id" type="hidden" value="<%= val3.get(val3.size()-1-j).id %>">
								       		<input id="email" name="email" type="hidden" value="<%= val3.get(val3.size()-1-j).email %>">
								      		
								      		<input id="id" name="status" type="hidden" value="1">
								      		<button type="submit" class="btn btn-danger" ">Supprimer</button>	
								      		
								      		<% } else { %>
								      		<input id="id" name="id" type="hidden" value="<%= val3.get(val3.size()-1-j).id %>">
								       		<input id="email" name="email" type="hidden" value="<%= val3.get(val3.size()-1-j).email %>">
								      		<input id="status" name="status" type="hidden" value="0">
								      	    <button type="submit" class="btn btn-success" " >Restaurer</button>	
								      		
							      		<%} %>
				    		    </form>
							  </div>
							  <div class="card-footer">
							      <small class="text-muted">posted on : <%= val3.get(val3.size()-1-j).date %></small>
							    </div>
							</div>
				      </div>
				      <div class="modal fade" id="ficheanimal<%= j%>" tabindex="-1" role="dialog" aria-labelledby="ficheanimal" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Fiche de l'animal </h5>
						      </div>
						      <div class="modal-body">
						         <img class="card-img-top rounded-sm" style="height:250px;" src="<%= val3.get(val3.size()-1-j).image %>"  alt="Card image cap" />
						        <p class=" text-center"> <strong>RACE: </strong><%= val3.get(val3.size()-1-j).race %> </br> <strong>SEXE: </strong> <%= val3.get(val3.size()-1-j).sexe %></br><strong>AGE: </strong><%= val3.get(val3.size()-1-j).age %> MOIS
						     </br><strong>HANDICAP: </strong><%= val3.get(val3.size()-1-j).handicap %></br><strong>VACCIN: </strong> <%= val3.get(val3.size()-1-j).vaccin %> </br><strong>CASTRE/STERILISEE: </strong> <%= val3.get(val3.size()-1-j).cs %></p>
						    
						      </div>
						      
						      <div class="modal-footer">
						        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						        
						      </div>
						    </div>
						  </div>
						</div>
						

						
				            <% }} %>
				      
				    </div>
				  </div>
      
				      
				    </div>
				  </div>
				</div>
			</div>
		    <!-- Modal -->
      
     <% 
       } %>
  </tbody>
</table>
</div>
</div>
<% } else if ((session1.getAttribute("Table")).equals("Vet")) { %>
<div class="p-2">
<table class="table table-sm table-dark" id="table2" ">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col" colspan="2">CABINET</th>
      <th scope="col" colspan="2">EMAIL</th>
      <th scope="col" colspan="2">PHONE NUMBER</th>
      <th scope="col" colspan="2">AUTORISATION</th>
      <th scope="col" colspan="2">ADDRESS</th>
      <th scope="col" colspan="2">DESCRIPTION</th>    
      <th scope="col" colspan="2">DATE INSC</th>
      <th scope="col" colspan="3">ACTIONS</th>
      
      
      
    </tr>
  </thead>
  <tbody>
  <%
      ArrayList<Veterinaire> val4= new ArrayList<Veterinaire>();
 		 

       val4 =(ArrayList<Veterinaire>) request.getAttribute("veterinaire");
      for(int i=0;i<val4.size();i++) {
    	  
    	  
    	  %>
    <tr>
      <th scope="row"><%= val4.get(val4.size()-1-i).id %></th>
      <td colspan="2"><%= val4.get(val4.size()-1-i).nom %></td>   
      <td colspan="2"><%= val4.get(val4.size()-1-i).email %></td>
      <td colspan="2"><%= val4.get(val4.size()-1-i).telephone %></td>
      <td colspan="2"><%= val4.get(val4.size()-1-i).autorisation %></td>
      <td colspan="2"><%= val4.get(val4.size()-1-i).adresse %></td>
      <td colspan="2"><%= val4.get(val4.size()-1-i).description %></td>
      <td colspan="2"><%= val4.get(val4.size()-1-i).date %></td>
      <td colspan="3">
      	<div class="btn-group text-align" >
		  <form method ="post" action="<%= request.getContextPath() %>/BANNEVET">
      	    <% if((val4.get(val4.size()-1-i).status).equals("0")){ %>  	
      	
      		<input id="id" name="id" type="hidden" value="<%= val4.get(val4.size()-1-i).id %>">
       		<input id="email" name="email" type="hidden" value="<%= val4.get(val4.size()-1-i).email %>">
      		
      		<input id="id" name="status" type="hidden" value="1">
      		<button type="submit" class="btn btn-danger" style="margin-right:10px;" >Bannir</button>	
      		
      		<% } else { %>
      		<input id="id" name="id" type="hidden" value="<%= val4.get(val4.size()-1-i).id %>">
       		<input id="email" name="email" type="hidden" value="<%= val4.get(val4.size()-1-i).email %>">
      		<input id="status" name="status" type="hidden" value="0">
      	    <button type="submit" class="btn btn-success" style="margin-right:10px;" >Debannir</button>	
      		
      		<%} %>
		</form>
      	<form method="post" action="<%= request.getContextPath() %>/Avertir">
		  <input type="hidden" name="nom" value="<%= val4.get(val4.size()-1-i).nom %>">
		  <input type="hidden" name="email" value="<%= val4.get(val4.size()-1-i).email %>">
	
		   <button type="submit" class="btn btn-warning"style="margin-right:10px;"  >Avertire</button>	
		</form>
		<form action="">
		  
		   <button type="button" class="btn btn-light" data-toggle="modal" data-target="#offres<%=i %>" style="margin-right:10px;"  >Offres</button>	
		   
		</form>
		   
				
  		</div>
		     
	</td>
      
      
    </tr>
	<!-- Modal -->
				<div class="modal fade bd-example-modal-lg" id="offres<%=i %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header text-align">
				        <h5 class="modal-title" id="exampleModalLabel"><strong>OFFRE DE : </strong> <%= val4.get(val4.size()-1-i).nom %> <br> <strong>ID : </strong> <%= val4.get(val4.size()-1-i).id %></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
							    <div class="container">
							    <div class="row justify-content-center" >
							      <%
							      ArrayList<Offre> val5= new ArrayList<Offre>();
							      
							
							       val5 =(ArrayList<Offre>) request.getAttribute("offres");
							
							      for(int j=0;j<val5.size();j++) {
							    	   
							    	 if((val5.get(val5.size()-1-j).email).equals(val4.get(val4.size()-1-i).email)){ 
							    	  %>
							          	 	  
							      <div class="col-sm-4" style="margin-top:30px;">
							        <div class="card shadow  " style="width:15rem;height:30rem;">
							  <img class="card-img-top rounded-sm" style="height:170px;" src="https://d2g8igdw686xgo.cloudfront.net/18558218_1488311282.064.jpg"  alt="Card image cap" />
							  <div class="card-body">
							    <h5 class="card-title" ><%= val5.get(val5.size()-1-j).type %></h5>
							    <p class="card-text text-center"><strong>Description : </strong><span class="d-inline-block text-truncate" style="max-width: 200px;"><%= val5.get(val5.size()-1-j).description %></span></p>
							    
				    		   <form method="post" action="<%= request.getContextPath() %>/DelOffre">
				    		  	 <button  class="btn btn-info" type="button" data-toggle="modal" data-target="#ficheoffre<%= j%>" >Voir fiche</button>
				    		   		
				    		   		<% if((val5.get(val5.size()-1-j).status).equals("0")){ %>  	
      	
								      		<input id="id" name="id" type="hidden" value="<%= val5.get(val5.size()-1-j).id %>">
								       		<input id="email" name="email" type="hidden" value="<%= val5.get(val5.size()-1-j).email %>">
								      		
								      		<input id="id" name="status" type="hidden" value="1">
								      		<button type="submit" class="btn btn-danger" ">Supprimer</button>	
								      		
								      		<% } else { %>
								      		<input id="id" name="id" type="hidden" value="<%= val5.get(val5.size()-1-j).id %>">
								       		<input id="email" name="email" type="hidden" value="<%= val5.get(val5.size()-1-j).email %>">
								      		<input id="status" name="status" type="hidden" value="0">
								      	    <button type="submit" class="btn btn-success" " >Restaurer</button>	
								      		
							      		<%} %>
				    		    </form>
							  </div>
							  <div class="card-footer">
							      <small class="text-muted">posted on : <%= val5.get(val5.size()-1-j).date %></small>
							    </div>
							</div>
				      </div>
				      <div class="modal fade" id="ficheoffre<%= j%>" tabindex="-1" role="dialog" aria-labelledby="ficheanimal" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-paw fa-1x" id="logo"></i> Fiche de l'offre </h5>
						      </div>
						      <div class="modal-body">
						        <p class=" text-center"> <strong>TYPE : </strong><%= val5.get(val5.size()-1-j).type %> </br> <strong>TARIF : </strong> <%= val5.get(val5.size()-1-j).tarification %></br><strong> DESCRIPTION: </strong><%= val5.get(val5.size()-1-j).description %> 
						     </br><strong>EMAIL : </strong><%= val5.get(val5.size()-1-j).email %></br><strong>TELEPHONE : </strong> <%= val5.get(val5.size()-1-j).telephone %> </br></p>
						    
						      </div>
						      
						      <div class="modal-footer">
						        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						        
						      </div>
						    </div>
						  </div>
						</div>
						

						
				            <% }} %>
				      
				    </div>
				  </div>
      
				      
				    </div>
				  </div>
				</div>
			</div>
		    <!-- Modal -->
      
     <% 
       } %>
  </tbody>
</table>
</div>
<% }  %>

<!-- page content -->

  


  </body>
</html>
    <% } else { response.sendRedirect("ConnexionAdmin.jsp?msg:loginfailed");} %>
   