<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"%>
    
    
    <%
    String email = session.getAttribute("email").toString(); 
    String status="processing";
    
    try{
    	Connection con= connectionProvider.getCon();
    	PreparedStatement ps = con.prepareStatement("update cart set status=? where email=? and status='bill'");
    	ps.setString(1,status);
    	ps.setString(2,email);
    	
    	ps.executeUpdate();
    	response.sendRedirect("home.jsp");
    	
    	
    }catch(Exception e){
    	System.out.println(e);
    	
    }

    
    %>