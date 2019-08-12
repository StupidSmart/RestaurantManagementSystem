<%-- 
    Document   : register
    Created on : 27 Feb, 2018, 1:04:11 AM
    Author     : rhlru
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
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
           String mail="";
           String fname = request.getParameter("fname");
           String lname = request.getParameter("lname");
           String email = request.getParameter("email");
           String pass = request.getParameter("pass");
           String cont = request.getParameter("cont");
           String add = request.getParameter("add");
           String cpass = request.getParameter("cpass");
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           ResultSet rs=stmt.executeQuery("select email from customer where email='"+email+"'");
           if(rs.next())
           { %>
              <script>
                alert("Email already exists!Try Again!");
              </script>
              <jsp:include page="registration.jsp"></jsp:include>
               <%
           }


          else if(!(pass.equals(cpass)))
           {
              %>
              <script>
                alert("Passwords don't match!Try Again!");
              </script>
              <jsp:include page="registration.jsp"></jsp:include>
               <%
           }

 
           else
           {
              stmt.executeUpdate("insert into customer(fname,lname,email,password,mobile,address)values('"+fname+"','"+lname+"','"+email+"','"+pass+"','"+cont+"','"+add+"') ");
           %>
              <script>
                alert("Registered Successfully !!Click Ok to Login");
              </script>
              <jsp:include page="index.jsp"></jsp:include>
          
          <%
              }
}


catch(SQLException e)
{
e.getMessage();
}
catch(ClassNotFoundException ex)
{
ex.getMessage();
}
          %>
    </body>
</html>
