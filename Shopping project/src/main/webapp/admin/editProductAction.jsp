<%@ page import="project.connectionProvider"
    import="java.sql.*"%>
    <%@include file="adminHeader.jsp" %>
    
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");

try{
	Connection con= connectionProvider.getCon();
	Statement st =con.createStatement();
	st.executeUpdate("update product set name='"+name+"', category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	
if(active.equals("No")){
	st.executeUpdate("delete from cart where product id='"+id+"' and address is null");
}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}

%>    