<%-- 
    Document   : process
    Created on : 7 Apr, 2018, 5:34:11 AM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
          Connection con;
          Statement stmt;
          ResultSet rs;
          String s3,name1,name2,name3,price1,price2,price3,select1,select2,select3,total1,total2,total3;
           int j,ridd;
        %>
        <%
            try
            {
           s3=(String)session.getAttribute("rname");
          ridd=Integer.parseInt(request.getParameter("ridd"));
           out.println(ridd);
          
 Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
 stmt = con.createStatement();    
 ResultSet rs=stmt.executeQuery("select * from customer where email='"+s3+"'");
 
while(rs.next())
{
j=rs.getInt("cid");
}
           name1=request.getParameter("n1");
            //out.println(name1+"<br>");
            price1=request.getParameter("p1");
           // out.println(price1+"<br>");
            select1=request.getParameter("s1");
            //out.println(select1+"<br>");
            total1=request.getParameter("t1");
            //out.println(total1+"<br>");
            
            name2=request.getParameter("n2");
           // out.println(name2+"<br>");
            price2=request.getParameter("p2");
           // out.println(price2+"<br>");
            select2=request.getParameter("s2");
           // out.println(select2+"<br>");
            total2=request.getParameter("t2");
           // out.println(total2+"<br>");
            
            name3=request.getParameter("n3");
          //  out.println(name3+"<br>");
            price3=request.getParameter("p3");
           // out.println(price3+"<br>");
            select3=request.getParameter("s3");
           // out.println(select3+"<br>");
            total3=request.getParameter("t3");
           // out.println(total3+"<br>");
           
 LocalTime time=LocalTime.now();
 stmt.executeUpdate("insert into orders(name,price,quantity,time,cid,rid) values ('"+name1+"','"+total1+"','"+select1+"','"+time+"',"+j+","+ridd+")");
 stmt.executeUpdate("insert into orders(name,price,quantity,time,cid,rid) values ('"+name2+"','"+total2+"','"+select2+"','"+time+"',"+j+","+ridd+")");
 stmt.executeUpdate("insert into orders(name,price,quantity,time,cid,rid) values ('"+name3+"','"+total3+"','"+select3+"','"+time+"',"+j+","+ridd+")");
 stmt.executeUpdate("delete from orders where name='null'");
 response.sendRedirect("myorders.jsp");
 }
//}

catch(Exception ex)
{
out.println(ex.getMessage());
}
%>
    </body>
</html>
