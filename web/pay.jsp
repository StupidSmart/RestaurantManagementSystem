<%-- 
    Document   : pay
    Created on : 25 Mar, 2018, 10:52:48 AM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalTime"%>
<%@page contentType="appplication/msword" pageEncoding="UTF-8"%>

   <%
      try{      
            int oidd=Integer.parseInt(request.getParameter("oidd"));
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           ResultSet rs=stmt.executeQuery("select * from orders,customer,rest where orders.oid="+oidd+" and customer.cid=orders.cid and rest.rid=orders.rid");
           while(rs.next())
           { 
            if(rs.getTime("comp_time")!= null)
{
 int i=Integer.parseInt(rs.getString("price"));
 double j= 0.18 * i ;
 double k=i+j;
%>
  THANK YOU FOR ORDERING FROM FOODIE :)
  
-----------------------------------------------------------------------------------

                  ORDER DETAILS
-----------------------------------------------------------------------------------                    
           ITEM NAME : <%= rs.getString("name") %>
          ITEM PRICE : ₹<%= rs.getString("price") %>
            QUANTITY : <%= rs.getString("quantity") %>
          ORDER TIME : <%= rs.getTime("time") %>
        ORDERED FROM : <%= rs.getString("rname") %>
          ORDERED By : <%= rs.getString("fname")+" "+rs.getString("lname") %> 
  CUSTOMER'S CONTACT : <%= rs.getString("mobile") %> 
  CUSTOMER'S ADDRESS : <%= rs.getString("customer.address") %>  
         PREPARED AT : <%= rs.getTime("comp_time") %>  
 TOTAL AMOUNT PAYABLE AFTER ADDING GST =  ₹<%= k %>.

----------------------------------------------------------------------------------- 
 
 WE HOPE YOU ORDER FROM US AGAIN :)
        <%
           }
else
{
%>
<p style="font-size: x-large;position: absolute;top: 400px;right: 520px;">No Orders Completed</p>   
            <%
}
           }
            }
            catch(SQLException e)
            {
 out.println(e.getMessage());
}           catch(ClassNotFoundException e)
            {
 out.println(e.getMessage());
}
            
        %>
	