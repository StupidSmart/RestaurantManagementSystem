<%-- 
    Document   : mcd
    Created on : 2 Mar, 2018, 2:45:17 PM
    Author     : rhlru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/column.css" type="text/css">
        
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
                                                    <a href="restaurants.jsp">Restaurants</a>
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
							<a href="contact.jsp">Feedback</a>
						</li>
                                                <% 
                                                    String s3=(String)session.getAttribute("rname");
                                                    if(s3==null)
                                                { %>
                                                <li>
							<a href="registration.jsp">Join Us</a>
						</li>
                                                <%}
                                                else
{ %>
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
                                                    <h1>McDonalds Borivali(W)</h1>
                                                    <div>
                                                    <img src="images/mcdlogo3.jpg" alt="MCd" style="width: 780px;height: 400px;" >
                                                    <div id="navigations">
					<ul>
                                            
                                            
		                                <li class="selected">
							<a href="mcd.jsp">Overview</a>
						</li>
                                                <li>
							<a href="image.html">Images</a>
						</li>
                                                <li>
							<a href="orders.jsp">Food</a>
						</li>
                                                <li>
							<a href="menu.jsp">Menu</a>
						</li>
                                                <li>
							<a href="maps.jsp">Directions</a>
						</li>
					</ul>
				</div>
                                                    <div class="row">
                                                        <div class="column" style="background-color: aliceblue;">
    <h2>Phone Numbers</h2>
    <strong>+91 9819330023</strong><br>
    <strong>+91 9967715444</strong>
    <p>Table reservation required</p>
    <br>
    <strong>Average Cost</strong><br>
    <p> 
₹1,000 for two people (approx.) 
Exclusive of applicable taxes and charges, if any
₹395  for a Happy meal (approx.)
Cash and Cards accepted</p>
  <br>  <strong>Cuisines</strong><br>
  <p>Burger, Fast Food</p>
  </div>
  <div class="column" style="background-color: aliceblue;">
    <h2>Opening hours</h2>
    <p>Open now Today  6PM to 3AM</p>
    <p><strong>Address</strong></p>
    <p>Near Granville Hotel, Opposite Kora Kendra Ground, Borivali West</p>
    <br>
    <a href="maps.jsp"><img src="images/mapssss.png" alt="MAP" width="200" height="100"></a>
  </div>
  <div class="column" style="background-color: aliceblue;">
    <h2>More Info</h2>
<br>
<ul>
    <li>Breakfast</li>
<li>Home Delivery</li>
<li>No Alcohol Available</li>
<li>Report Error</li>
<li>Claimed listing</ul>
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
                                    <li class="active">
							<a href="mcd.jsp">Overview</a>
						</li>
                                                <li>
							<a href="image.html">Images</a>
						</li>
                                                <li>
							<a href="orders.jsp">Food</a>
						</li>
                                                <li>
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
