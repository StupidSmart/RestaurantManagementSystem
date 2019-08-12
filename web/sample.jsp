<%-- 
    Document   : sample
    Created on : 22 Mar, 2018, 4:54:02 PM
    Author     : rhlru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="sample2.jsp" enctype="multipart/form-data">
            <input type="file" name="file" multiple>
            <input type="submit" value="yo">
        </form>
        <%
            int i=1;
            while(i<6)
            {
            String str="img";
            str=i+str;
            i++;
            out.println(str);
            }
        %>
    </body>
</html>
