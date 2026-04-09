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
public class Pass extends HttpServlet {

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
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spam","root","root");
st=con.createStatement();   
String t1=request.getParameter("t1");
String t2=request.getParameter("t2");
String h1=request.getParameter("h1");    
AesEncryption aes=new AesEncryption();
AESDecryption des=new AESDecryption();
if(request.getParameter("b1")!=null)
{
    if(t1.equals("") || t2.equals(""))
    {
        request.setAttribute("chk","chk");
          request.setAttribute("mes","Password Fields Cannot Be Null");
        RequestDispatcher rd=request.getRequestDispatcher("Pass.jsp");
    rd.forward(request, response);
    }
    else
    {
        String qry="update signup set pwd='"+aes.toEncrypt(t2.getBytes())+"' where mail='"+aes.toEncrypt(h1.getBytes())+"' and pwd='"+aes.toEncrypt(t1.getBytes())+"'";
        int i=st.executeUpdate(qry);
        if(i!=0)
        {
           request.setAttribute("chk","chk");
          request.setAttribute("mes","Password Changed");
        RequestDispatcher rd=request.getRequestDispatcher("Pass.jsp");
    rd.forward(request, response); 
        }
        else
        {
            request.setAttribute("chk","chk");
          request.setAttribute("mes","Current Password Incorrect");
        RequestDispatcher rd=request.getRequestDispatcher("Pass.jsp");
    rd.forward(request, response);
        }
    }
}
else
{
    RequestDispatcher rd=request.getRequestDispatcher("Pass.jsp");
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
            Logger.getLogger(Pass.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Pass.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Pass.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Pass.class.getName()).log(Level.SEVERE, null, ex);
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
