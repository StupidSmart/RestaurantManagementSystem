<%-- 
    Document   : addcust
    Created on : 2 Mar, 2018, 8:49:27 PM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
          <div id="background">
        <div id="page">
        <div id="header">
				<div id="logo">
					<a href="index.jsp"><img src="images/logo1.png" alt="LOGO" height="100" width="190"></a>
                                
				</div>
				<div id="navigation">
					<ul>
                                            <li></li>
                                            
		                                <li>
							<a href="addstaff.jsp">Staff</a>
						</li>
                                                <li class="selected">
							<a href="addcustom.jsp">Customers</a>
						</li>
                                                <li>
							<a href="addrests.jsp">Restaurant</a>
						</li>
                                                
                                                <li>
							<a href="admin.jsp">My Account</a>
						</li>
					</ul>
				</div>
			</div>
        
              <div id="contents">
				<div class="box">
					<div>
						<div class="body">
							<h1>CUSTOMER DETAILS </h1>
                                                        <br><br>
                                                        <br><br>
                                                        <%
          try{      
            
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           ResultSet rs=stmt.executeQuery("select fname,lname,email,mobile,address from customer");
           while(rs.next())
           { %>
           
           FIRST NAME : <%= rs.getString("fname") %><br><br><br>
           LAST NAME : <%= rs.getString("lname") %><br><br><br>
           EMAIL : <%= rs.getString("email") %><br><br><br>  
           MOBILE : <%= rs.getInt("mobile") %><br><br><br>
           ADDRESS : <%= rs.getString("address") %><br><br><br><br><br><br><br><br>
           
           <%
           }
            }
            catch(SQLException e)
            {
 out.println(e);
}           catch(ClassNotFoundException e)
            {
 out.println(e);
}
            
        %>
                                                        <center>
               
        <form action="logout.jsp">
            <div id="login">
                
                <input type="submit" value="Logout">
            </div>
        </form>                                           
                                               
                                                </div>     
                                        </div>
	</div>
					</div>
				</div>

                <div id="footer">
			<div>
				<ul class="navigation">
                                    <li></li>
                                    <li>
							<a href="addstaff.jsp">Staff</a>
						</li>
                                                <li class="active">
							<a href="addcustom.jsp">Customers</a>
						</li>
                                                <li>
							<a href="addrests.jsp">Restaurant</a>
						</li>
                                                
                                                <li>
							<a href="admin.jsp">My Account</a>
						</li>		</ul>
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
