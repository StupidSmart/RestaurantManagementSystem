<%-- 
    Document   : delete
    Created on : 11 Mar, 2018, 8:50:09 PM
    Author     : rhlru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>delete</title>
    </head>
    <body>
                                                            <%
try{

         String email = request.getParameter("email");
          
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
         Statement stmt = con.createStatement();
         ResultSet rs=stmt.executeQuery("select email from staff");
         rs.next();
         if(!(email.equals("")))
         {
             stmt.execute("DELETE FROM staff WHERE email='"+email+"'");
             
         
              %> 
              <script>
                alert("Records Deleted successfully!");
              </script>
              <jsp:include page="deletestaff.jsp"></jsp:include>
             
         <%
       }
    else
{


              %> 
              <script>
                alert("Invalid Record!");
              </script>
              <jsp:include page="deletestaff.jsp"></jsp:include>
             
         <%
       }
      }catch(Exception e){}
    
     %>
    </body>
</html>
