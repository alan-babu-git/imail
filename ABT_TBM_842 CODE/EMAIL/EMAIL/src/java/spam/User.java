/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package spam;

import dataset.AESDecryption;
import dataset.AesEncryption;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author crisp
 */
public class User extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            Connection con=null;
    Statement st=null;
    ResultSet rs=null;  
Class.forName("com.mysql.jdbc.Driver"); 
AesEncryption aes=new AesEncryption();
AESDecryption des=new AESDecryption();
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spam","root","root");
st=con.createStatement();   
String t1=request.getParameter("t1");
String t2=request.getParameter("t2");
String h1=request.getParameter("h1");
String t3=request.getParameter("t3");
String t4=request.getParameter("t4");
String t5=request.getParameter("t5");
String t6=request.getParameter("t6");
String t7=request.getParameter("t7");
if(request.getParameter("b1")!=null)
{
    if(t1.equals("") || t2.equals("") ||t3.equals("")||t4.equals("")||t5.equals("")||t6.equals("")||t7.equals(""))
    {
        request.setAttribute("chk","chk");
          request.setAttribute("mes","Profile Fields Cannot Be Null");
        RequestDispatcher rd=request.getRequestDispatcher("User.jsp");
    rd.forward(request, response);
    }
    else
    {
       String qry="update signup set name='"+aes.toEncrypt(t1.getBytes())+
           "', gender='"+aes.toEncrypt(t2.getBytes())+
           "', dob='"+aes.toEncrypt(t3.getBytes())+
           "', addr='"+aes.toEncrypt(t4.getBytes())+
           "', pin='"+aes.toEncrypt(t5.getBytes())+
           "', cont='"+aes.toEncrypt(t6.getBytes())+
           "' where mail='"+aes.toEncrypt(h1.getBytes())+"'";
        int i=st.executeUpdate(qry);
        if(i!=0)
        {
           request.setAttribute("chk","chk");
          request.setAttribute("mes","Profile Updated");
        RequestDispatcher rd=request.getRequestDispatcher("User.jsp");
    rd.forward(request, response); 
        }
        else
        {
            request.setAttribute("chk","chk");
          request.setAttribute("mes","Profile Updation Failure");
        RequestDispatcher rd=request.getRequestDispatcher("User.jsp");
    rd.forward(request, response);
        }
    }
}
else
{
    RequestDispatcher rd=request.getRequestDispatcher("User.jsp");
    rd.forward(request, response);
}
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
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
