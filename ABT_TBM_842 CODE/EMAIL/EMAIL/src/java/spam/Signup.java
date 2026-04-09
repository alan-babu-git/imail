/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package spam;

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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author crisp
 */
public class Signup extends HttpServlet {

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
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            AesEncryption aes=new AesEncryption();
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spam","root","root");
st=con.createStatement();
String t1=request.getParameter("t1");
String demo1=request.getParameter("demo1");
String t2=request.getParameter("t2");
String t3=request.getParameter("t3");
String t4=request.getParameter("t4");
String t5=request.getParameter("t5");
String t6=request.getParameter("t6");
String t7=request.getParameter("t7");
if(request.getParameter("b1")!=null)
{
    if(t1.equals("")||demo1.equals("")||t2.equals("")||t3.equals("")||t4.equals("")||t5.equals("")||t6.equals("")||t7.equals(""))
    {
        request.setAttribute("chk","chk");
        request.setAttribute("mes","Fill Required Fields");
        RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
        rd.forward(request, response);
    }
    else
    {
        rs=st.executeQuery("select mail from signup where mail='"+t6+"'");
        if(rs.first())
        {
            request.setAttribute("chk","chk");
        request.setAttribute("mes","Mail Id Already Exists");
        RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
        rd.forward(request, response);
        }
        else
        {
            Pattern p1=Pattern.compile(".+@imail\\.com");
            Matcher m1=p1.matcher(t6);
            boolean flag=m1.matches();
            if(flag)
            {
                String qry="insert into signup values('"+aes.toEncrypt(t1.getBytes())+"','"+aes.toEncrypt(t2.getBytes())+"','"+aes.toEncrypt(demo1.getBytes())+"','"+aes.toEncrypt(t3.getBytes())+"','"+aes.toEncrypt(t4.getBytes())+"','"+aes.toEncrypt(t5.getBytes())+"','"+aes.toEncrypt(t6.getBytes())+"','"+aes.toEncrypt(t7.getBytes())+"','active')";
                int i=st.executeUpdate(qry);
                if(i!=0)
                {
        request.setAttribute("chk","chk");
        request.setAttribute("mes","Registration Success");
        RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
        rd.forward(request, response);
                }
                else
                {
        request.setAttribute("chk","chk");
        request.setAttribute("mes","Signup Failed");
        RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
        rd.forward(request, response);
                }
            }
            else
            {
                request.setAttribute("chk","chk");
        request.setAttribute("mes","Mail id Format: XXXX@imail.com");
        RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
        rd.forward(request, response);
            }
        }
    }
}
else
{
    RequestDispatcher rd=request.getRequestDispatcher("Signup.jsp");
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
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
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
