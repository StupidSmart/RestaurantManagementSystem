<%-- 
    Document   : owner
    Created on : 23 Mar, 2018, 12:39:54 PM
    Author     : rhlru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
					<a href="admin.jsp"><img src="images/logo1.png" alt="LOGO" height="100" width="190"></a>
                                
				</div>
				<div id="navigation">
					<ul>
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
                                                <li class="selected">
							<a href="about.jsp">About Us</a>
						</li>
						<li>
							<a href="contact.jsp">Feedback</a>
						</li> 
                                               
                                               <li>
							<a href="welcome.jsp">My account</a>

						</li>
       
					</ul>
				</div>
		
        
              <div id="contents">
				<div class="box">
					<div>
						<div class="body">
							<h1>Own a Restaurant</h1>
                                                     
        
<pre>
  <form action="test.jsp" method="post" enctype="multipart/form-data" style="font-size: x-large;">
                
   <label class="main">Restaurant Name :</label> <input type="text" required="required" pattern="[A-Z a-z]{1,20}" title="Restaurant name should only contain letters. e.g-Dominos" name="rname" placeholder="enter restaurant name"> <br>
       <label class="main">Description :</label> <input type="text" style="overflow: scroll;" required="required" name="desc" placeholder="enter description"><br>
         <label class="main">Contact 1 :</label> <input type="text" required="required" pattern="^\d{4}-\d{3}-\d{3}$" title="Contact must be in such format:9769-339-332" name="contact" placeholder="enter 1st contact number"> <br>
         <label class="main">Contact 2 :</label> <input type="text" required="required" pattern="^\d{4}-\d{3}-\d{3}$" title="Contact must be in such format:9769-339-332" name="contact2" placeholder="enter 2nd contact number"><br>
           <label class="main">Address :</label> <input type="text" style="overflow: scroll;" required="required" name="address" placeholder="enter address"><br>
      <label class="main">Average Cost :</label> <input type="text" required="required" name="avgcost" placeholder="enter average cost"><br>
        <label class="main">About Us name :</label> <input type="text" required="required" name="ownername" pattern="[A-Z a-z]{1,20}" title="Restaurant name should only contain letters. e.g-Rahul" placeholder="enter owner name"><br>
           <label class="main">Cuisine :</label> <input type="text" required="required" name="cuisine" placeholder="enter cuisine"><br>
     <label class="main">Opening Hours :</label> <input type="text" required="required" name="open_hrs" placeholder="enter opening hours"><br>
       <label class="main">Cover image :</label> <input type="file" name="file" required="required"><br>
                
                
              <input type="submit" value="Add Restaurant" style="background: #30122b;
  background-image: -webkit-linear-gradient(top, #30122b, #47340e);
  background-image: -moz-linear-gradient(top, #30122b, #47340e);
  background-image: -ms-linear-gradient(top, #30122b, #47340e);
  background-image: -o-linear-gradient(top, #30122b, #47340e);
  background-image: linear-gradient(to bottom, #30122b, #47340e);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #ffffff;
  font-size: 27px;
  padding: 10px 20px 10px 20px;
  text-decoration: none;"/>
                
            </form>

                </pre>
               
       <!-- <form action="rest.jsp" method="post" enctype="multipart/form-data">
        Restaurant name : <input type="text" name="rname" placeholder="enter restaurant name"/><br><br>
        Contact 1 : <input type="text" name="contact" placeholder="enter 1st contact number"/><br><br>
        Contact 2 : <input type="text" name="contact2" placeholder="enter 2nd contact number"/><br><br>
        Address : <input type="text" name="address" placeholder="enter the address"/><br><br>
        Average Cost : <input type="text" name="avgcost" placeholder="enter average cost"/><br><br>
        Rating : <input type="text" name="rating" placeholder="enter rating"/><br><br>
        Minimum Order : <input type="text" name="minorder" placeholder="enter minimum order"/><br><br>
        Cuisine : <input type="text" name="cuisine" placeholder="enter cuisine"/><br><br>
        Opening Hours : <input type="text" name="open_hrs" placeholder="enter opening hours"/><br><br>
        Cover Image : <input type = "file" name = "file"/><br><br>
         <br />
         <input type = "submit" value = "Add Restaurant" />
      </form>
           -->   
                                                </div>     
                    </div>
                </div>
				</div>
              <%  
                  String s3=(String)session.getAttribute("rname");
            
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
            <div id="login">
                <label style="font-size: large;color: #316e66"> Logged in as : <%= name %>,</label>&nbsp;&nbsp;
            
                        <button class="button">Logout</button>
            </div>
        </form>                                           
                         <% } %>                      
                                                </div>     
                                     			
	</div>
                <div id="footer">
			<div>
				<ul class="navigation">
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
