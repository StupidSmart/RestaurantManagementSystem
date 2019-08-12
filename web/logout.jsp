<%-- 
    Document   : logout
    Created on : 11 Mar, 2018, 8:50:09 PM
    Author     : rhlru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout</title>
<!--    <script src="js/jquery-3.3.1.min.js"></script>
        <script>
            function preventBack()
            {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload=function(){ null; };
         </script>
-->        
    </head>
    
    <body>
        <%
          //  response.setHeader("Cache-control","no-cache, no-store, must-revalidate");
            session.invalidate();
            response.sendRedirect("index.jsp");
        
        
        %>
       <%-- <jsp:include page="index.jsp"></jsp:include> --%>
    </body>
</html>
