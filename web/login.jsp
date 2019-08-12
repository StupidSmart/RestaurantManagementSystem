<%-- 
    Document   : login
    Created on : 11 Mar, 2018, 8:50:09 PM
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
        <title>login</title>
  
    </head>
    <body>
        <%
           String email = request.getParameter("email");
          
           String user = request.getParameter("user");
           
           String pass = request.getParameter("pass");
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
           Statement stmt = con.createStatement();
           if(user.equals("customer"))
           {
               
            
                
            ResultSet rs = stmt.executeQuery("select email,password from customer where email = '"+email+"' and password = '"+pass+"'"); 
            if(rs.next())
            {
             String r=rs.getString("email");
            session=request.getSession();  
            session.setAttribute("rname",r);
            response.sendRedirect("welcome.jsp");
            }
               else
               {
                %>
              <script>
                alert("Incorrect Email or Password!Try Again!");
              </script>
                   <jsp:include page="index.jsp"></jsp:include>
                  
                  <% 
               }
           }

          
        
          else if(user.equals("admin"))
           {
               if(email.equals("rhlrupani@gmail.com")&& pass.equals("password@123"))
               {
            ResultSet rs1 = stmt.executeQuery("select email,password from admin where email = '"+email+"' and password = '"+pass+"'"); 
            rs1.next();
            response.sendRedirect("admin.jsp");
               }else
               {
                   %><script>
                alert("Incorrect Email or Password!Try Again!");
              </script>
              <jsp:include page="index.jsp"></jsp:include>
                  <%
               }
        }
if(user.equals("staff"))
           {
            ResultSet rs1 = stmt.executeQuery("select sid,email,password,desig from staff where email = '"+email+"' and password = '"+pass+"'"); 
while(rs1.next())
{
String designation=rs1.getString("desig");
if(designation.equals("Chef"))
{
           String r1=rs1.getString("email");
            session=request.getSession();  
            session.setAttribute("cmail",r1);
            
            response.sendRedirect("chef.jsp");

}
else
{
            String r2=rs1.getString("email");
            session=request.getSession();  
            session.setAttribute("dbmail",r2);
            
response.sendRedirect("dboy.jsp");

}
}
               {
                   %><script>
                alert("Incorrect Email or Password!Try Again!");
              </script>
              <jsp:include page="index.jsp"></jsp:include>
                <%
               }
        }

        %>
    </body>
</html>
