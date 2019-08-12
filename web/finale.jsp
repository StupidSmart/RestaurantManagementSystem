<%-- 
    Document   : finale
    Created on : 15 Apr, 2018, 3:54:47 PM
    Author     : Rahul Rupani
--%>

<%@page import="java.sql.DriverManager"%>
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
         <% 
             try{      
            int oidd=Integer.parseInt(request.getParameter("oidd"));
            Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
         stmt.executeUpdate("update orders set delivered=true where oid="+oidd+"");
         stmt.executeUpdate("commit;");
         response.sendRedirect("dborders.jsp");
             }
         catch(Exception ex)
         {
             
         }
             %>
    </body>
</html>
