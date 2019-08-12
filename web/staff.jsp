<%-- 
    Document   : staff
    Created on : 11 Mar, 2018, 8:50:09 PM
    Author     : rhlru
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>staff</title>
    </head>
    <body>
                 <%
try{
String mail="";
String name =request.getParameter("name");
String email =request.getParameter("email");
String password =request.getParameter("pass");
String mob =request.getParameter("mob");
String desig =request.getParameter("desig");
          
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
         Statement stmt = con.createStatement();
        ResultSet rs=stmt.executeQuery("select email from staff where email='"+email+"'");
        if(rs.next())
{     
    
       %> 
       <script>
          alert("Cannot insert this record!!Already a Staff Member!");
          </script>
          <jsp:include page="addstaff.jsp"></jsp:include>
  <%
}

else
{
    
    stmt.executeUpdate("insert into staff (name,email,password,mobile,desig)values('"+name+"','"+email+"','"+password+"','"+mob+"','"+desig+"')");
         %> 
         <script>
          alert("Records Inserted successfully!");
          </script>
          <jsp:include page="addstaff.jsp"></jsp:include>
  <%
}
}
catch(ClassNotFoundException ex)
{ex.getMessage();}
catch(SQLException e)
{e.getMessage();}
    
     %>
    </body>
</html>
