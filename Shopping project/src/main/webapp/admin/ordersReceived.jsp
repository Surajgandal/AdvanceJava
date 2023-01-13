
<%@ page 
    import="project.connectionProvider"
    import="java.sql.*"%>
    <%@include file="adminHeader.jsp" %><html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>OrdersReceived</title>


<!-- <link rel="stylesheet" href="../css/home-style.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 

</head>
<body>


<%
String msg =request.getParameter("msg");
if("cancel".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; text-align:center; ">Order Cancel Successfully!!<p>
<%} %>
<%
if("delivered".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; text-align:center;">Delivered product,Successfully  Updated!!!<p>
<%} %>

<% 
if("invalid".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; text-align:center; ">Some thing Went Wrong! Try Again !</p>
<%} %>

<div style="color: blue; text-align: center; font-size: 30px; ">Order Received <i class="fa-solid fa-box"></i></div>

  
<table class="table table-striped text-center table-bordered">
  <thead class="table-dark">
    <tr>
      <th scope="col">Mobile Number</th>
      <th scope="col">Product Name</th>
      <th scope="col">Quantity</th>
      <th scope="col"><i class="fa-sharp fa-solid fa-indian-rupee-sign "></i> Sub Total</th>
      <th>Address</th>
      <th>City</th>
      <th>State</th>
      <th>Country</th>
	  <th scope="col">Order Date</th>
  	  <th scope="col">Expected Delivery Date</th>
	  <th scope="col">Payment Method</th>
	  <th scope="col">T-ID</th>
	  <th scope="col">Status</th>
	  <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
	  <th scope="col">Order Delivered <i class='fas fa-dolly'></i></th>
    </tr>
  </thead>
  <tbody>
  <%
 
  try{
	  Connection con= connectionProvider.getCon();
		Statement st =con.createStatement();
		ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing'");
		  
		
		while(rs.next())
		{
			
  %>
  
  
    <tr> 
		<td><%=rs.getString(10)%></td>
		<td><%=rs.getString(17)%></td>
		<td><%=rs.getString(3)%></td>
		<td><i class="fa-sharp fa-solid fa-indian-rupee-sign "></i>  <%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(8)%></td>
		<td><%=rs.getString(9)%></td>
		<td><%=rs.getString(11)%></td>
		<td><%=rs.getString(12)%></td>
		<td><%=rs.getString(13)%></td>
		<td><%=rs.getString(14)%></td>
		<td><%=rs.getString(15)%></td>
		<td><a href="cancelOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Cancel <i class="fa-solid fa-square-xmark"></i></a></td>
		<td><a href="deliveredOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Delivered <i class="fa-solid fa-truck-fast"></i></a></td>
    </tr>
    <%
    }
    }catch(Exception e){
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