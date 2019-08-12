<%-- 
    Document   : deleteorder
    Created on : 7 Apr, 2018, 12:48:12 PM
    Author     : rhlru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%   try{      
            Integer oidd=Integer.parseInt(request.getParameter("oid"));
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           stmt.executeUpdate("delete from orders where oid="+oidd+"");
        response.sendRedirect("myorders.jsp");

        } 
        catch(Exception e)
          {
        e.getMessage();     
        }
        %>
          
    </body>
</html>
