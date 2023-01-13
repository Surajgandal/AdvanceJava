<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="project.connectionProvider"
    import="java.sql.*"%>

<%

String email=request.getParameter("email");
String password=request.getParameter("password");
if("adminsuraj@gmail.com".equals(email) && "admin@123".equals(password)){
	session.setAttribute("email",email);
	//session.setAttribute(email,"email");
	response.sendRedirect("admin/adminHome.jsp");
}
else{
	int z=0;
	try{
		Connection con= connectionProvider.getCon();
		Statement st =con.createStatement();
		ResultSet rs =st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	
		while(rs.next()){
			z=1;
			//session.setAttribute(email,"email");
			session.setAttribute("email",email);
			response.sendRedirect("home.jsp");	
		}
		if(z==0)
			response.sendRedirect("login.jsp?msg=notexist");	
	
		
		
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");	
	}
}

%>