
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*" %>
    <%@include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 
<title>My Cart</title>

</head>
<body>

 <%
String msg =request.getParameter("msg");
if("notPossible".equals(msg))	
{
%>
<p style=" color:red; font-size:15px;text-align:center; ">There is only one Quantity! So click on remove!<p>
<%} %>

<% 
if("inc".equals(msg))	
{
%>
<p style=" color:red; font-size:15px;text-align:center; ">Quantity  Increased Successfully!</p>
<%} %>
<% 
if("dec".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; text-align:center;">Quantity  Decreased Successfully!</p>
<%} %>
<% 
if("removed".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; text-align:center;">Product Successfully Removed!</p>
<%} %>
    
    
   <div style="color: blue; text-align: center; font-size: 30px;">My Cart <i class="fa-solid fa-cart-plus"></i></div>     
<table class="table table-striped text-center">
<thead>
  <%
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
            <th scope="col" style="background-color: yellow; text-align: left;">Total:  <i class="fa fa-inr"></i> <%out.println(total); %> </th>
            <%if(total>0){ %><th scope="col" style="background-color: #6DFF02; "><a style="text-decoration:none; color:#E30E52;" href="addressPaymentForOrder.jsp">Proceed to order <i class="fa-solid fa-cart-plus"></i></a></th>
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
		<th scope="col">Remove <i class="fa-solid fa-trash-can"></i></th>
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
      <td ><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class="fa-solid fa-circle-plus"></i></a>  <%=rs.getString(8)%>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class="fa-solid fa-circle-minus"></i></a></td>
      <td><%=rs.getString(10) %></td>
      <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>"><i class="fa-solid fa-trash-can"></i></a></td>
    </tr>
 <% 
  }
            }
  }
  
            catch(Exception e){
              	System.out.println(e);
              }
  %>
  </tbody>
</table>
      
      
        <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
 

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 

</body>
</html>