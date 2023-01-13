
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css"> 
<title>Login</title>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style type="text/css">
.center {
  position: absolute;
  left: 0;
  right: 0;
  margin: auto;  
 }
 
 /*
[type=text],[type=email],[type=number],[type=password],select,option {
  display: block;
  margin: 0 auto;
  width: 80%;
  border: 0;
  border-bottom: 1px solid rgba(0,0,0,.2); 
  height: 45px;
  line-height: 45px;  
  margin-bottom: 10px;
  font-size: 1em;
  color: black;
}

[type=submit] {
  margin-top: 25px;
  width: 80%;
  border: 0;
  
  border-radius: 5px;
  height: 50px;
  color: white;
  
  font-size: 1em;
}

#container {
  width: 840px;
  margin: 25px auto;
  margin-top: 50px;
}
 .signup {
  float: left;
  width: 300px;
  padding: 30px 20px;
  background-color: white;
  text-align: center;
  border-radius: 5px 0 0 5px;
}


  body{
    background-color: #0080FF;
 } */
 
</style>

</head>
<body>


<div id="container" >
  <div class="signup center">
  <h4>Login User</h4>
     <h6 style="color: blue; font-size:15px;">Shopping Market</h6>
    
<%
String msg =request.getParameter("msg");
if("notexist".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; ">Incorrect Username or Password<p>
<%} %>

<% 
if("invalid".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; ">Some thing Went Wrong! Try Again !</p>
<%} %>



    <form action="loginAction.jsp" method="post" style="text-align:center;" >
	 
	  <div class="form-group " style=" text-align: left;">
	    <label for="exampleInputEmail1" style="font-weight: bold;">Enter Email</label>
	    <input type="email" name="email" 
	           class="form-control" id="exampleInputEmail1" 
	           aria-describedby="emailHelp" placeholder="Enter email" required>
	  </div>
	  <div class="form-group " style=" text-align: left; font-weight: bold;">
	    <label for="exampleInputPassword1" style="font-weight: bold;">Password</label>
	    <input type="password" name="password" class="form-control" 
	           id="exampleInputPassword1" placeholder="Password" 
	            pattern="(?=.*\d)(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*+`~'=?\|\]\[\(\)\-<>/]).{5,}"
	           title="Must contain at least one number, one lowercase letter, one special character and at least 5 or more characters"
	            required>
	  </div>
	  
	  <button type="submit" value="login" class="btn btn-primary">login</button>
	  
	</form>
	<div class="form-group" style=" margin-top:10px;">
	<p style=" font-size:15px; "><a style="text-decoration:none;"href="forgotPassword.jsp">Forgot Password?</a></p>
	<p style=" font-size:15px; ">	Don't have an account? <a style="text-decoration:none;" href="signup.jsp">SignUp here</a></p>
 </div>
   
       
 
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