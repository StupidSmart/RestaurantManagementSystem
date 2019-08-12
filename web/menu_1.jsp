<%-- 
    Document   : menu
    Created on : 27 Feb, 2018, 3:07:43 AM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/lightbox.min.css" type="text/css">
        <script type="text/javascript" src="js/lightbox-plus-jquery.min.js"></script>
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
					          
						<li>
							<a href="index.jsp">Home</a>
						</li>
						
                                                <li class="selected">
                                                    <a href="restaurants.html">Restaurants</a>
                                                </li>
                                                
						<li>
							<a href="orders.jsp">Order</a>
						</li>
                                                
						<li>
							<a href="mycart.jsp">My Cart</a>
						</li>
                                                <li>
							<a href="about.jsp">About</a>
						</li>
						<li>
							<a href="contact.html">Feedback</a>
						</li>
                                                <li>
							<a href="registration.jsp">Join Us</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="contents">
				<div class="box">
					<div>
						<div class="body"> 
                                                    <%
                                                        try
                                                        {   
                                                            int ridd=Integer.parseInt(request.getParameter("userid"));
                                                        
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
                                                             Statement stmt = con.createStatement();
                                                             
                                                             ResultSet rs=stmt.executeQuery("select * from menus where rid="+ridd+"");
                                                           while(rs.next())
                                                           {
                                                               
                                                          %>
                                                          
                                                    <h1>MENU</h1>
                                                    <br>
                                                    <br>
							
        <div class="gallery">
            <a href="image/<%= rs.getString("menu1") %>" data-lightbox="mygallery" data-title=""><img src="image/<%= rs.getString("menu1") %>" alt="1" width="200" height="200"></a>
            <a href="image/<%= rs.getString("menu2") %>" data-lightbox="mygallery" data-title=""><img src="image/<%= rs.getString("menu2") %>" alt="2" width="200" height="200"></a>
            <a href="image/<%= rs.getString("menu3") %>" data-lightbox="mygallery" data-title=""><img src="image/<%= rs.getString("menu3") %>" alt="3" width="200" height="200"></a>
            <a href="image/<%= rs.getString("menu4") %>" data-lightbox="mygallery" data-title=""><img src="image/<%= rs.getString("menu4") %>" alt="4" width="200" height="200"></a>
            <a href="image/<%= rs.getString("menu5") %>" data-lightbox="mygallery" data-title=""><img src="image/<%= rs.getString("menu5") %>" alt="5" width="200" height="200"></a>
        </div><br><br>
        <br><br>
        <br><br><%   break;              
}
}
                                                        catch(ClassNotFoundException e)
                                                        {
                                                            e.getMessage();
                                                        }

                                                        catch(SQLException ex)
                                                        {
                                                            ex.getMessage();
                                                        }
                                                        %>

              
						</div>
					</div>
				</div>
			</div>
		</div>
            
		<div id="footer">
			<div>
				<ul class="navigation">
                                    <li>
							<a href="mcd.jsp">Overview</a>
						</li>
                                                <li>
							<a href="image.html">Images</a>
						</li>
                                                <li>
							<a href="orders.jsp">Food</a>
						</li>
                                                <li class="selected">
							<a href="menu.jsp">Menu</a>
						</li>
                                                <li>
							<a href="maps.jsp">Directions</a>
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

