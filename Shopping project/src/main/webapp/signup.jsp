
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
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
/*  body{
    background-color: #0080FF;
 } */
 
</style>
</head>
<body>
 

<div id="container" >
  <div class="signup center">
  <h4>Registration User Form</h4>
     <h6 style="color: blue; font-size:15px;">Shopping Market</h6>
    
<%
String msg =request.getParameter("msg");
if("valid".equals(msg))	
{
%>
<p style=" color:green; font-size:15px; ">Successfully Registered<p>
<%} %>

<% 
if("invalid".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; ">Some thing Went Wrong! Try Again !</p>
<%} %>
    <form action="signupAction.jsp" method="post" style="text-align:center;" >
	 <div class="form-group" style=" text-align: left; font-weight: bold;">
	    <label for="exampleInputName">Enter Name</label>
	    <input type="text" name="name" 
	           class="form-control" id="exampleInputName" 
	           placeholder="Enter name" required>
	  </div>
	  <div class="form-group " style=" text-align: left;">
	    <label for="exampleInputEmail1" style="font-weight: bold;">Enter Email</label>
	    <input type="email" name="email" 
	           class="form-control" id="exampleInputEmail1" 
	           aria-describedby="emailHelp" placeholder="Enter email" required>
	  </div>
	  <div class="form-group " style=" text-align: left; font-weight: bold;">
	    <label for="exampleInputNumber">Enter Mobile Number</label>
	    <input type="text" name="mobileNumber" 
	           class="form-control" id="exampleInputNumber" 
	           placeholder="Enter Mobile Number" 
	           pattern="[7-9]{1}[0-9]{9}" 
               title="Phone number start digit with 7-9 and remaing 9 digit with 0-9"required>
	  </div>
	 <div class="form-group " style=" text-align: left; font-weight: bold;  ">
		<select class="form-control" name="securityQuestion" style="font-weight: bold; font-style: italic;  font-size: 13px;" required>
		  <option value="What was your childhood nickname?"  >What was your childhood nickname?</option>
		  <option value="What is your favorite sport?">What is your favorite sport?</option>
		  <option value="In what city were you born?">In what city were you born?</option>
		  <option value="What was the name of your first pet?">What was the name of your first pet?</option>
		</select>
		 
		 <input type="text" name="answer" 
		           class="form-control" id="exampleInputAnswer" 
		           placeholder="Enter answer" required>
	  </div>
	  <div class="form-group " style=" text-align: left; font-weight: bold;">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" name="password" class="form-control" 
	           id="exampleInputPassword1" placeholder="Password" 
	            pattern="(?=.*\d)(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*+`~'=?\|\]\[\(\)\-<>/]).{5,}"
	           title="Must contain at least one number, one lowercase letter, one special character and at least 5 or more characters"
	            required>
	  </div>
	  
	  <button type="submit" value="signup" class="btn btn-primary">SignUp</button>
	  
	</form>
	<p style=" font-size:15px; ">Already have an account? <a style="text-decoration:none;" href="login.jsp">Login here</a></p>
 
 
 
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