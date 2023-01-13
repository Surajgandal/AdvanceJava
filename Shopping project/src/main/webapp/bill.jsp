<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"%>
<html>
<head>

<title>Bill</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <style type="text/css">
 body{
    background-color: #FDEF97  ;
 </style>
</head>
<body>

<%
String email = (String)session.getAttribute("email"); 

try{
	int total=0;
	int sno =0;

	  Connection con= connectionProvider.getCon();
		Statement st =con.createStatement();
      ResultSet rs1 =st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
		
		while(rs1.next())
		{
			total=rs1.getInt(1);
		}
		
	 ResultSet rs = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
		  
    while(rs.next())
		  {
%>

<div class="row">
        <div class="col-xs-12">
    		<div class="col-md-12" >
    			<div style="text-align:center;"><p class="navbar-brand" style="font-weight: bold;color:#7C1EDB;">
      <img src="img/logo.jpg" alt="Logo" width="60" height="45" class="d-inline-block align-text-top">
     SMG
    </p><h3 >InvoiceOrder # 12345</h3></div>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-md-5" style="margin-left:2%;">
    				<!-- <address>px
    				<strong>Billed To:</strong><br> -->
    				<div><strong>Billed To:</strong></div>
    					<div><p>Name: <%=rs.getString(1)%> <p></div>
    					<div><p>Email: <%out.println(email); %> </p></div>
    					<div><p>Address: <%=rs.getString(16)%> </p></div>
    					<div><p>Country: <%=rs.getString(19)%> </p></div>
    					<div><p>State:  <%=rs.getString(18)%></p></div>
    					<div><p>City:  <%=rs.getString(17)%></p></div>
    					<div><p>Mobile Number:  <%=rs.getString(20)%> </p></div>
    				<!-- </address> -->
    			</div>
    			<div class="col-md-6"  >
    				<!-- <address >
        			<strong>Shipped To:</strong><br> -->
        			<div><strong>Shipped To:</strong></div>
    					<div><p>Name:  <%=rs.getString(1)%><p></div>
    					<div><p>Address: <%=rs.getString(16)%> </p></div>
    					<div><p>State: <%=rs.getString(18)%> </p></div>
    					<div><p>City:  <%=rs.getString(17)%></p></div>
    				<!-- </address> -->
    				
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-md-5" style="margin-left:2%;">
    				<!-- <address>
    					<strong>Payment Method:</strong><br>
    					Visa ending **** 4242<br>
    					jsmith@email.com
    				</address> -->
    				<div><strong>Payment : </strong></div>
    					<div><p>Payment Method: <%=rs.getString(23)%>  <p></div>
    					<div><p>Transaction Id: <%=rs.getString(24)%> </p></div>
    			</div>
    			<div class="col-md-3 text-right">
    			
    					<div><strong>Order Date:</strong></div>
    					<div><%=rs.getString(21)%><br></div>
    				
    			</div>
    			<div class="col-md-3 text-right">
    				
    					<div><strong>Expected Delivery:</strong><br></div>
    					<div><%=rs.getString(22)%><br></div>
    				
    			</div>
    		</div>
    	</div>
    </div>
<%break;} %>
<h3 style="text-align:center;">Product Details</h3>
<table class="table  text-center ">
<thead class="table-light">
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
  ResultSet rs2 = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
  
  while(rs2.next())
  {
	 sno=sno+1;
   %> 
    <tr>  
  
      <td><%out.println(sno); %></td>
      <td><%=rs2.getString(17)%></td>
      <td><%=rs2.getString(18)%></td>
      <td><%=rs2.getString(19)%></td>
      <td ><%=rs2.getString(3)%></td>
      <td><%=rs2.getString(5)%></td>
      
    </tr>
    <tr>
    
    <%break;} %>
       <td class="no-line"></td>
       <td class="no-line"></td>
       <td class="no-line"></td>
       <td class="no-line"></td>
       <td class="no-line text-center"><strong>Total</strong></td>
    	<td class="no-line text-right"><%out.println(total); %></td>
    </tr>

  </tbody>
</table>




<div class="container" style="margin-bottom:10%">
    <div class="row">
      <div class="col-lg-6">
        <a href="continueShopping.jsp"><button class="btn  btn-primary form-control  btn-block" >Continue Shopping</button></a></div>
      <div class="col-lg-6">
        <a onclick="window.print();"><button id="btnSubmit" class="btn btn-danger form-control btn-block" type="submit">Print</button></a>
        </div>
    </div>
  </div>

 <% 
  
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