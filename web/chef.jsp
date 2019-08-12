<%-- 
    Document   : cheff
    Created on : 28 Feb, 2018, 1:17:28 PM
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
					<a href="chef.jsp"><img src="images/logo1.png" alt="LOGO" height="100" width="190"></a>
                                
				</div>
				<div id="navigation">
					<ul>
                                            <li>
                                            </li>
                                            <li>
                                                </li>
		                                <li>
                                                  <a href="corders.jsp">View Orders</a>   
						</li>
                                               <li> 
                                                <a href="comporders.jsp">Completed</a>
                                                 </li>
                                                <li class="selected">
							<a href="chef.jsp">My Account</a>
						</li>
                                                 <li>
						</li>
                                                <li>
						</li>
                                               
					</ul>
				</div>
			
        
              <div id="contents">
				<div class="box">
					<div>
						<div class="body">
                                                    <h1>Chef's page</h1> 
            <%! String name;
            %>
                                                                          <%
  
      try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
         Statement stmt = con.createStatement();
         String str=(String)session.getAttribute("cmail");
        ResultSet rs = stmt.executeQuery("select * from staff where email = '"+str+"'");
        
  rs.next();
  name = rs.getString("name");
  String email = rs.getString("email");
  String cont= rs.getString("mobile");
  String desig = rs.getString("desig");
 %> 
 <h2> Welcome <%= name%>!</h2><br><br>
                    Name  : <%= name %><br><br>
                    Email  : <%= email %><br><br>
                    Mobile  : <%= cont %><br><br>
                    Designation  :<%= desig %><br><br><br><br>
                    <a href="corders.jsp">View Orders</a>

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
                <label style="font-size: large;color: #316e66"> Logged in as (Chef) : <%= name %> ,</label>&nbsp;&nbsp;
                 <button class="button">Logout</button>
            </div>
        </form>                                           
                                               
                                              

                <div id="footer">
			<div>
				<ul class="navigation">
                                           
                                            <li>
                                            </li>
                                            
                                            <li>
                                                </li>
                                            
		                               <li>    <a href="corders.jsp">View Orders</a>
                                            
                                                 </li>
                                              <li>
                                                    <a href="comporders.jsp">Completed</a>
                                                
						</li>
                                                                                            
                                                <li class="active">
							<a href="chef.jsp">My Account</a>
						</li>
                                                 <li>
						</li>
                                                <li>
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
