<%-- 
    Document   : registration
    Created on : 11 Mar, 2018, 8:50:09 PM
    Author     : rhlru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	<title>FOODIE TRIBE REGISTER</title>
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
#em {
    width: 100%;
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
}

#em:focus {
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
                                <form action="login.jsp" method="post">
    

                                
                                <select name="user">
                                <option value="customer">customer</option>
                                <option value="admin">admin</option>
                                <option value="staff">staff</option>
                                </select>    
                                <div>
                                    <input type="email" id="em" required="required" name="email" placeholder="email" />
                                </div>
                                <input type="password" id="em" required="required" name="pass" placeholder="password"/>
                                 <div></div>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 
                                <button class="button">Login</button>
                                </form>
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
							<a href="foods.html">Food</a>
						</li>
                                                <li>
							<a href="about.jsp">About</a>
						</li>
                                                
						<li>
							<a href="contact.jsp">Feedback</a>
						</li>
                                                <li class="selected">
							<a href="registration.jsp">Join Us</a>
						</li>
					</ul>
				</div>
			
			<div id="contents">
				<div class="box">
					<div>
						<div id="news" class="body">
                                                    <h1>REGISTER HERE</h1>
                                                    
                                                    <pre>
        <form action="register.jsp" method="post">
            
        <label class="main">First Name : </label>        <input type="text" pattern="[A-Za-z]{1,30}" title="First name should only contain letters. e.g-Rahul(max 30)" required="required" placeholder="first name" name="fname">
                 
        <label class="main">Last Name : </label>         <input type="text" pattern="[A-Za-z]{1,30}" title="Last name should only contain letters. e.g-Rupani(max 30)" required="required" placeholder="last name" name="lname">
               
        <label class="main">Email: </label>              <input type="email" required="required" placeholder="email" name="email">
           
        <label class="main">Password: </label>           <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required="required" placeholder="password" name="pass">

        <label class="main">Confirm Password: </label>   <input type="password" required="required" placeholder="confirm password" name="cpass">
         
        <label class="main">Contact : </label>           <input type="text" pattern="^\d{10}$" title="Contact must be in such format:9769339332" required="required" placeholder="mobile" name="cont">
            
        <label class="main">Address: </label>            <input type="text" required="required" placeholder="address" name="add">
       
                        
                 <input type="submit" value="Register" style="background: #30122b;
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
                                                    
					</div>
				</div>
			</div>
		</div></div>
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
							<a href="foods.html">Food</a>
						</li>
                                                <li>
							<a href="about.jsp">About</a>
						</li>
                                                
						<li>
							<a href="contact.jsp">Feedback</a>
						</li>
                                                <li class="active">
							<a href="registration.jsp">Join Us</a>
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
