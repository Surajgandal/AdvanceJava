<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style type="text/css">
.center {
  position: absolute;
  left: 0;
  right: 0;
  margin: auto;  
 }
/*  body{
    background-color: #0080FF;
 } */
 
</style>

</head>
<body>

<div id="container" >
  <div class="signup center">
  <h4>Create New Password</h4>
     <h6 style="color: blue; font-size:15px;">Shopping Market</h6>
    
<%
String msg =request.getParameter("msg");
if("done".equals(msg))	
{
%>
<p style=" color:green; font-size:15px; ">New Password Changed Successfully!<p>
<%} %>

<% 
if("invalid".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; ">Some thing Went Wrong! Try Again !</p>
<%} %>
    <form action="forgotPasswordAction.jsp" method="post" style="text-align:center;" >

	
	  <div class="form-group " style=" text-align: left;">
	    <label for="exampleInputEmail1" style="font-weight: bold;">Enter Email</label>
	    <input type="email" name="email" 
	           class="form-control" id="exampleInputEmail1" 
	           aria-describedby="emailHelp" placeholder="Enter email" required>
	  </div>

	  <div class="form-group " style=" text-align: left; font-weight: bold;">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" name="newPassword" class="form-control" 
	           id="exampleInputPassword1" placeholder="Enter your New Password to set" 
	            pattern="(?=.*\d)(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*+`~'=?\|\]\[\(\)\-<>/]).{5,}"
	           title="Must contain at least one number, one lowercase letter, one special character and at least 5 or more characters"
	            required>
	  </div>
	  
	  <button type="submit" value="Save" class="btn btn-primary">Save</button>
	  
	</form>
	<p style=" font-size:15px; ">Already have an account? <a href="login.jsp">Login here</a></p>
 
 </div>
</div>

 <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
 

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
</body>
</html>