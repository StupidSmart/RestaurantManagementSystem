<%-- 
    Document   : addimage
    Created on : 23 Mar, 2018, 5:47:37 PM
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
        <style>

a:hover {
    background-color: #ddd;
    color: black;
}

.previous {
    background-color: #4CAF50;
    color: white;
}

.next {
    background-color: #4CAF50;
    color: white;
}

.round {
    border-radius: 50%;
}
</style>
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
                                                    <a href="image_1.jsp" style="position: absolute;left : 230px;top: 250px;text-decoration: none;padding: 8px 16px;" class="previous round">&#8249;</a>
                                                    <form method="post" action="finalimage.jsp" enctype="multipart/form-data">
                                                        <label class="main" style="position: absolute;top: 400px;right: 700px;">Select Images :<br>(Max 9):</label><input type="file" name="file1" required="required" style="position: absolute;top: 400px;right: 400px;" multiple><br>
                                                        <input type="submit" value="ADD" style="position: absolute;top: 480px;right: 600px;"/>
                                                    </form>                                          
                                                    
                                                    <br><br>
                                                    <center>
                                                    <a href="image_1.jsp" style="font-size: xx-large;position: absolute;top: 1000px;left: 540px">GO BACK</a>
                                                    </center>
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
                                                <li class="active">
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
