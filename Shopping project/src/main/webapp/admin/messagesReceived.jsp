<%@page 
    import="project.connectionProvider"
    import="java.sql.*"%>
    <%@include file="adminHeader.jsp" %><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>

<!-- <link rel="stylesheet" href="../css/home-style.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


</head>
<body>

 <div style="color: blue; text-align: center; font-size: 30px;">Message Received <i class="fa-solid fa-message"></i></div>
     
<table class="table table-striped text-center">
  <thead class="table-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Email</th>
      <th scope="col">Subject</th>
      
      <th scope="col">Body</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  try{
	  Connection con= connectionProvider.getCon();
		Statement st =con.createStatement();
		ResultSet rs =st.executeQuery("select * from message");
		
		while(rs.next())
		{
  %>
  
  
    <tr>
      
      <td><%=rs.getString(1)%></td>
      <td><%=rs.getString(2)%></td>
      <td><%=rs.getString(3)%></td>
     
      <td><%=rs.getString(4)%></td>
     
      
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