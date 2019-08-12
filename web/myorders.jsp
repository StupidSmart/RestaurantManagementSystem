<%-- 
    Document   : myorders
    Created on : 7 Apr, 2018, 10:54:50 AM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<title>FOODIE TRIBE ORDER</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
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
					<a href="index.jsp"><img src="images/logo1.png" alt="LOGO" height="100" width="190"></a>
                                </div>
                            <%! String price1;int j; %>
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
j=rs.getInt("cid");
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
						<li>
							<a href="restaurants.jsp">Restaurants</a>
						</li>
						<li class="selected">
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
                                                    <h1>My Orders</h1>
                                                    <br><br>
                                                    
						                                            <%
          try{      
            
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           ResultSet rs=stmt.executeQuery("select * from orders,rest where orders.cid="+j+" and rest.rid=orders.rid");
           while(rs.next())
           { %>
            <pre style="font-size: medium;border-style: groove">
               <br>
             <label class="main">NAME : </label> <%= rs.getString("name") %><br>
            <label class="main">PRICE : </label> ₹<%= rs.getString("price") %><br>
         <label class="main">QUANTITY : </label> <%= rs.getString("quantity") %><br>
       <label class="main">ORDER TIME : </label> <%= rs.getTime("time") %><br>
     <label class="main">ORDERED FROM : </label> <%= rs.getString("rname") %><br>
<% if(rs.getTime("comp_time") == null)
{
    %>
           <label class="main" style="color: red;font-size: larger">STATUS : The Cheff is still preparing your order.</label> <br>
    <% }
else if(rs.getTime("comp_time") != null && rs.getBoolean("delivered") == false)
{
    %>
           <label class="main" style="color: orange;font-size: larger">STATUS :  The Deliver Boy left with your order at approx <%= rs.getTime("comp_time") %></label><br>
    <% }
       if(rs.getBoolean("delivered") == true)
{
   %>
           <label class="main" style="color: green;font-size: larger">STATUS :  Delivered</label> <br>
    <% }
%>

            </pre>
<% if(rs.getTime("comp_time") == null)
{

%>
            
             <p style="text-align: right"> <a href="deleteorder.jsp?oid=<%= rs.getInt("oid") %>">Cancel Order</a></p>
            <br>
           <%
        }
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
        <br>
        <center><a href="orders.jsp" style="font-size: x-large;position: relative;bottom: 10px">Order Some Yummy Food</a></center>
 
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
                                                { %> <li>
							<a href="index.jsp">Home</a>
						</li>
						<li>
							<a href="restaurants.jsp">Restaurants</a>
						</li>
						<li class="active">
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