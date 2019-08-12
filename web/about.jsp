<%-- 
    Document   : about
    Created on : 13 Mar, 2018, 1:26:14 AM
    Author     : rhlru
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<title>FOODIE TRIBE ABOUT</title>
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
						<li>
							<a href="restaurants.jsp">Restaurants</a>
						</li>
                                                <li>
							<a href="foods.html">Food</a>
						</li>
                                                <li class="selected">
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
						<li>
							<a href="restaurants.jsp">Restaurants</a>
						</li>
						<li>
							<a href="orders.jsp">Order</a>
						</li>
						<li>
							<a href="mycart.jsp">My Cart</a>
						</li>
                                                <li class="selected">
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
							<h1 style="font-family: Baskerville;font-size: xx-large;">About Us</h1>
                                                        <br>
                                                        <p style="font-family: Baskerville;font-size: larger;">Foodies are a distinct hobbyist group. Typical foodie interests and activities include the food industry, wineries and wine tasting, breweries and beer sampling, food science, following restaurant openings and closings and occasionally reopenings, food distribution, food fads, health and nutrition, cooking classes, culinary tourism, and restaurant management. A foodie might develop a particular interest in a specific item, such as the best egg cream or burrito. Many publications have food columns that cater to foodies and many of the websites carrying the name foodie have become popular amongst the foodies.</p>
							
							<br>
                                                        <img src="images/giphy.gif" alt="img" width="780" height="300">
                                                        <br>
                                                        <br>
                                                        <br>
                                                        <p style="font-family: Baskerville;font-size: larger;">A restaurant , or an eatery, is a business which prepares and serves food and drinks to customers in exchange for money. Meals are generally served and eaten on the premises, but many restaurants also offer take-out and food delivery services, and some offer only take-out and delivery. Restaurants vary greatly in appearance and offerings, including a wide variety of cuisines and service models ranging from inexpensive fast food restaurants and cafeterias to mid-priced family restaurants, to high-priced luxury establishments.</p>
							
						</div>
					</div>
				</div>
			</div>
		</div>	</div>
                    
		<div id="footer">
			<div>
				<ul class="navigation">
				<% 
       
                                                    if(s3==null)
                                                { %>
                                                
						<li>
							<a href="index.jsp">Home</a>
						</li>
						<li>
							<a href="restaurants.jsp">Restaurants</a>
						</li>
                                                <li>
							<a href="foods.html">Food</a>
						</li>
                                                <li class="active">
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
						<li>
							<a href="restaurants.jsp">Restaurants</a>
						</li>
						<li>
							<a href="orders.jsp">Order</a>
						</li>
						<li>
							<a href="mycart.jsp">My Cart</a>
						</li>
                                                <li class="active">
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