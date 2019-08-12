<%-- 
    Document   : cedit
    Created on : 14 Apr, 2018, 3:22:34 PM
    Author     : Rahul Rupani
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
 .button1 {
  display: inline-block;
  font-size: 32px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #990000;
  border: none;
}

.button1:hover {background-color: #72675f}

.button1:active {
  background-color: #72675f;
  
  transform: translateY(4px);
}
.button2 {
  display: inline-block;
  font-size: 30px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #3e8e41;
  border: none;
}

.button2:hover {background-color: #72675f}

.button2:active {
  background-color: #72675f;
  
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
							<h1>EDIT MY ACCOUNT</h1>
                                                         	<br><br>						
                                                        <form method='post' enctype="multipart/form-data" action='cedit2.jsp'>
                            <center>
 <img src="image/<%= image %>" alt="No Image to display" width="180px" height="200px" onerror="this.src='image/blankdp.png';"/>                                                        
<br>
<br>
<input type='file' name='image'/>
 <br>
<br>
First Name  : <input type='text' name="fname" pattern="[A-Za-z]{1,30}" title="First name should only contain letters. e.g-Rahul(max 30)" value='<%= fname %>'/>
<br></br>
 Last Name  : <input type='text' pattern="[A-Za-z]{1,30}" title="First name should only contain letters. e.g-Rahul(max 30)" name="lname" value='<%= lname %>'/>
<br></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email  :  <input type='text' name="t1" readonly value='<%= email %>'/>
<br></br>
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mobile  : <input type='text' pattern="^\d{10}$" title="Contact must be in such format:9769339332" name="mobile" value='<%= cont %>'/>
<br></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Address  : <input type='text' name="address" value='<%= address %>'/>
            <br><br>
            <br>
          <input type='submit' class='button2' value='Save Changes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='welcome.jsp' class='button1'>Cancel Changes</a>                                           
                                                            </center>
   </form>					
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
