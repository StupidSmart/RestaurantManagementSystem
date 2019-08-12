<%-- 
    Document   : comp
    Created on : 7 Apr, 2018, 8:29:16 PM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            try{  
            int oidd=Integer.parseInt(request.getParameter("oidd"));
            LocalTime time=LocalTime.now();
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           stmt.executeUpdate("update orders set comp_time='"+time+"' where comp_time is null and oid="+oidd+"");
           response.sendRedirect("comporders.jsp");
        }
        catch(SQLException e)
        {
            out.println(e.getMessage());
        }
        %>
    </body>
</html>
