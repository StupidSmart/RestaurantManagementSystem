<%-- 
    Document   : payment
    Created on : Feb 24, 2016, 2:03:53 PM
    Author     : Oops
--%>

<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FOODIE TRIBE Cart</title>
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
                                    <%! Integer total1,total2,total3,gt;
                                                        int i=0,j,ridd;
                                                        String name1,name2,name3;
                                                        Integer price1,price2,price3,select1,select2,select3;
                                             
                                                        
//if()
//{
    %><% String s3=(String)session.getAttribute("rname");
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
Statement stmt = con.createStatement();        
ResultSet rs=stmt.executeQuery("select * from customer where email='"+s3+"'");
while(rs.next())
{
j=rs.getInt("cid");
String fname=rs.getString("fname");
String lname=rs.getString("lname");
String name=fname+' '+lname;
%>
        <form action="logout.jsp">
                
            <label style="font-size: large;color: #316e66"> Logged in as : <%= name %>,</label>&nbsp;&nbsp;
                <button class="button">Logout</button>
            
        </form>

<% 
 } %></div>
                                
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
                                                
						<li class="selected">
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
                                               
					</ul>
				</div>
			
			<div id="contents">
				<div class="box">
					<div>
						<div class="body">
                                                    <%  //String p=(String)session.getAttribute("name");
                                                        //out.println(p);
                                                    %>
                                                    <h1>Item's in your Cart</h1> <br><br>
                                                        <%
//}
//else
//{
  // String p1 = request.getParameter("p1");
        //String r=request.getParameter("order");
   //out.println(price1);
 //out.println(r);
 //Integer ridd=Integer.parseInt(request.getParameter("order"));
 //String s1=request.getParameter("select1");
 //out.println(s1);
                                               /*  try
                                                       {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
                                                             stmt = con.createStatement();
                                                             rs=stmt.executeQuery("select * from food where food.rid="+ridd+"");
                                      

                                                         while(rs.next())
                                                           {
 */
                                               try
                                               {
 String c1 = request.getParameter("check1");
 String c2 = request.getParameter("check2");
 String c3 = request.getParameter("check3");
 //if(p != null)
 //{
 %>
 <form method="post" action="process.jsp">
 <%
     total1=0;total2=0;total3=0;price1=0;price2=0;price3=0;select1=0;select2=0;select3=0;
if (c1 != null)
{
    
                                                           %>
                                                          
                                                         <table border="1" width="100%">
                                                              <tr>
                                                                  <td>Name</td>
                                                                  <td>Price</td>
                                                                  <td>Quantity</td>
                                                                  <td>Total Price</td>
                                                              </tr>
                                                              <tr>
                                                                  <td> <% name1=request.getParameter("name1"); %>
                                                                      <input type="text" size="20" style="border: 0px;" name="n1" value="<%= name1 %>"/></td>
                                                                  <td> <% price1=Integer.parseInt(request.getParameter("price1")); %>   
                                                                      ₹<input type="text" name="p1" style="border: 0px" value="<%= price1 %>"/></td>
                                                                  <td> <% select1=Integer.parseInt(request.getParameter("select1")); %>
                                                           <input type="text" size="20" style="border: 0px;" name="s1" value="<%= select1 %>"/></td>   
                                                          
                                                                  <td> <% total1=price1*select1; %>
                                                                ₹<input type="text" size="20" style="border: 0px;" name="t1" value="<%= total1 %>"/></td>   
                                                         
                                                          </tr>
                                                          </table>
                                                        
                                                          
                                                          <br><br><br><br>
                                                          <%
}
if (c2 != null)
{
    
                                                     %>
                                                           
                                                          <table border="1" width="100%">
                                                              <tr>
                                                                  <td>Name</td>
                                                                  <td>Price</td>
                                                                  <td>Quantity</td>
                                                                  <td>Total Price</td>
                                                              </tr>
                                                              <tr>
                                                                  <td> <% name2=request.getParameter("name2"); %>
                                                                      <input type="text" size="20" style="border: 0px;" name="n2" value="<%= name2 %>"/></td>
                                                                  <td> <% price2=Integer.parseInt(request.getParameter("price2")); %>   
                                                                      ₹<input type="text" name="p2" style="border: 0px" value="<%= price2 %>"/></td>
                                                                  <td> <% select2=Integer.parseInt(request.getParameter("select2")); %>
                                                           <input type="text" size="20" style="border: 0px;" name="s2" value="<%= select2 %>"/></td>   
                                                          
                                                                  <td> <% total2=price2*select2; %>
                                                                ₹<input type="text" size="20" style="border: 0px;" name="t2" value="<%= total2 %>"/></td>   
                                                         
                                                          </tr>
                                                          </table>
                                                                <br><br><br><br>
                                                          
                                                        <%
}
if (c3 != null)
{
    
                                                     %> 
                                                          
                                                          <table border="1" width="100%">
                                                              <tr>
                                                                  <td>Name</td>
                                                                  <td>Price</td>
                                                                  <td>Quantity</td>
                                                                  <td>Total Price</td>
                                                              </tr>
                                                              <tr>
                                                                  <td> <% name3=request.getParameter("name3"); %>
                                                                      <input type="text" size="20" style="border: 0px;" name="n3" value="<%= name3 %>"/></td>
                                                                  <td> <% price3=Integer.parseInt(request.getParameter("price3")); %>   
                                                                      ₹<input type="text" name="p3" style="border: 0px" value="<%= price3 %>"/></td>
                                                                  <td> <% select3=Integer.parseInt(request.getParameter("select3")); %>
                                                           <input type="text" size="20" style="border: 0px;" name="s3" value="<%= select3 %>"/></td>   
                                                          
                                                                  <td> <% total3=price3*select3; %>
                                                                ₹<input type="text" size="20" style="border: 0px;" name="t3" value="<%= total3 %>"/></td>   
                                                         
                                                          </tr>
                                                          </table>
                                                        
                                                          <br><br><br><br>
                                                         <br>
                                                          <br>
                                                        <%
                                                            
}

if(c1 != null || c2 != null || c3 != null)
{
if(total1 != 0 && total2 != 0 && total3 != 0)
{
gt=total1+total2+total3;
out.println("Grand Total : ₹"+gt);
}
if(total1 != 0 && total2 == 0 && total3 != 0)
{
gt=total1+total3;
out.println("Grand Total : ₹"+gt);
}
if(total1 != 0 && total2 != 0 && total3 == 0)
{
gt=total1+total2;
out.println("Grand Total : ₹"+gt);
}
if(total1 != 0 && total2 == 0 && total3 == 0)
{
gt=total1;
out.println("Grand Total : ₹"+gt);
}

if(total1 == 0 && total2 != 0 && total3 != 0)
{
gt=total2+total3;
out.println("Grand Total : ₹"+gt);
}
if(total1 == 0 && total2 == 0 && total3 != 0)
{
gt=total3;
out.println("Grand Total : ₹"+gt);
}
if(total1 == 0 && total2 != 0 && total3 == 0)
{
gt=total2;
out.println("Grand Total : ₹"+gt);
}
ridd=Integer.parseInt(request.getParameter("ridd"));
%>
<input type="hidden" name='ridd' value="<%= ridd %>"/>
<br><br><br>
<%
out.println("<br><br><br><center><input type='submit' class='button2' value='Confirm Order'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='orders.jsp' class='button1'>Cancel Order</a></center>");

}
if(c1 == null && c2 == null && c3 == null)
{
%>
<center>
    
    <a href="orders.jsp" style="font-size: x-large;color: #990000;position: relative;top: 100px">ADD ITEMS TO YOUR CART</a>
</center>
                                                        <%
}
                                                        %></form><%
 /*Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
 stmt = con.createStatement();        
 LocalTime time=LocalTime.now();
 stmt.executeUpdate("insert into orders(name,price,quantity,time,cid) values ('"+name1+"','"+price1+"','"+select1+"','"+time+"',"+j+")");
 stmt.executeUpdate("insert into orders(name,price,quantity,time,cid) values ('"+name2+"','"+price2+"','"+select2+"','"+time+"',"+j+")");
 stmt.executeUpdate("insert into orders(name,price,quantity,time,cid) values ('"+name3+"','"+price3+"','"+select3+"','"+time+"',"+j+")");
 stmt.executeUpdate("delete from orders where name='null'");
 }*/
}

catch(NumberFormatException ex)
{
ex.getMessage();
}
   %>
   <%/*                 
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
                                                       */ %>
  <br><br>
  
   <% 
//}
                                                            %>
						</div>
					</div>
				</div>
			</div></div>
		</div>
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
                                        
                                        
					<li class="active">
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