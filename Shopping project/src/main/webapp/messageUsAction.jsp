<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"%>

    
    <%
    String email = session.getAttribute("email").toString(); 
    String subject=request.getParameter("subject");
    String body=request.getParameter("body");
  
   

    try{
    	Connection con= connectionProvider.getCon();

    	PreparedStatement ps = con.prepareStatement("insert into message(email,subject,body) values(?,?,?)");
    	ps.setString(1,email);
    	ps.setString(2,subject);
    	ps.setString(3,body);
    	
    	ps.executeUpdate();
    	response.sendRedirect("messageUs.jsp?msg=valid");
    	
    	
    	
    }catch(Exception e){
  		System.out.println(e);
  		response.sendRedirect("messageUs.jsp?msg=invalid");
  		
  	}
    
    %>