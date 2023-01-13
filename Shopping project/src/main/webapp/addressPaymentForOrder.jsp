<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"%>

<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 
<title>Home</title>
<script>
if(window.history.forward(1) != null)
	window.history.forward(1);
</script>

<style type="text/css">
.center {
  position: absolute;
  left: 0;
  right: 0;
  /* margin-top: 5%;  */
   margin-bottom: 5%;  
   margin-left: 5%;  
   margin-right: 5%;  
 }
 body{
    background-color:#EEC3D8 ;
 } 
 
</style>
</head>
<body>


<table class="table table-striped text-center">
<thead>
<%
  String email = (String)session.getAttribute("email"); 
  int total=0;
  int sno =0;
  try{
	  Connection con= connectionProvider.getCon();
		Statement st =con.createStatement();
		ResultSet rs1 =st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
		
		while(rs1.next())
		{
			total=rs1.getInt(1);
		}
  
  %>

          <tr>

            <th scope="col" style=" text-align: left;"><a href="myCart.jsp"><i class="fa-solid fa-circle-arrow-left"> Back</i></a></th>
           <th scope="col" style="background-color: yellow; text-align: left;">Total:  <i class="fa fa-inr"></i> <%out.println(total); %> </th>
          </tr>
        </thead>
  <thead class="table-dark">
    <tr>
		<th scope="col">Sr.No</th>
		<th scope="col">Product Name</th>
		<th scope="col">Category</th>
		<th scope="col"><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i> Price</th>
		<th scope="col">Quantity</th>
		<th scope="col">Sub Total</th>
		
    </tr>
  </thead>
  <tbody>
  <%
  ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
  
  while(rs.next())
  {
	 
   %>

  
    <tr>  
    <%sno=sno+1; %>
      <td><%out.println(sno);%></td>
      <td><%=rs.getString(2)%></td>
      <td><%=rs.getString(3)%></td>
      <td><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=rs.getString(4)%></td>
      <td ><%=rs.getString(8)%></td>
      <td><%=rs.getString(10) %></td>
      
    </tr>
       <% 
  
        }
  ResultSet rs2 = st.executeQuery("select * from users where email='"+email+"'");
  
  while(rs2.next())
  {
	  
  
  %>
  </tbody>
</table>

  <hr style="width: 100%">
	  <form class="row g-3 center" action="aPaymentOrderAction.jsp" method="post">
	   <div class="col-md-6 ">
	     <label for="inputEmail4" class="form-label">Enter Address</label>
	     <input name="address" type="text" class="form-control" id="inputEmail4" 
	     placeholder="Enter Address" value="<%=rs2.getString(7)%>" required>
	   </div>
	   <div class="col-md-6">
	     <label  class="form-label">Enter City</label>
	     <input name="city" type="text" class="form-control" 
         placeholder="Enter City" value="<%=rs2.getString(8)%>" required>
	   </div>
	  
	  <div class="col-md-6">
	     <label for="inputPassword4" class="form-label">Enter State</label>
	     <input name="state" type="text" class="form-control" 
         placeholder="Enter State" value="<%=rs2.getString(9)%>" required>
	   </div>
	   <div class="col-md-6">
	     <label for="inputCity" class="form-label">Enter Country</label>
	     <input name="country" type="text" class="form-control" id="inputCity" 
	     placeholder="Enter Country" value="<%=rs2.getString(10)%>" required>
	   </div>
	<hr style="width: 100%">   
	<div class="col-md-6">
    <label for="inputState" class="form-label">Active</label>
    <select name="paymentMethod" id="inputState" class="form-select">
      <option value="Cash on Delivery">Cash on Delivery</option>
      <option value="Online Payment">Online Payment</option>
    </select>
  </div>
  
	  <div class="col-md-6">
	     <label for="inputCity" class="form-label">Pay online on this SMG@pay.com</label>
	     <input name="transectionId" type="text" class="form-control" id="inputCity" 
	     placeholder="Enter Transection ID" required>
	   </div>
	  <hr style="width: 100%"> 
		<div class="col-md-6">
	     <label for="inputCity" class="form-label">Mobile Number</label>
	     <input name="mobileNumber" type="text" class="form-control" id="inputCity" 
	     placeholder="Enter Mobile Number" value="<%=rs2.getString(3)%>" 
	      pattern="[7-9]{1}[0-9]{9}" 
               title="Phone number start digit with 7-9 and remaing 9 digit with 0-9"
               required>
	   </div>
	   <div class="col-12" style=" text-align: center;">
	     <button type="submit" class="btn btn-primary">Proceed to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
	   </div>
	 </form>
  
   
 <% 
  }
  }
  
            catch(Exception e){
              	System.out.println(e);
              }
  %>
      
        <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
 

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 

</body>
</html>