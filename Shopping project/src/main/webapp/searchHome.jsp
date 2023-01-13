
<%@ page 
    import="project.connectionProvider"
    import="java.sql.*"%>
    <%@include file="header.jsp" %>

<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 
<title>Home</title>
</head>
<body>

      <div style="color: blue; text-align: center; font-size: 30px;">Home <i class="fa-solid fa-house"></i></div>     
<table class="table table-striped text-center">
  <thead class="table-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Category</th>
      <th scope="col"><i class="fa-sharp fa-solid fa-indian-rupee-sign "></i> Price</th>
      <th  scope="col">Add to Cart <i class="fa-solid fa-cart-plus"></i></th>
    </tr>
  </thead>
  <tbody>
  <%
  int z=0;
  try{
	  String search=request.getParameter("search");
	  Connection con= connectionProvider.getCon();
		Statement st =con.createStatement();
		ResultSet rs =st.executeQuery("select * from product where name like '"+search+"' or category like '"+search+"' and active='Yes'");
		
		while(rs.next())
		{
			z=1;
  %>
  
  
    <tr>
      
      <td><%=rs.getString(1)%></td>
      <td><%=rs.getString(2)%></td>
      <td><%=rs.getString(3)%></td>
      <td><i class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=rs.getString(4)%></td>
      <td ><a style="text-decoration:none;" href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to Cart <i class="fa-solid fa-cart-plus"></i></a></td>
      
    </tr>
    <%
    }
    }catch(Exception e){
    	System.out.println(e);
    }
    %>
  </tbody>
</table>

<%if(z==0){ %>
<h1 style="color:red; text-align: center;">Nothing to show</h1>

<%} %>
   <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
 

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 

</body>
</html>