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
			 <a class="navbar-brand ml-auto" id="icon1" href="#"><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
      		
        </nav>
    <!-- Navigation and header -->

<!-- page content -->
<div class="container d-flex flex-column">
<div class="p-2 text-center">
<form action="">
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
  <label class="btn btn-secondary active " id="part">
    <input type="radio" name="options"  autocomplete="off"     checked> Particuliers
  </label>
  <label class="btn btn-secondary" id="assoc">
    <input type="radio" name="options" id="option2" autocomplete="off"> Associations
  </label>
  <label class="btn btn-secondary">
    <input type="radio" name="options" id="option3" autocomplete="off"> Veterinaires
  </label>
</div>
</form>
</div>

<div class="p-2">
<table class="table table-sm table-dark" id="table" ">
  <thead>
    <tr>
      <th scope="col" >ID</th>
      <th scope="col" colspan="2">EMETTEUR </th>
      <th scope="col" colspan="2">OBJET</th>
      <th scope="col" colspan="2">CORPS</th>
      <th scope="col" colspan="3">ACTION</th>
      
      
      
      
    </tr>
  </thead>
  <tbody>
  <%
      ArrayList<Reclamation> val1= new ArrayList<Reclamation>();
       val1 =(ArrayList<Reclamation>) request.getAttribute("recl");
      for(int i=0;i<val1.size();i++) {
    	  
    	  
    	  %>
    <tr>
      <th scope="row"><%= val1.get(val1.size()-1-i).id %></th>
      <td colspan="2"><%= val1.get(val1.size()-1-i).email %></td>
      <td colspan="2"><%= val1.get(val1.size()-1-i).objet %></td>
      <td colspan="2" ><span class="d-inline-block text-truncate" style="max-width: 200px;"><%= val1.get(val1.size()-1-i).message %></span></td>
      <td colspan="3">
      
   <div class="btn-group text-align" >     		
   		<button type="submit" class="btn btn-success" style="margin-right:10px;" data-toggle="modal" data-target="#content<%=i %>" ><i class="far fa-eye"></i> Voir Reclamation</button>		    		
 		<form method ="post" action="<%= request.getContextPath()%>/DeleteRecl">
	      	<input id="status" name="id" type="hidden" value="<%= val1.get(val1.size()-1-i).id %>">
	      	<input id="id" name="status" type="hidden" value="1">		  
		   <button type="submit" class="btn btn-light"style="margin-left:10px;" ><i class="fas fa-trash" ></i> Supprimer</button>	
   		</form>
	     
  	</div>
	</td>   
 </tr>
   <!-- Modal content -->
  <div class="modal fade" id="content<%=i %>" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header ">
        <h5 class="modal-title"><strong>EMETTEUR :</strong> <%= val1.get(val1.size()-1-i).email %> <br>  <strong>OBJET :</strong>  <%= val1.get(val1.size()-1-i).objet %> </h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h5><strong>CORPS :</strong> </h5>
      	
        <p><%= val1.get(val1.size()-1-i).message %></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary">OK</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
   	
   <!-- Modal content -->
   
     <% 
       } %>
  </tbody>
</table>
</div>
<div class="p-2">
<table class="table table-sm table-dark" id="table1" style="display:none;">
  <thead>
    <tr>
      <th scope="col" >ID</th>
      <th scope="col" colspan="2">EMETTEUR </th>
      <th scope="col" colspan="2">OBJET</th>
      <th scope="col" colspan="2">CORPS</th>
      <th scope="col" colspan="3">ACTION</th>
      
      
      
      
    </tr>
  </thead>
  <tbody>
  <%
      ArrayList<Reclamation> val2= new ArrayList<Reclamation>();
       val2 =(ArrayList<Reclamation>) request.getAttribute("reclAssoc");
      for(int i=0;i<val2.size();i++) {
    	  
    	  
    	  %>
    <tr>
      <th scope="row"><%= val2.get(val2.size()-1-i).id %></th>
      <td colspan="2"><%= val2.get(val2.size()-1-i).email %></td>
      <td colspan="2"><%= val2.get(val2.size()-1-i).objet %></td>
      <td colspan="2" ><span class="d-inline-block text-truncate" style="max-width: 200px;"><%= val2.get(val2.size()-1-i).message %></span></td>
      <td colspan="3">
      
   <div class="btn-group text-align" >     		
   		<button type="submit" class="btn btn-success" style="margin-right:10px;" data-toggle="modal" data-target="#contentAssoc<%=i %>" ><i class="far fa-eye"></i> Voir Reclamation</button>		    		
 		<form method ="post" action="<%= request.getContextPath()%>/DeleteReclAssoc">
	      	<input id="status" name="id" type="hidden" value="<%= val2.get(val2.size()-1-i).id %>">
	      	<input id="id" name="status" type="hidden" value="1">		  
		   <button type="submit" class="btn btn-light"style="margin-left:10px;"><i class="fas fa-trash" ></i> Supprimer</button>	
   		</form>
	     
  	</div>
	</td>   
 </tr>
   <!-- Modal content -->
  <div class="modal fade" id="contentAssoc<%=i %>" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header ">
        <h5 class="modal-title"><strong>EMETTEUR :</strong> <%= val2.get(val2.size()-1-i).email %> <br>  <strong>OBJET :</strong>  <%= val2.get(val2.size()-1-i).objet %> </h5>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h5><strong>CORPS :</strong> </h5>
      	
        <p><%= val2.get(val2.size()-1-i).message %></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary">OK</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
   	
   <!-- Modal content -->
   
     <% 
       } %>
  </tbody>
</table>
</div>

</div>



<!-- page content -->

  
<script >
$(document).ready(function(){
	$("#part").click(function(){
		$("#table").show();
		$("#table1").hide();

		
	})
	$("#assoc").click(function(){
		$("#table1").show();
		$("#table").hide();

	})
})
</script>


  </body>
</html>
    <% } else { response.sendRedirect("ConnexionAdmin.jsp?msg:loginfailed");} %>
   