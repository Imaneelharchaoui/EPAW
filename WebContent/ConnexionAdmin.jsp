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
      <link rel="stylesheet" type="text/css" href="NewFile4.css" >
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

            <a class="nav-link text-white" href="#"><i class="fas fa-home"></i>  Home</a>
            </li>
	       
	        
          </ul>
			 <a class="navbar-brand ml-auto" id="icon1" href="#"><i class="fas fa-paw fa-xl" ></i>  E-paw</a>
      		
        </nav>
    <!-- Navigation and header -->

<!-- page content -->
<div class="container" style="margin-top:30px;">

		
		<div class="row">
			<div class="col-12 text-center " >
				<p id="text1">Saisissez le code ADMIN pour acceder a la session :</p>
			</div>
		</div>
			
		<div class="row ">
			<div class="col-4 offset-4  form-group" >
			<form action="<%=request.getContextPath() %>/ConnAdmin" method="post">
			<input type="password" name="AdminMdp" class="form-control">
			</form>
			</div>
		</div>
		
		
			
		</div>

</div>
<!-- page content -->


  </body>
</html>
    