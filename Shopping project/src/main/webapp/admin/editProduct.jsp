<%@ page 
    import="project.connectionProvider"
    import="java.sql.*"%>
    <%@include file="adminHeader.jsp" %>
<html>
<head>

<title>Add New Product</title>
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
</head>
<body>
<!--  <h2><a class="back" href="allProductEditProduct.jsp"><i class="fa-solid fa-backward"></i></a></h2> -->
 <%
 
 String id=request.getParameter("id");
  try{
	  Connection con= connectionProvider.getCon();
		Statement st =con.createStatement();
		ResultSet rs =st.executeQuery("select * from product where id='"+id+"'");


		while(rs.next())
		{


%>

 
  <form class="row g-3 center" action="editProductAction.jsp" method="post">
 <h2 ><a style="text-decoration: none; " class="back" href="allProductEditProduct.jsp"><i class="fa-solid fa-circle-left"></i> Back</a></h2>
 <h3 style="  text-align: center;color:green;">Product ID:<%out.println(id); %></h3>
 <input type="hidden" name="id" value="<%out.println(id); %>">
  <div class="col-md-6 ">
    <label for="inputEmail4" class="form-label">Name</label>
    <input name="name" type="text" class="form-control" id="inputEmail4" 
    placeholder="Enter Product Name" value="<%=rs.getString(2)%>" required>
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Category</label>
    <input name="category" type="text" class="form-control" id="inputPassword4" 
    placeholder="Enter Category" value="<%=rs.getString(3)%>" required>
  </div>
 
  <div class="col-md-6">
    <label for="inputCity" class="form-label">Price</label>
    <input name="price" type="number" class="form-control" id="inputCity" 
    placeholder="Enter price" value="<%=rs.getString(4)%>" required>
  </div>
  <div class="col-md-6">
    <label for="inputState" class="form-label">Active</label>
    <select name="active" id="inputState" class="form-select">
      <option value="Yes">Yes</option>
      <option value="No">No</option>
    </select>
  </div>
 
  <div class="col-12" style=" text-align: center;">
    <button type="submit" class="btn btn-primary">Save <i class='far fa-arrow-alt-circle-right'></i></button>
  </div>
</form>

<%
		}
  }catch(Exception e)
  {
	  System.out.println(e);
  }
%>

</body>
<br><br><br>
</body>
</html>