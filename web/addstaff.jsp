<%-- 
    Document   : addstaff
    Created on : 2 Mar, 2018, 8:27:08 PM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
                                            <li class="selected">
                                                <a href="addstaff.jsp">Insert Staff</a>
                                            </li>
                                            
                                            <li>
                                                <a href="deletestaff.jsp">Delete Staff</a>
                                            </li>
                                            
		                                <li>
							<a href="staffdetails.jsp">Staff</a>
						</li>
                                                <li>
							<a href="custdetails.jsp">Customers</a>
						</li>
                                                <li>
							<a href="addrests.jsp">Restaurants</a>
						</li>
                                            <li>
                                                <a href="adfeedback.jsp">Feedback</a>
                                            </li>
                                                
                                                <li>
							<a href="admin.jsp">My Account</a>
						</li>
					</ul>
				</div>
			
        
                  <div id="contents">
				<div class="box">
					<div>
						<div class="body">
							<h1>ADD STAFF</h1>
                                                        <br>
                                                     
       
          
            <div>
                <pre>
	    <form action="staff.jsp" method="post" style="font-size: x-large;">
                
                  <label class="main">Name :</label>   <input type="text" required="required" pattern="[A-Z a-z]{1,40}" title="Name should only contain letters. e.g-Rahul Rupani(max 40)" name="name" placeholder="enter  name">
                
                 <label class="main">Email :</label>   <input type="email" required="required" name="email" placeholder="email">
                
              <label class="main">Password :</label>   <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required="required" name="pass" placeholder="password">
                
                <label class="main">Mobile :</label>   <input type="text" required="required" pattern="^\d{10}$" title="Contact must be in such format:9769339332" name="mob" placeholder="mobile">
                
           <label class="main">Designation :</label>   <select name="desig" required="required" placeholder="designation">
               <option value="Chef">Chef</option>
               <option value="Delivery Boy">Delivery Boy</option>
           </select><br><br>
                
              <input type="submit" value="Insert Staff" style="background: #30122b;
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
        </div>
                                                        <center>
               
        <form action="logout.jsp">
            <div id="login">
                
                <label style="font-size: large;color: #316e66"> Logged in as (Admin) ,</label>&nbsp;&nbsp;
                                <button class="button">Logout</button>
            </div>
        </form>                                           
                                               
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
                                                <a href="addstaff.jsp">Insert Staff</a>
                                            </li>
                                            
                                            <li>
                                                <a href="deletestaff.jsp">Delete Staff</a>
                                            </li>
                                            
		                                <li>
							<a href="staffdetails.jsp">Staff</a>
						</li>
                                                <li>
							<a href="custdetails.jsp">Customers</a>
						</li>
                                                <li>
							<a href="addrests.jsp">Restaurants</a>
						</li>
                                            <li>
                                                <a href="adfeedback.jsp">Feedback</a>
                                            </li>
                                                
                                                <li>
							<a href="admin.jsp">My Account</a>
						</li>		</ul>
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
