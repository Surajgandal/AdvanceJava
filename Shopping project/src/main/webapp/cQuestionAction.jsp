<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"%>

    
    <%
    String email = session.getAttribute("email").toString(); 
    String securityQuestion=request.getParameter("securityQuestion");
    String newAnswer=request.getParameter("newAnswer");
    String password=request.getParameter("password");
    int c=0;

    try{
    	Connection con= connectionProvider.getCon();
    	Statement st =con.createStatement();
    	ResultSet rs =st.executeQuery("select * from users where email='"+email+"' and password='"+password+"' ");
    	
    	while(rs.next()){
    		c=1;
    		st.executeUpdate("update users set securityQuestion='"+securityQuestion+"', answer='"+newAnswer+"' where email='"+email+"'");
    		
    		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");	
    	}
    	if(c==0){
    		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");	
    	}
    	
    	
    }catch(Exception e){
  		System.out.println(e);
  		
  	}
    
    %>