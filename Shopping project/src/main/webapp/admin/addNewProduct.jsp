<%@page 
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
<!-- 
<h3 class="alert">Product Added Successfully!</h3>

<h3 class="alert">Some thing went wrong! Try Again!</h3>



  
--> 

 
  <%
  int id=1;
  try{
	  Connection con= connectionProvider.getCon();
		Statement st =con.createStatement();
		ResultSet rs =st.executeQuery("select max(id) from product");
		while(rs.next()){
			 id=rs.getInt(1);
			 id=id+1;
		}
  }
  catch(Exception e)
  {
	  
  }
  %>
  <%
String msg =request.getParameter("msg");
if("done".equals(msg))	
{
%>
<p style=" color:red; font-size:15px; margin-top:5px; text-align:center;">Product Added Successfully!<p>
<%} %>

<% 
if("wrong".equals(msg))	
{
%>
 <p style=" color:red; font-size:15px;margin-top:5px; text-align:center; ">Create New Product Name, Product Name is Already exist!!</p>
<%} %>  
 
 <form class="row g-3 center" action="addNewProductAction.jsp" method="post">

 <h3 style="  text-align: center;color:green;">Product ID:<%out.println(id); %></h3>
 <input type="hidden" name="id" value="<%out.println(id); %>">
  <div class="col-md-6 ">
    <label for="inputEmail4" class="form-label">Name</label>
    <input name="name" type="text" class="form-control" id="inputEmail4" placeholder="Enter Product Name" required>
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Category</label>
    <input name="category" type="text" class="form-control" id="inputPassword4" placeholder="Enter Category" required>
  </div>
 
  <div class="col-md-6">
    <label for="inputCity" class="form-label">Price</label>
    <input name="price" type="number" class="form-control" id="inputCity" placeholder="Enter price" required>
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


</body>
</html>