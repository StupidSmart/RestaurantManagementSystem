<%-- 
    Document   : feedback
    Created on : 20 Mar, 2018, 8:57:17 AM
    Author     : rhlru
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            

 
           String name = request.getParameter("name");
           String email = request.getParameter("mail");
           String subject = request.getParameter("sub");
           String message = request.getParameter("area");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();       
           stmt.executeUpdate("insert into feedback(name,email,subject,message)values('"+name+"','"+email+"','"+subject+"','"+message+"') ");
           %>
              <script>
                alert("Feedback Sent Successfully");
              </script>
              <jsp:include page="contact.jsp"></jsp:include>
          
    </body>
</html>
