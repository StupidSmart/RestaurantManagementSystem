/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Oops
 */
public class register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String fname = request.getParameter("fname");
           String lname = request.getParameter("lname");
           String email = request.getParameter("email");
           String pass = request.getParameter("pass");
           String mobile = request.getParameter("cont");
           String add = request.getParameter("add");
           String cpass = request.getParameter("cpass");
           String name=fname+" "+lname;
           Integer cont=Integer.parseInt(mobile);
           
           MyDB db = new MyDB();
           Connection con =db.getCon();
           Statement stmt = con.createStatement();
          if(!(fname.equals("")||lname.equals("")||email.equals("")||pass.equals("")||cpass.equals("")||cont.equals("")||add.equals("")))
          {
           if(pass.equals(cpass))
           {
          stmt.executeUpdate("insert into customer(fname,lname,email,password,mobile,address)values('"+fname+"','"+lname+"','"+email+"','"+pass+"',"+cont+",'"+add+"') ");
           
           out.println("register sucess"+"<br><br><a href='index.html'>login here</a>");
          /*  String redirectedPage = "/parentPage";
          response.sendRedirect("registrationsuccess.jsp");*/
          }
           else
           {
               out.println("Passwords Dont match");
           }
          }
          else
           {
               out.println("Cant leave any field blank");
           }
          } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
