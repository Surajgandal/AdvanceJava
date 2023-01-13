<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"
    %>
      <%@include file="changeDetailsHeader.jsp" %>
<html>
<head>
<!-- <link rel="stylesheet" href="css/changeDetails.css"> -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 
 <style type="text/css">
.center {
  position: absolute;
  left: 0;
  right: 0;
  margin-top: 5%; 
   margin-bottom: 50%;  
   margin-left: 10%;  
   margin-right: 10%;  
 }
/*  body{
    background-color: #0080FF;
 } */
 
</style>
<title>ChangeSecurityQuestion</title>
</head>
<body>


 <form class="row g-3 center" action="cQuestionAction.jsp" method="post">
<%
String msg =request.getParameter("msg");
if("done".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; text-align:center;">Your security Question Successfully changed!!<p>
<%} %>

<% 
if("wrong".equals(msg))	
{
%>
<p style=" color:red; font-size:15px;text-align:center; ">Your Password is wrong!</p>
<%} %>



	   <div class="col-md-6 " style=" text-align: left; font-weight: bold;">
	     <select class="form-control" name="securityQuestion" style="font-weight: bold; font-style: italic;  font-size: 15px;" required>
		  <option value="What was your childhood nickname?"  >What was your childhood nickname?</option>
		  <option value="What is your favorite sport?">What is your favorite sport?</option>
		  <option value="In what city were you born?">In what city were you born?</option>
		  <option value="What was the name of your first pet?">What was the name of your first pet?</option>
		</select>
		 
		 <input style="background-color:#A9F8F8  ;" type="text" name="newAnswer" 
		           class="form-control" id="exampleInputAnswer" 
		           placeholder="Enter Your New answer" required>
	   </div>
	 
	   <div class="col-md-6" style="font-weight: bold; ">
	     <label for="exampleInputPassword1">Password</label>
	    <input type="password" name="password" class="form-control" 
	           id="exampleInputPassword1" placeholder="Password" 
	            pattern="(?=.*\d)(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*+`~'=?\|\]\[\(\)\-<>/]).{5,}"
	           title="Must contain at least one number, one lowercase letter, one special character and at least 5 or more characters"
	            required>
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