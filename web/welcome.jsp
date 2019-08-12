<%-- 
    Document   : welcome
    Created on : 11 Mar, 2018, 8:50:09 PM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <%!
                String name;
                %>
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
               <% }else {

Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
Statement stmt = con.createStatement();        
ResultSet rs=stmt.executeQuery("select * from customer where email='"+s3+"'");
while(rs.next())
{
String fname=rs.getString("fname");
String lname=rs.getString("lname");
name=fname+' '+lname;
}
    %>
            <form action="logout.jsp">
           <label style="font-size: large;color: #316e66"> Logged in as : <%= name %>,</label>&nbsp;&nbsp;
            
                <button class="button">Logout</button>
            
        </form>
        <% } %>

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
                                                <li>
							<a href="about.jsp">About Us</a>

						</li>
                                               <li>
							<a href="contact.jsp">Feedback</a>
						</li>
                                                  <li class="selected">
							<a href="welcome.jsp">My account</a>

						</li>
                                                
                                              
                                            
					</ul>
				</div>
	
       
        <div>
            <%
                

  
try{

 
//out.println(n);
          
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
        Statement stmt = con.createStatement();
         
        ResultSet rs = stmt.executeQuery("select * from customer where email = '"+s3+"'");
        
  rs.next();
  String image=rs.getString("image");
  String fname = rs.getString("fname");
  String lname = rs.getString("lname");
  name = fname+" "+lname;
  String email = rs.getString("email");
  String cont= rs.getString("mobile");
  String address = rs.getString("address");
 %>
 <div id="contents">
				<div class="box">
					<div>
						<div class="body">
							<h1>MY ACCOUNT</h1><a href="cedit.jsp" style="position: absolute;top: 240px;right: 280px">Edit Profile</a>
							
                                                        <h2><marquee> Welcome !!  <%= name %> !!</marquee></h2>
   <center>
                                                        <img src="image/<%= image %>" alt="No Image to display" width="180px" height="200px" onerror="this.src='image/blankdp.png';"/>                                                        
<br>
<br>
First Name  : <%= fname %>
<br></br>
Last Name  : <%= lname %>
<br></br>
Email  : <%= email %>
<br></br>
  
Mobile  : <%=cont%>
<br></br>
Address  : <%=address%>
            <br><br>
            <br>
            <a href="orders.jsp">Order Some Food</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                              <a href="myorders.jsp">Check Your Order</a>
                                                            
   </center>  
							
						</div>
					</div>
				</div>
			</div>		</div>
             </div>
            
		</div>
 <%
  
   
    
    
}catch(Exception e){
    out.println(e);
}
    
     %>
           
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
                                                <li>
							<a href="about.jsp">About Us</a>

						</li>
                                               <li>
							<a href="contact.jsp">Feedback</a>
						</li>
                                                <li class="active">
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
