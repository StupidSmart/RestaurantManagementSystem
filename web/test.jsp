<%-- 
    Document   : test
    Created on : 23 Mar, 2018, 4:29:39 PM
    Author     : rhlru
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
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
        <%!
                String str;
                String rname;
                String contact;
                String contact2;
                String address;
                String avgcost;
                String open_hrs;
                String description;
                String ownername;
                String cuisine;
          File file;
          int maxSize=900000;
          int maxFactSize=900000;
          String path="D:/Yo/restaurant management/res man/Restaurant management system/web/image";
          %>
          <%   
              //rname=request.getParameter("rname");
              // contact=request.getParameter("contact");
                //contact2=request.getParameter("contact2");
                //address=request.getParameter("address");
                //avgcost=request.getParameter("avgcost");
                //open_hrs=request.getParameter("open_hrs");
                // rating=request.getParameter("rating");
                //minorder=request.getParameter("minorder");
                //cuisine=request.getParameter("cuisine");
          
          String type=request.getContentType();
          //out.println(type);
          if(type.indexOf("multipart/form-data")>=0)
          {
           DiskFileItemFactory disFact=new DiskFileItemFactory();
           disFact.setSizeThreshold(maxFactSize);
           disFact.setRepository(new File("D:\\Yo"));
           ServletFileUpload upload=new ServletFileUpload(disFact);
           upload.setSizeMax(maxSize);
           List lis=upload.parseRequest(request);
           Iterator itr=lis.iterator();
          while(itr.hasNext())
           {   
           FileItem item=(FileItem)itr.next();
            if(item.getFieldName().equals("rname"))
               {
                   rname=item.getString();
               }
               if(item.getFieldName().equals("contact"))
               {
                   contact=item.getString();
               }
               if(item.getFieldName().equals("contact2"))
               {
                   contact2=item.getString();
               }
               if(item.getFieldName().equals("address"))
               {
                   address=item.getString();
               }
               if(item.getFieldName().equals("avgcost"))
               {
                   avgcost=item.getString();
               }
               if(item.getFieldName().equals("open_hrs"))
               {
                   open_hrs=item.getString();
               }
               if(item.getFieldName().equals("desc"))
               {
                   description=item.getString();
               }
               if(item.getFieldName().equals("ownername"))
               {
                   ownername=item.getString();
               }
               if(item.getFieldName().equals("cuisine"))
               {
                   cuisine=item.getString();
               }
           %><br><%
               
               if(!item.isFormField())
               {
               str=item.getName();
             //  str=str+".jpg";
               file=new File(path,str);
               item.write(file);
               
              // out.println("Uploaded");
               
               }
           }
          }
          %>
          <%
              try
              {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
                Statement stmt = con.createStatement();
                //stmt.executeUpdate("insert into rest(rname,description,contact,contact2,address,avgcost,image,open_hrs,ownername,cuisine) values ('"+rname+"','"+description+"','"+contact+"','"+contact2+"','"+address+"','"+avgcost+"','"+str+"','"+open_hrs+"','"+ownername+"','"+cuisine+"');");
               // response.sendRedirect("newrest.jsp");
                PreparedStatement ps=con.prepareStatement("insert into rest(rname,description,contact,contact2,address,avgcost,image,open_hrs,ownername,cuisine) values (?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1,rname);
                ps.setString(2,description);
                ps.setString(3,contact);
                ps.setString(4,contact2);
                ps.setString(5,address);
                ps.setString(6,avgcost);
                ps.setString(7,str);
                ps.setString(8,open_hrs);
                ps.setString(9,ownername);
                ps.setString(10,cuisine);
                ps.executeUpdate();
                //out.println("Done");
          ResultSet rs=stmt.executeQuery("select rname from rest"); 
          while(rs.next())
          {
          String s=rs.getString("rname");
          if(s.equals(rname))
          {
          
              response.sendRedirect("congrats.jsp");
    }
          else
          {
                response.sendRedirect("Error.jsp");
              
          }
          } }
              catch(Exception e)
              {e.getMessage();}
%>         
         
    </body>
</html>
