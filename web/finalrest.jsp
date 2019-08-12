<%-- 
    Document   : finalrest
    Created on : 22 Mar, 2018, 4:12:13 PM
    Author     : rhlru
--%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.util.Arrays"%>
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
        <jsp:include page="admin.jsp"></jsp:include> 
        <%!
                int i,j;
                String str[]=new String[10];
                String str1[]=new String[5];
                String name;
                String name2;
                String name3;
                String price;
                String price2;
                String price3;
                String moreinfo1;
                String moreinfo2;
                String moreinfo3;
                String moreinfo4;
                String moreinfo5;
                 //String minorder;
                //String cuisine;
                File file,file1;
                int maxSize=99950000;
                int maxFactSize=99950000;
          String path="E:/RestaurantManagementSystem/web/image";
          %>
          <%   
              //rname=request.getParameter("rname");
              // contact=request.getParameter("contact");
                //moreinfo2=request.getParameter("moreinfo2");
                //moreinfo3=request.getParameter("moreinfo3");
                //moreinfo4=request.getParameter("moreinfo4");
                //moreinfo5=request.getParameter("moreinfo5");
                // moreinfo1=request.getParameter("moreinfo1");
                //minorder=request.getParameter("minorder");
                //cuisine=request.getParameter("cuisine");
          
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
           i=1;
           j=0;
          while(itr.hasNext())
           {   
           FileItem item=(FileItem)itr.next();
            if(item.getFieldName().equals("name"))
               {
                   name=item.getString();
               }
            if(item.getFieldName().equals("name2"))
               {
                   name2=item.getString();
               }
            if(item.getFieldName().equals("name3"))
               {
                   name3=item.getString();
               }
               if(item.getFieldName().equals("price1"))
               {
                   price=item.getString();
               }
               if(item.getFieldName().equals("price2"))
               {
                   price2=item.getString();
               }
               if(item.getFieldName().equals("price3"))
               {
                   price3=item.getString();
               }
               if(item.getFieldName().equals("moreinfo2"))
               {
                   moreinfo2=item.getString();
               }
               if(item.getFieldName().equals("moreinfo3"))
               {
                   moreinfo3=item.getString();
               }
               if(item.getFieldName().equals("moreinfo4"))
               {
                   moreinfo4=item.getString();
               }
               if(item.getFieldName().equals("moreinfo5"))
               {
                   moreinfo5=item.getString();
               }
               if(item.getFieldName().equals("moreinfo1"))
               {
                   moreinfo1=item.getString();
               }
              // if(item.getFieldName().equals("minorder"))
               //{
                //   minorder=item.getString();
              // }
               //if(item.getFieldName().equals("cuisine"))
              // {
                //   cuisine=item.getString();
               //}
           %><br><%
               if(!item.isFormField() && item.getFieldName().equals("file"))
               {
                   str[0]=item.getName();
                   file=new File(str[0]);
                   file1=new File(path ,file.getName());
                   item.write(file1);
               
               }  
               if(!item.isFormField() && item.getFieldName().equals("file1"))
               {
        //           for(String s:str)
          //         {
            //        if(s == null && s.length() <= 0)
              //     {
                 //  str[i]="No Image to display";
                   //}
                  // }
               str[i]=item.getName();
             //  str=str+".jpg";
               file=new File(str[i]);
               file1=new File(path,file.getName());
               item.write(file1);
               i++;
               }
               if(!item.isFormField() && item.getFieldName().equals("menu1"))
               {
        //           for(String s:str)
          //         {
            //        if(s == null && s.length() <= 0)
              //     {
                 //  str[i]="No Image to display";
                   //}
                  // }
               str1[j]=item.getName();
               
             //  str=str+".jpg";
               file=new File(str[j]);
               file1=new File(path,file.getName());
               item.write(file1);
               
               j++;
              
               
               }
           }

                
}
}
catch(ArrayIndexOutOfBoundsException e)
{
out.println("Only 9 images and 5 menus are allowed");
e.getMessage();
}
              catch(FileNotFoundException ex)
{
ex.getMessage();
}

          %>
          <%
              try
              {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
                //Statement stmt = con.createStatement();
                //stmt.executeUpdate("insert into food(category,name,price) values ('"+str+"','"+name+"','"+price+"');");
                //stmt.executeUpdate("insert into images(image1,image2,image3,image4,image5,image6,image7,image8,image9) values ('"+str+"','"+str+"','"+str+"','"+str+"','"+str+"','"+str+"','"+str+"','"+str+"','"+str+"');");
               // stmt.executeUpdate("insert into menus(menu1,menu2,menu3,menu4,menu5) values ('"+str+"','"+str+"','"+str+"','"+str+"','"+str+"');");
                //stmt.executeUpdate("insert into moreinfos(moreinfo1,moreinfo2,moreinfo3,moreinfo4,moreinfo5) values ('"+moreinfo1+"','"+moreinfo2+"','"+moreinfo3+"','"+moreinfo4+"','"+moreinfo5+"');");
               // response.sendRedirect("newrest.jsp");
               PreparedStatement ps;
                          
                
                
               ps=con.prepareStatement("insert into food(category,name1,name2,name3,price1,price2,price3) values (?,?,?,?,?,?,?)");
                file=new File(str[0]);

                ps.setString(1,file.getName());
                ps.setString(2,name);
                ps.setString(3,name2);
                ps.setString(4,name3);
                ps.setString(5,price);
                ps.setString(6,price2);
                ps.setString(7,price3);
                ps.executeUpdate();
                
               ps=con.prepareStatement("insert into images(image1,image2,image3,image4,image5,image6,image7,image8,image9) values (?,?,?,?,?,?,?,?,?)");
               for(int i=1;i<=9;i++)
               {
                file=new File(str[i]);
                ps.setString(i,file.getName());
                
               }
                /*ps.setString(2,str[2]);
                ps.setString(3,str[3]);
                ps.setString(4,str[4]);
                ps.setString(5,str[5]);
                ps.setString(6,str[6]);
                ps.setString(7,str[7]);
                ps.setString(8,str[8]);
                ps.setString(9,str[9]);*/
                //ps.setInt(10,1);
                ps.executeUpdate();
                
                ps=con.prepareStatement("insert into menus(menu1,menu2,menu3,menu4,menu5) values (?,?,?,?,?)");
                for(int i=0;i<=4;i++)
                {
                 file=new File(str[i]);
                 ps.setString(i+1,file.getName());
                
                }
                /*ps.setString(1,str1[0]);
                ps.setString(2,str1[1]);
                ps.setString(3,str1[2]);
                ps.setString(4,str1[3]);
                ps.setString(5,str1[4]);*/
                //ps.setInt(6,1);
                ps.executeUpdate();
                
                ps=con.prepareStatement("insert into moreinfos(moreinfo1,moreinfo2,moreinfo3,moreinfo4,moreinfo5) values (?,?,?,?,?)");
                
                ps.setString(1,moreinfo1);
                ps.setString(2,moreinfo2);
                ps.setString(3,moreinfo3);
                ps.setString(4,moreinfo4);
                ps.setString(5,moreinfo5);
                //ps.setInt(6,1);
                ps.executeUpdate();
                
               // out.println("Done");
           //ResultSet rs=stmt.executeQuery("select image from rest"); 
          //rs.next();
         %>
         
              <script>
                alert("Congrats on Adding another Restaurant!");
              </script> 
            <%
              }
              catch(Exception e)
              {e.getMessage();}
          
          %>
          
    </body>
</html>