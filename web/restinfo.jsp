<%-- 
    Document   : restinfo
    Created on : 22 Mar, 2018, 1:03:59 PM
    Author     : rhlru
--%>

<%-- 
    Document   : addrests
    Created on : 2 Mar, 2018, 7:35:56 PM
    Author     : rhlru
--%>

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
                                                <li class="selected">
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
							<h1>Additional Information</h1>
                                                     
        
<pre>
  <form action="finalrest.jsp" method="post" enctype="multipart/form-data" style="font-size: x-large;">
               
   -Food-
   <br>
         <label class="main">Food Name :</label>    <input type="text" pattern="[A-Z a-z]{1,40}" title="Only letters(max 40)" required="required" name="name" placeholder="enter name of the dish"> <br>
       <label class="main">Food Price 1:</label>    <input type="text" required="required" pattern="^[0-9]+$" title="Only digits" name="price1" placeholder="enter price of the dish"><br>
   
       <label class="main">Food Name 2 :</label>    <input type="text" pattern="[A-Z a-z]{1,40}" title="Only letters(max 40)" name="name2" placeholder="optional"> <br>
      <label class="main">Food Price 2 :</label>    <input type="text"name="price2" pattern="^[0-9]+$" title="Only digits" placeholder="optional"><br>
   
       <label class="main">Food Name 3 :</label>    <input type="text" pattern="[A-Z a-z]{1,40}" title="Only letters(max 40)" name="name3" placeholder="optional"> <br>
      <label class="main">Food Price 3 :</label>    <input type="text" name="price3" pattern="^[0-9]+$" title="Only digits" placeholder="optional"><br>
      
     <label class="main">Food Category :</label>    <input type="file" required="required" name="file"> 
   <br><br><br>
   -Images-

   <label class="main">Select Images(Max 9):</label><input type="file" name="file1" required="required" multiple><br>
   <!--<label class="main">Image 2:</label>       <input type="file" name="file2" required="required"><br>
   <label class="main">Image 3:</label>       <input type="file" name="file3" required="required"><br>
   <label class="main">Image 4:</label>       <input type="file" name="file4" required="required"><br>
   <label class="main">Image 5:</label>       <input type="file" name="file5" required="required"><br>
   <label class="main">Image 6:</label>       <input type="file" name="file6" required="required"><br>
   <label class="main">Image 7:</label>       <input type="file" name="file7" required="required"><br>
   <label class="main">Image 8:</label>       <input type="file" name="file8" required="required"><br>
   <label class="main">Image 9:</label>       <input type="file" name="file9" required="required"><br>
  --><br><br><br>
   -Menu-
                
   <label class="main">Select Menu(Max 5):</label> <input type="file" name="menu1" required="required" multiple><br>
   <!--<label class="main">Menu 2:</label>       <input type="file" name="menu2" required="required"><br>
   <label class="main">Menu 3:</label>       <input type="file" name="menu3" required="required"><br>
   <label class="main">Menu 4:</label>       <input type="file" name="menu4" required="required"><br>
   <label class="main">Menu 5:</label>       <input type="file" name="menu5" required="required"><br>-->
     <br><br><br>
   -More info-

   <label class="main">More info 1:</label>        <input type="text" required="required" pattern="[A-Z a-z]{1,40}" title="Only letters(max 40)" name="moreinfo1" placeholder="enter additional info"> <br>
   <label class="main">More info 2:</label>        <input type="text" name="moreinfo2" pattern="[A-Z a-z]{1,40}" title="Only letters(max 40)" placeholder="optional"> <br>
   <label class="main">More info 3:</label>        <input type="text" name="moreinfo3" pattern="[A-Z a-z]{1,40}" title="Only letters(max 40)" placeholder="optional"> <br>
   <label class="main">More info 4:</label>        <input type="text" name="moreinfo4" pattern="[A-Z a-z]{1,40}" title="Only letters(max 40)" placeholder="optional"> <br>
   <label class="main">More info 5:</label>        <input type="text" name="moreinfo5" pattern="[A-Z a-z]{1,40}" title="Only letters(max 40)" placeholder="optional"> <br>
   
              <input type="submit" value="Add Information" style="background: #30122b;
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
               
        <form action="logout.jsp">
            <div id="login">
                
                <label style="font-size: large;color: #316e66"> Logged in as (Admin) ,</label>&nbsp;&nbsp;
                        <button class="button">Logout</button>
            </div>
        </form>                                           
                                               
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
                                            
		                                <li>
							<a href="staffdetails.jsp">Staff</a>
						</li>
                                                <li>
							<a href="custdetails.jsp">Customers</a>
						</li>
                                                <li class="active">
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
