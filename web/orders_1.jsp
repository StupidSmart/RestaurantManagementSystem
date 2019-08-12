<%-- 
    Document   : room
    Created on : Feb 24, 2016, 2:14:29 PM
    Author     : Oops
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
input[type="text"] {
     width: 100%; 
     box-sizing: border-box;
     -webkit-box-sizing:border-box;
     -moz-box-sizing: border-box;
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
                            <%! String price1; %>
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
                                                    <h1>PLACE YOUR ORDER</h1>
                                                    <br><br>
                                                    
						<%
                                                    
                                                        try
                                                        {   
                                                        
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
                                                            Statement stmt = con.createStatement();
                                                            ResultSet rs=stmt.executeQuery("select * from food,rest where food.rid=rest.rid");
                                                            while(rs.next())
                                                           {
                                                          %>	
                                                    
                                                          <form method="post" action="mycart.jsp" style="width: 100%;table-layout: inherit">
                                                              <table border="1" width="100%" >
                                                            
<tr>
<th>Category</th>
<th>Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Get</th>
</tr>

<tr>
<td><img src="image/<%= rs.getString("category") %>" alt="BURGERS" width="200" height="150"></td>
<td align="center" width="50%"><input type="text" name="name1" readonly style="font-size: larger;text-align: center;border: 0px;" value="<%= rs.getString("name1") %>"><br><input type="text" name="name2" readonly style="font-size: larger;text-align: center;border: 0px;" value="<%= rs.getString("name2") %>"><br><input type="text" name="name3" readonly style="font-size: larger;text-align: center;border: 0px;" value="<%= rs.getString("name3") %>"></td>
<td>
    ₹<input type="text" name="price1" readonly  value="<%= rs.getString("price1") %>"><br>
    ₹<input type="text" name="price2" readonly  value="<%= rs.getString("price2") %>"><br>
    ₹<input type="text" name="price3" readonly style="font-size: larger;text-align: center;border: 0px;" value="<%= rs.getString("price3") %>"><br></td>
<td align="center"><select name="select1"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select><br>
    <select name="select2"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select><br>
    <select name="select3"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select></td>
<td><input type="checkbox" name="check1" value=""><br><input type="checkbox" name="check2" value=""><br><input type="checkbox" name="check3" value=""></td>

</tr>


</table>

<input type="submit" value="ADD TO CART" style="height: 40px;font-size: larger;"> 
</form>
                    
                                                        <br>
                                                        <br>   
                                                        <br><br>  <br>                  
<%   
    //price1=request.getParameter("check");
    //session.setAttribute("name",price1);
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

                                                        <br>
                                                        
            <center>
                                                    </center>
					
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