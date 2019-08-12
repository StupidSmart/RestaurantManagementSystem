<%-- 
    Document   : index
    Created on : 11 Mar, 2018, 8:50:09 PM
    Author     : rhlru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript">

function disableBackButton()
 {
  location.href("logout.jsp");

 }
if(window.history.forward(1) != null)
         window.history.forward(1);
</script>
	<meta charset="UTF-8">
	<title>FOODIE TRIBE</title>
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
</style>
      <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
   #map {
        height: 425px;
       width: 852px;
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
        var mumbai = {lat: 19.2137, lng: 72.8654};

        map = new google.maps.Map(document.getElementById('map'), {
          center: mumbai,
          zoom: 15
        });

        infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch({
          location: mumbai,
          radius: 1000,
          type: ['restaurant']
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
					<a href="index.jsp"><img src="images/logo1.png" alt="LOGO" height="100" width="190" ></a>
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
            <button class="button" onclick="disableBackButton()">Logout</button>
            
        </form>

<% }
 } %>
                                </div>
				</div>
				<div id="navigation">
					<ul>
                                            <% 
       
                                                    if(s3==null)
                                                { %>
                                                
						<li class="selected">
							<a href="index.jsp">Home</a>
						</li>
						<li>
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
                                                { %> <li class="selected">
							<a href="index.jsp">Home</a>
						</li>
						<li>
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
				<div id="adbox">
                                   <img src="images/2.jpg" width="855" height="425" alt="Img">
                                </div>
                        </div>
                     <% 
       
                                                    if(s3==null)
                                                { %>
           
                    <div id="contents">
				<div id="adbox">
                                    <img src="images/3.jpg" width="855" height="425" alt="Img">
                                </div>
                    </div>
                     <%}
                                                else
                                                { %>
                    <center>
            <h2 style="font-family: sans-serif;font-size: x-large;color: #316e66;">RESTAURANTS NEAR YOU</h2>
            </center>
                    
                    
                    
                    <div id="contents">
				<div id="adbox">
                                      <div id="map"></div>
                                </div>
                    </div>
                    <%}%>
               			</div>
            
               	

                    <div id="footer">
			<div>
				<ul class="navigation">
					<% 
       
                                                    if(s3==null)
                                                { %>
                                                
						<li class="active">
							<a href="index.jsp">Home</a>
						</li>
						<li>
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
                                                { %> <li class="active">
							<a href="index.jsp">Home</a>
						</li>
						<li>
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
		
        
        
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.0/components/button.css">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.0/components/button.min.css">
</script> 
-->	                                      
</body>

</html>