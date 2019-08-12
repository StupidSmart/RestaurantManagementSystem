<%-- 
    Document   : admin
    Created on : 11 Mar, 2018, 8:50:09 PM
    Author     : rhlru
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0" http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
              <%! String name;
            %>
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
                                                
                                                <li class="selected">
							<a href="admin.jsp">My Account</a>
						</li>
					</ul>
				</div>
			
        
              <div id="contents">
				<div class="box">
					<div>
						<div class="body">
                                                    <h1>Admin page</h1> 
            
                                                                          <%
  
      try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
         Statement stmt = con.createStatement();
         String str="rhlrupani@gmail.com";
        ResultSet rs = stmt.executeQuery("select * from admin where email = '"+str+"'");
        
  rs.next();
  String fname = rs.getString("fname");
  String lname = rs.getString("lname");
  name = fname+" "+lname;
  String email = rs.getString("email");
  String cont= rs.getString("mobile");
  String address = rs.getString("address");
 %> 
 <h2> Welcome <%= fname%>!</h2><br><br>
                    Name  : <%= name %><br><br>
                    Email  : <%= email %><br><br>
                    Mobile  : <%= cont %><br><br>
                    Address  :<%= address %><br><br><br><br>
                    <a href="addrests.jsp">Add a restaurant</a>

<%
  
   
    
    
}catch(Exception e){
    out.println(e);
}
    
     %>
           

            <br><br>
               
                                                      <!--   <p style="font-size: x-large;color: #3e8e41;"> Current Time : <%= java.util.Calendar.getInstance().getTime() %></p>
       
                                                        <p style="font-size: x-large;color: brown;">You Can : </p>
                                                        <a href="addstaff.jsp" style="font-size: x-large;color: #3e8e41;">ADD STAFF</a><br><br>
                                                        <a href="deletestaff.jsp" style="font-size: x-large;color: #3e8e41;">DELETE STAFF</a><br><br>   
                                                        <a href="staffdetails.jsp" style="font-size: x-large;color: #3e8e41;">VIEW STAFF DETAILS</a><br><br>
                                                        <a href="custdetails.jsp" style="font-size: x-large;color: #3e8e41;">VIEW CUSTOMER DETAILS</a><br><br>
                                                        <a href="addrests.jsp" style="font-size: x-large;color: #3e8e41;">VIEW AND ADD RESTAURANTS</a><br><br>
                                                        <a href="adfeedback.jsp" style="font-size: x-large;color: #3e8e41;">VIEW FEEDBACK</a><br><br>
                                                       -->
                                                        
                                                         
                                                        <br>

<br></br>
  
            <br><br>
            <br>
  							
						</div>
					</div>
				</div>
			</div>
             </div>
            
	</div>

           
 
        <form action="logout.jsp">
            <div id="login">
                
                <label style="font-size: large;color: #316e66"> Logged in as (Admin) ,</label>&nbsp;&nbsp;
                        <button class="button">Logout</button>
            </div>
        </form>                                           
                                               
                                              

                <div id="footer">
			<div>
				<ul class="navigation">
                                            <li>
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
                                                
                                                <li class="active">
							<a href="admin.jsp">My Account</a>
						</li>	</ul>
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
