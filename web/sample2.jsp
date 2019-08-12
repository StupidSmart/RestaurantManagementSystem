<%-- 
    Document   : sample2
    Created on : 22 Mar, 2018, 4:55:36 PM
    Author     : rhlru
--%>
<%@page import="java.util.Arrays"%>
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
         String path1;
         int i;   
         char msg[];
          String stri[]=new String[5];
          File file;
          int maxSize=500000;
          int maxFactSize=500000;
          String path="D:/Yo/restaurant management/res man/Restaurant management system/web/images";
          %>
          <%   
          String type=request.getContentType();
          //out.println(type);
          try
              {
          if(type.indexOf("multipart/form-data")>=0)
          {
           DiskFileItemFactory disFact=new DiskFileItemFactory();
           disFact.setSizeThreshold(maxFactSize);
           disFact.setRepository(new File("D:\\Yo"));
           ServletFileUpload upload=new ServletFileUpload(disFact);
           upload.setSizeMax(maxSize);
           List lis=upload.parseRequest(request);
           Iterator itr=lis.iterator();
           
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
               // Statement stmt = con.createStatement();
               //stmt.executeUpdate("insert into menus(menu1,menu2,menu3,menu4,menu5) values ('"+stri+"','"+stri+"','"+stri+"','"+stri+"','"+stri+"');");
                // response.sendRedirect("newrest.jsp");
              PreparedStatement ps=con.prepareStatement("insert into menus(menu1,menu2,menu3,menu4,menu5) values (?,?,?,?,?)");
              
            
                  i=0;
          while(itr.hasNext())
           {  
           FileItem item=(FileItem)itr.next();
            
           %><br><%
               
               if(!item.isFormField())
               {
               stri[i]=item.getName();
               
               //stri=item.getName();
             //  stri=stri+".jpg";
             
               file=new File(path,stri[i]);
               item.write(file);
             
              //out.println("Uploaded");
               }
              i++;
           } 
}  
/*while ((inLine2 = inputStream2.readLine()) != null) {
   tokens= inLine2.split(",");
    String fname = tokens[1];
    String path = "C:\\photos\\"+fname;
    File file = new File(path);           
    FileInputStream fs = new FileInputStream(file);
 
st2 = new StringTokenizer(inLine2, DELIM);
     
 
     
      stmt3.setString(1, tokens[0]);
   stmt3.setBinaryStream(2, fs, (int)(file.length()));
   stmt3.setString(3, tokens[2]);
   stmt3.setString(4, tokens[3]);
   stmt3.setString(5, tokens[4]);
   stmt3.execute(); //execute the prepared statement
   stmt3.clearParameters();


  */        
//out.println("Done");

          %>
          
          <% 
              /*try
              {*/
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
               // Statement stmt = con.createStatement();
               //stmt.executeUpdate("insert into menus(menu1,menu2,menu3,menu4,menu5) values ('"+stri+"','"+stri+"','"+stri+"','"+stri+"','"+stri+"');");
                // response.sendRedirect("newrest.jsp");*/
              PreparedStatement ps=con.prepareStatement("insert into menus(menu1,menu2,menu3,menu4,menu5) values (?,?,?,?,?)");
               
               ps.setString(1,stri[0]);
               ps.setString(2,stri[1]);
               ps.setString(3,stri[2]);
               ps.setString(4,stri[3]);
               ps.setString(5,stri[4]);
                /*ps.setString(6,stri);
                ps.setString(7,open_hrs);
                ps.setString(8,rating);
                ps.setString(9,minorder);
                ps.setString(10,cuisine);*/
                ps.executeUpdate();
                out.println("Done");
              
         %>
         
            <%
              }
              catch(SQLException e)
              {e.getMessage();}
              catch(ClassNotFoundException e)
              {e.getMessage();}
          
          %>
        
    </body>
</html>
