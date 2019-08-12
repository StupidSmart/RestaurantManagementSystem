<%-- 
    Document   : newrest
    Created on : 21 Mar, 2018, 10:54:18 AM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/column.css" type="text/css">
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
</style>
        
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
                        
			<div id="contents">
				<div class="box">
					<div>
						<div class="body">
                                                    
                                                    <%
                                                        int ridd=Integer.parseInt(request.getParameter("userid"));
                                                        try
                                                        {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
                                                             Statement stmt = con.createStatement();
                                                             stmt.executeUpdate("update moreinfos set rid="+ridd+" where rid is null");
                                                             stmt.executeUpdate("update food set rid="+ridd+" where rid is null");
                                                             
                                                             stmt.executeUpdate("update images set rid="+ridd+" where rid is null");
                                                             stmt.executeUpdate("update menus set rid="+ridd+" where rid is null");
                                                             ResultSet rs=stmt.executeQuery("select * from rest,moreinfos where rest.rid="+ridd+" and moreinfos.rid="+ridd+"");
                                                             
                                                             while(rs.next())
                                                           {
                                                          %>
                                                    <h1><%= rs.getString("rname") %></h1>
                                                    <div>
                                                        <img src="image/<%= rs.getString("image") %>" alt="MCd" style="width: 780px;height: 400px;" >
                                                    <div id="navigations">
					<ul>
                                            
		                                <li class="selected">
						    <a>Overview</a>
						</li>
                                                <li>
                                                    <a href="image.jsp?userid=<%= rs.getInt("rid") %>">Images</a>
						</li>
                                                <li>
							<a href="foods.jsp?userid=<%= rs.getInt("rid") %>">Food</a>
						</li>
                                                <li>
							<a href="menu.jsp?userid=<%= rs.getInt("rid") %>">Menu</a>
						</li>
                                                <li>
							<a href="maps.jsp?userid=<%= rs.getInt("rid") %>">Directions</a>
						</li>
					</ul>
				</div>
                                                    <div class="row">
                                                        <div class="column" style="background-color: beige">
    <h2>Phone Numbers</h2>     
    <strong><%= rs.getString("contact") %></strong><br>
    <strong><%= rs.getString("contact2") %></strong>
    <p>Table reservation required</p>
    <br>
    <strong>Average Cost</strong><br>
    <p> 
 ₹<%= rs.getString("avgcost") %> (approx.) 
Exclusive of applicable taxes and charges, if any.
This does not necessarily apply to everyone's need.
Cash and Cards accepted</p>
  <br>  <strong>Cuisine</strong><br>
  <p><%= rs.getString("cuisine") %></p>
  </div>
  <div class="column" style="background-color: azure">
    <h2>Opening hours</h2>
    <p><%= rs.getString("open_hrs") %></p>
    <br><strong>Address</strong>
    <p><%= rs.getString("address") %></p>
    <br><br>
    <strong>Directions</strong>
    <a href="maps.jsp?userid=<%= rs.getInt("rid") %>"><img src="images/mapssss.png" alt="MAP" width="200" height="100"></a>
  </div>
  <div class="column" style="background-color: cornsilk">
    <h2>More Info</h2>
<br>
<ul>
<li><%= rs.getString("moreinfo1") %></li>
<li><%= rs.getString("moreinfo2") %></li>
<li><%= rs.getString("moreinfo3") %></li>
<li><%= rs.getString("moreinfo4") %></li>
<li><%= rs.getString("moreinfo5") %></ul>
<br><br><br><h2>Owner Name</h2>
<p><strong><%= rs.getString("ownername") %></strong></p>
  </div>
                                                           
                                     <%   break;              
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
			</div><br>
			
                            <center>
			    © RAHUL RUPANI FOODIE. All Rights Reserved
                            </center>
                
		</div>
            </div>	
    </body>
</html>
