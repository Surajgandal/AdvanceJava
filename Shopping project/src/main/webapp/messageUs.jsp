<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"
    %>
  <%@include file="header.jsp" %>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 
 <style type="text/css">
.center {
  position: absolute;
  left: 0;
  right: 0;
  margin-top: 0%; 
   margin-bottom: 50%;  
   margin-left: 10%;  
   margin-right: 10%;  
 }
/*  body{
    background-color: #0080FF;
 } */
 
</style>
<title>Message Us</title>
</head>
<body>





<form class="row g-3 center" action="messageUsAction.jsp" method="post">
<%
String msg =request.getParameter("msg");
if("valid".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; text-align:center;">Thank you for reaching out. I can certainly help you with that!<p>
<%} %>

<% 
if("invalid".equals(msg))	
{
%>
<p style=" color:red; font-size:15px;text-align:center; ">Some thing Went Wrong! Try Again!</p>
<%} %>



	   <div class="col-md-12 " style=" text-align: left; font-weight: bold;">
	      <label for="inputEmail4" class="form-label">Subject</label>
	     <input name="subject" type="text" class="form-control" id="inputEmail4" 
	     placeholder="Subject"  required>
	   </div>
	 
	   <div class="col-md-12" style="font-weight: bold; resize:none;">
	      <div class="mb-3">
		    <label for="validationTextarea" class="form-label">Enter Message </label>
		    <textarea style="height:250px; width: 100%;resize:none;" 
		    class="form-control" id="validationTextarea" 
		    placeholder="Enter Message Here..." 
		    name="body" required></textarea>
		   
		   </div>
	   </div>
  
  <div class="col-12" style=" text-align: center;">
    <button type="submit" class="btn btn-primary">Save <i class='far fa-arrow-alt-circle-right'></i></button>
  </div>
</form>


<!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
 

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 

</body>
</html>