<%-- 
    Document   : cedit2
    Created on : 14 Apr, 2018, 4:04:01 PM
    Author     : Rahul Rupani
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
        <jsp:include page="welcome.jsp"></jsp:include> 
      
        <%!
         String str[]=new String[1];
              File file,file1;
                int maxSize=99950000;
                int maxFactSize=99950000;
                int i,j,cid;
                String fname,lname,mobile,address,img;
          String path="E:/RestaurantManagementSystem/web/image";
           Connection con;
           Statement stmt;
           ResultSet rs;
        %>
         <% String s3=(String)session.getAttribute("rname");
         Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
 stmt = con.createStatement();        
 rs=stmt.executeQuery("select * from customer where email='"+s3+"'");
while(rs.next())
{
    cid=rs.getInt("cid");
    img=rs.getString("image");
}
 %>

                <%
            
try{
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
           i=1;
           j=0;
          while(itr.hasNext())
           {   
           FileItem item=(FileItem)itr.next();
            if(item.getFieldName().equals("fname"))
               {
                   fname=item.getString();
               }
            if(item.getFieldName().equals("lname"))
               {
                   lname=item.getString();
               }
            if(item.getFieldName().equals("mobile"))
               {
                   mobile=item.getString();
               }
               if(item.getFieldName().equals("address"))
               {
                   address=item.getString();
               }
           if(!item.isFormField() && item.getFieldName().equals("image"))
               {
                   String str1=item.getName();
                   if(str1.equals(""))
                   {
                       str[0]=img;
                   }
                   else
                   {
                   str[0]=str1;
                   file=new File(str[0]);
                   file1=new File(path ,file.getName());
                   item.write(file1);
                   }
               }
           
           }
          }
          
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodie","root","");
            stmt = con.createStatement();
            stmt.executeUpdate("update customer set fname='"+fname+"',lname='"+lname+"',mobile='"+mobile+"',address='"+address+"',image='"+file.getName()+"' where cid="+cid+"");
             //response.sendRedirect("welcome.jsp");
             
                %>
                <script>
                alert("Profile Updated Successfully");
              </script> 
            
<%
           /*  PreparedStatement ps=con.prepareStatement("update customer set fname=?,lname=?,mobile=?,address=?,image=? where cid="+cid+"");
           ps.setString(1,fname);
ps.setString(2,lname);
ps.setString(3,mobile);
ps.setString(4,address);
ps.setString(5,str[0]);*/
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
   <%-- <jsp:include page="welcome.jsp"></jsp:include> --%> 
      
</body>
</html>
