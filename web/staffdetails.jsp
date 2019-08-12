<%-- 
    Document   : staffdetails
    Created on : 18 Mar, 2018, 12:48:03 PM
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
                                            <li>
                                                <a href="addstaff.jsp">Insert Staff</a>
                                            </li>
                                            
                                            <li>
                                                <a href="deletestaff.jsp">Delete Staff</a>
                                            </li>
                                            
		                                <li class="selected">
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
							<h1>STAFF DETAILS</h1>
                                                        <br><br>
                                                        <%
          try{      
            
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           ResultSet rs=stmt.executeQuery("select * from staff");
           while(rs.next())
           { %>
           
           <pre style="font-size: x-large;;border-style: groove">
<br>
             <label class="main">NAME : </label> <%= rs.getString("name") %><br>
            <label class="main">EMAIL : </label> <%= rs.getString("email") %><br>
         <label class="main">PASSWORD : </label> <%= rs.getString("password") %><br>
           <label class="main">MOBILE : </label> <%= rs.getString("mobile") %><br> 
      <label class="main">DESIGNATION : </label> <%= rs.getString("desig") %><br><br>
          </pre><br>
        
          
           <%
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
                                                        <center>
               
        <form action="logout.jsp">
            <div id="login">
                
                <label style="font-size: large;color: #316e66"> Logged in as (Admin) ,</label>&nbsp;&nbsp;
                <button class="button">Logout </button>
                
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
                                    <li>
                                                <a href="addstaff.jsp">Insert Staff</a>
                                            </li>
                                            
                                            <li>
                                                <a href="deletestaff.jsp">Delete Staff</a>
                                            </li>
                                            
		                                <li class="active">
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
