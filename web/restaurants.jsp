<%-- 
    Document   : restaurants
    Created on : 13 Mar, 2018, 1:27:05 AM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
        <title>FOODIE TRIBE MENU</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css" type="text/css">
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
</style> <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 425px;
       width: 704px;
      }  </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdfr48mF-zbXL87K-RpZXSeCLgmAQLhXI&libraries=places&callback=initMap" async defer></script>
    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var map;
      var infowindow;

      function initMap() {
        var pyrmont = {lat: 19.21276010065611, lng: 72.86549265236977};

        map = new google.maps.Map(document.getElementById('map'), {
          center: pyrmont,
          zoom: 16
        });

        infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch({
          location: pyrmont,
          radius: 1000,
          type: ['store']
        }, callback);
      }

      function callback(results, status) {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
          }
        }
      }

      function createMarker(place) {
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
          map: map,
          position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          infowindow.open(map, this);
        });
      }

    </script>
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
                        
			<div id="contents">
				<div class="box">
					<div>
						<div id="contact" class="body">
                                                    <h1>RESTAURANTS</h1>
                                                        
                       
                                                   
                                                     <%
                                                       try
                                                       {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
                                                             Statement stmt = con.createStatement();
                                                             ResultSet rs=stmt.executeQuery("select * from rest");
                                      

                                                         while(rs.next())
                                                           {
 
                                                          %>
                         

                                                 <center>   
                                               
                                                    <div class="card" style="width: 28rem;background-color: bisque;">
                                                           <img class="card-img-top" src="image/<%= rs.getString("image") %>" alt="MCD" width="448" height="300">
                                                       <div class="card-block">
                                                           <b style="font-size: xx-large"> <%= rs.getString("rname") %></b>
                                                           
                                                     <br><br> <%= rs.getString("description") %>
                                                     <br><br> <a href="newrest.jsp?userid=<%= rs.getInt("rid") %>"  class="btn btn-primary" style="font-size: x-large;">Explore</a>
                                                       
                                                       </div>
                                                      </div>
                                                   </center>
                                                   <br>
     

                                                                                
					           
                                        
        
                                                   <br>
                                                           <br>
                                                           <br>
                                                 
                                                            <%                 
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
                                                  
                                                       <div>
            <center>
            <h2>OTHER RESTAURANTS NEAR YOU</h2>
            </center>
                    </div>  
                                                    <div id="contents">
                                                        <div id="adbox" style="width: 700px;margin-left: 1px;">
                                                    <div id="map"></div>
                                                    </div>
                                                    </div>
							
						</div>
					</div>
				</div>
			</div>
                    
		</div></div>
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
