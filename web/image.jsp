<%-- 
    Document   : image
    Created on : 13 Mar, 2018, 1:26:52 AM
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
      <style>
.button {
  display: inline-block;
  font-size: 18px;
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
input[type=email] {
    width: 100%;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
}

input[type=email]:focus {
    border: 3px solid #555;
}
input[type=password] {
    width: 100%;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
}

input[type=password]:focus {
    border: 3px solid #555;
}
 select {width: 100%;
    padding: 4px 2px;
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1}
</style>  <script type="text/javascript" src="js/lightbox-plus-jquery.min.js"></script>
    </head>
    
    <body>
        <div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
					<a href="index.jsp"><img src="images/logo1.png" alt="LOGO" height="100" width="190"></a>
                                </div>
                            <div id="login">
                                <% String s3=(String)session.getAttribute("rname");
                                    if(s3==null)
                                {
                                    
                                
                                %>
                                     <form action="login.jsp" method="post">
    

                                
                                <select name="user">
                                <option value="customer">customer</option>
                                <option value="admin">admin</option>
                                <option value="staff">staff</option>
                                </select>    
                                <div>
                                    <input type="email" required="required" name="email" placeholder="email" />
                                </div>
                                <input type="password"  required="required" name="pass" placeholder="password"/>
                                 <div></div>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 
                                <button class="button">Login</button>
                                </form>
               <% } else
{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
Statement stmt = con.createStatement();        
ResultSet rs=stmt.executeQuery("select * from customer where email='"+s3+"'");
while(rs.next())
{
String fname=rs.getString("fname");
String lname=rs.getString("lname");
String name=fname+' '+lname;
%>
        <form action="logout.jsp">
                
            <label style="font-size: large;color: #316e66"> Logged in as : <%= name %>,</label>&nbsp;&nbsp;
                <button class="button">Logout</button>
            
        </form>

<% }
 } %>
                                </div>
				
				<div id="navigation">
					<ul>
					          
								 <% 
       
                                                    if(s3==null)
                                                { %>
                                                
						<li>
							<a href="index.jsp">Home</a>
						</li>
						<li class="selected">
							<a href="restaurants.jsp">Restaurants</a>
						</li>
                                                <li>
							<a href="foods.html">Food</a>
						</li>
                                                <li>
							<a href="about.jsp">About</a>
						</li>
						<li>
							<a href="contact.jsp">Feedback</a>
						</li>
                                                <li>
							<a href="registration.jsp">Join Us</a>
						</li>
                                                <%}
                                                else
                                                { %> 
                                                <li>
							<a href="index.jsp">Home</a>
						</li>
						<li class="selected">
							<a href="restaurants.jsp">Restaurants</a>
						</li>
						<li>
							<a href="orders.jsp">Order</a>
						</li>
						<li>
							<a href="mycart.jsp">My Cart</a>
						</li>
                                                <li>
							<a href="about.jsp">About Us</a>

						</li>
                                               <li>
							<a href="contact.jsp">Feedback</a>
						</li>
                                                  <li>
							<a href="welcome.jsp">My account</a>

						</li>
                                                <%}%>
                                             
				
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
                                                             
                                                             ResultSet rs=stmt.executeQuery("select * from images,rest where images.rid="+ridd+" and rest.rid="+ridd+"");
                                                           while(rs.next())
                                                           {
                                                          %>
                                                    <h1><%= rs.getString("rname") %> IMAGE GALLERY</h1>	
						 	
        <div class="gallery">
            <a href="image/<%= rs.getString("image1") %>" data-lightbox="mygallery" data-title="perfect meal"><img src="image/<%= rs.getString("image1") %>" alt="1" width="200" height="200"></a>
            <a href="image/<%= rs.getString("image2") %>" data-lightbox="mygallery" data-title="Mc Cafe 1"><img src="image/<%= rs.getString("image2") %>" alt="2" width="200" height="200"></a>
            <a href="image/<%= rs.getString("image3") %>" data-lightbox="mygallery" data-title="Mc Cafe 2"><img src="image/<%= rs.getString("image3") %>" alt="3" width="200" height="200"></a>
            <a href="image/<%= rs.getString("image4") %>" data-lightbox="mygallery" data-title="Happy Meal"><img src="image/<%= rs.getString("image4") %>" alt="4" width="200" height="200"></a>
            <a href="image/<%= rs.getString("image5") %>" data-lightbox="mygallery" data-title="Logo"><img src="image/<%= rs.getString("image5") %>" alt="6" width="200" height="200"></a>
            <a href="image/<%= rs.getString("image6") %>" data-lightbox="mygallery" data-title="perfect meal 2"><img src="image/<%= rs.getString("image6") %>" alt="7" width="200" height="200"></a>
            <a href="image/<%= rs.getString("image7") %>" data-lightbox="mygallery" data-title="Live pic"><img src="image/<%= rs.getString("image7") %>" alt="8" width="200" height="200"></a>
            <a href="image/<%= rs.getString("image8") %>" data-lightbox="mygallery" data-title="Live pic 2"><img src="image/<%= rs.getString("image8") %>" alt="9" width="200" height="200"></a>
            <a href="image/<%= rs.getString("image9") %>" data-lightbox="mygallery" data-title="The Joker"><img src="image/<%= rs.getString("image9") %>" alt="10" width="200" height="200"></a>
        </div><%   break;              
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

                                                    <br><br>
                                                    <br><br>
                                                    <center>
                                                    </center>
						</div>
					</div>
				</div>
			</div>
		</div>
            
		<div id="footer">
			<div>
				<ul class="navigation">
					<% 
       
                                                    if(s3==null)
                                                { %>
                                                
						<li>
							<a href="index.jsp">Home</a>
						</li>
                                                <li class="active">
							<a href="restaurants.jsp">Restaurants</a>
						</li>
                                                <li>
							<a href="foods.html">Food</a>
						</li>
                                                <li>
							<a href="about.jsp">About</a>
						</li>
						<li>
							<a href="contact.jsp">Feedback</a>
						</li>
                                                <li>
							<a href="registration.jsp">Join Us</a>
						</li>
                                                <%}
                                                else
                                                { %> <li>
							<a href="index.jsp">Home</a>
						</li>
						<li class="active">
							<a href="restaurants.jsp">Restaurants</a>
						</li>
						<li>
							<a href="orders.jsp">Order</a>
						</li>
						<li>
							<a href="mycart.jsp">My Cart</a>
						</li>
                                                <li>
							<a href="about.jsp">About Us</a>

						</li>
                                               <li>
							<a href="contact.jsp">Feedback</a>
						</li>
                                                  <li>
							<a href="welcome.jsp">My account</a>

						</li>
                                                <%}%>
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
