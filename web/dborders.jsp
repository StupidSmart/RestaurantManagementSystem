<%-- 
    Document   : dborders
    Created on : 30 Mar, 2018, 1:00:08 AM
    Author     : rhlru
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>JSP Page</title>
        <style>
.button {
  display: inline-block;
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #2c9688;
  border: none;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  
  transform: translateY(4px);
}
</style>
    </head>
    <body>
        <div id="background">
        <div id="page">
        <div id="header">
				<div id="logo">
					<a href="dboy.jsp"><img src="images/logo1.png" alt="LOGO" height="100" width="190"></a>
                                
				</div>
				<div id="navigation">
					<ul>
                                            <li>
                                            </li>
                                            
                                            <li>
                                                </li>
                                            
		                                <li>
						</li>
                                                 <li class="selected">
                                                     <a href="dborders.jsp">View Orders</a>
                                                 </li>
                                                <li>
							<a href="dboy.jsp">My Account</a>
						</li>
                                                 <li>
						</li>
                                                <li>
						</li>
                                               
					</ul>
				</div>
			
        
              <div id="contents">
				<div class="box">
					<div>
						<div class="body">
            <%! String name,name2;
            %>
                                                                          <%
  
      try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
         Statement stmt = con.createStatement();
         String str=(String)session.getAttribute("dbmail");
        ResultSet rs = stmt.executeQuery("select * from staff where email = '"+str+"'");
        
  rs.next();
  name = rs.getString("name");
  
   
    
    
}catch(Exception e){
    out.println(e);
}
    
     %>
                                                              <h1>Ready For Delivery</h1> 
                                                                         <br> 
           <%
      try
      {      
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           int i=0;
           ResultSet rs=stmt.executeQuery("select * from orders,customer,rest where customer.cid=orders.cid and rest.rid=orders.rid");
           while(rs.next())
           { 
   Time t=rs.getTime("comp_time");
   Boolean b=rs.getBoolean("delivered");
               if( t != null && b == false)

{
    i++;
%>
            <pre style="font-size: medium;border-style: groove">
               <br>
               <label class="main">NAME : </label> <%= rs.getString("name") %><br>
              <label class="main">PRICE : </label> ₹<%= rs.getString("price") %><br>
           <label class="main">QUANTITY : </label> <%= rs.getString("quantity") %><br>
         <label class="main">ORDER TIME : </label> <%= rs.getTime("time") %><br>
       <label class="main">ORDERED FROM : </label> <%= rs.getString("rname") %><br>
         <label class="main">ORDERED By : </label> <%= rs.getString("fname")+" "+rs.getString("lname") %>  <br>
 <label class="main">CUSTOMER'S CONTACT : </label> <%= rs.getString("mobile") %>  <br>
 <label class="main">CUSTOMER'S ADDRESS : </label> <%= rs.getString("customer.address") %>  <br> 
        <label class="main">PREPARED AT : </label> <%= rs.getTime("comp_time") %><br>
</pre>
      <p style="text-align: right"><a href="pay.jsp?oidd=<%= rs.getInt("oid") %>">Take bill and leave for delivery</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="finale.jsp?oidd=<%= rs.getInt("oid") %>">Delivered</a></p>

        <br><br>
        <%
           }

}
if(i==0)
{
out.println("<p style='font-size: x-large;position: absolute;top: 400px;right: 480px;'>No Orders Ready For Delivery</p>");

}
}
            
            catch(SQLException e)
            {
 out.println(e.getMessage());
}           catch(ClassNotFoundException e)
            {
 out.println(e.getMessage());
}
            
        %>
						
						</div>
					</div>
				</div>
			</div>
             </div>
            
	</div>

           
 
        <form action="logout.jsp">
            <div id="login">
                <label style="font-size: large;color: #316e66"> Logged in as (Delivery boy) : <%= name %> ,</label>&nbsp;&nbsp;
                 <button class="button">Logout</button>
            </div>
        </form>                                           
                                               
                                              

                <div id="footer">
			<div>
				<ul class="navigation">
                                           
                                            <li>
                                            </li>
                                            
                                            <li>
                                                </li>
                                            
		                                <li>
						</li>
                                            <li class="active">    <a href="dborders.jsp">View Orders</a>
                                            
                                                 </li>
                                                
                                                <li>
							<a href="dboy.jsp">My Account</a>
						</li>
                                                 <li>
						</li>
                                                <li>
						</li>
                                               
					
	</ul>
				<div id="connect">
					<a href="https://in.pinterest.com/search/pins/?q=foodie&rs=typed&term_meta[]=foodie%7Ctyped" target="_blank" class="pinterest"></a> <a href="https://www.facebook.com/groups/Foodie.msr/" target="_blank" class="facebook"></a> <a href="https://twitter.com/foodiehk?lang=en-in" target="_blank" class="twitter"></a> <a href="https://plus.google.com/communities/108384192707454831249" target="_blank" class="googleplus"></a>
				</div>
			</div>
               
			<p>
			    © RAHUL RUPANI FOODIE. All Rights Reserved	
			</p>
	
            
						
			 </div>
        </div>					
							
					
    
	
        
     
    </body>
</html>
