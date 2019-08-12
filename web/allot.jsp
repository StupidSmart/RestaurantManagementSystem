<%-- 
    Document   : allot
    Created on : Feb 24, 2016, 2:58:07 PM
    Author     : Oops
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>allot</title>
    </head>
    <body>
       <div id="header">
				<div id="logo">
					<a href="index.jsp"><img src="images/logo1.png" alt="LOGO" height="100" width="190" ></a>
                                 </div>
				<div id="navigation">
					<ul>
						<li>
							<a href="index.jsp">Home</a>
						</li>
						<li>
							<a href="about.jsp">About</a>
						</li>
						<li>
							<a href="mycart.jsp">Rooms</a>
						</li>
						
						<li>
							<a href="foods.html">Food</a>
						</li>
						<li>
							<a href="registration.jsp">Join Us</a>
						</li>
						<li>
							<a href="contact.html">Feedback</a>
						</li>
					</ul>
				</div>
			</div>
        <div  style="margin-left: 400px;">
            <form action="allot" method="post">
                
                <pre>


                  <h1>enter new room and mess entry</h1>

                    <input type="text" name="order" placeholder="enter room no"/>

                    <input type="text" name="" placeholder="enter mess name"/>

                    <input type="submit" value="insert"/>


                </pre>

                
            </form>
                
                
           
            
            
            
        </div>



    </body>
</html>
