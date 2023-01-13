<%@ page 
    import="project.connectionProvider"
    import="java.sql.*"%>
    
    <%
    String email = session.getAttribute("email").toString(); 
    String  product_id =request.getParameter("id");
    int quantity=1;
    int productPrice=0;
    int productTotal=0;
    int cartTotal=0;
    
    int z=0;
    try{
    	Connection con= connectionProvider.getCon();
    	Statement st =con.createStatement();
		ResultSet rs =st.executeQuery("select * from product where id='"+ product_id+"'");
		
		while(rs.next()){
			productPrice=rs.getInt(4);
			productTotal=productPrice;
		}
		
		ResultSet rs1 =st.executeQuery("select * from cart where product_id='"+ product_id+"' and email='"+email+"' and address is NULL");
		
		while(rs1.next()){
			
			cartTotal=rs1.getInt(5);
			cartTotal=cartTotal+productTotal;
			quantity=rs1.getInt(3);
			quantity=quantity+1;
			z=1;
		}
		if(z==1){
			st.executeUpdate("update cart set total='"+cartTotal+"',quantity='"+quantity+"' where product_id='"+ product_id+"' and email='"+email+"' and address is null ");
			response.sendRedirect("home.jsp?msg=exist");
		}
		if(z==0){
			PreparedStatement ps = con.prepareStatement("insert into cart(email, product_id,quantity,price,total) values(?,?,?,?,?)");
			ps.setString(1,email);
			ps.setString(2, product_id);
			ps.setInt(3,quantity);
			ps.setInt(4,productPrice);
			ps.setInt(5,productTotal);
			
			ps.executeUpdate();
			response.sendRedirect("home.jsp?msg=added");		
		
		}
    	
    }catch(Exception e){
    	System.out.println(e);
    	response.sendRedirect("home.jsp?msg=invalid");	
    }
    %>
    
    