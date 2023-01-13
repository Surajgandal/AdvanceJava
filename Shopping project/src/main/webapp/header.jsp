<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"
    %>
      
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="../css/home-style.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 
</head>
<body>




<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
<%
String email = (String)session.getAttribute("email"); 
%> 
    <a class="navbar-brand" href="#" style="font-weight: bold;color:#7C1EDB;">
      <img src="img/logo.jpg" alt="Logo" width="60" height="45" class="d-inline-block align-text-top">
     SMG
    </a>
 
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item" style="text-align:center;">
          <a style="color:#E30E52;" class="nav-link " aria-current="page" href="#"><%out.print(email);  %> <i class="fa-solid fa-user"></i></a>
        </li>
        <li class="nav-item" style="text-align:center;">
          <a class="nav-link" href="home.jsp">Home <i class="fa-solid fa-house"></i> </a>
        </li>
         <li class="nav-item" style="text-align:center;">
          <a class="nav-link" href="myCart.jsp">My Cart <i class="fa-solid fa-cart-plus"></i></a>
        </li>
         <li class="nav-item" style="text-align:center;">
          <a class="nav-link" href="myOrders.jsp">My Orders <i class="fa-solid fa-cart-shopping"></i></a>
        </li>
         <li class="nav-item" style="text-align:center;">
          <a class="nav-link" href="changeDetails.jsp">Change Details <i class="fa-solid fa-pen-to-square"></i></a>
        </li>
         <li class="nav-item" style="text-align:center; ">
          <a class="nav-link" href="messageUs.jsp">Message Us <i class="fa-solid fa-message"></i></a>
        </li>
         
        <li class="nav-item" style="text-align:center;">
          <a class="nav-link" href="logout.jsp">Logout <i class="fa-solid fa-right-from-bracket"></i></a>
        </li>
  
      </ul>
    
    <form class="d-flex" role="search" action="searchHome.jsp" method="Post">
        <input class="form-control me-2" type="text" placeholder="Search" 
        name="search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> 
    </div>
  </div>
</nav>
</body>
