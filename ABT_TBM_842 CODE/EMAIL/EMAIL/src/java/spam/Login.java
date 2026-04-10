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
import javax.servlet.http.HttpSession;

/**
 *
 * @author crisp
 */
public class Login extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if(request.getParameter("b1")!=null) {
                AesEncryption aes = new AesEncryption();
                AESDecryption des = new AESDecryption();
                con = DbConfig.getConnection();
                st = con.createStatement();
                String t1 = request.getParameter("t1");
                String t2 = request.getParameter("t2");
                if(t1.equals("") || t2.equals("")) {
                    request.setAttribute("chk", "chk");
                    request.setAttribute("mes", "Fill Required Fields");
                    RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                    rd.forward(request, response);
                } else if(t1.equals("admin") && t2.equals("admin")) {
                    RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
                    rd.forward(request, response);
                } else {
                    rs = st.executeQuery("select * from signup where mail='" + aes.toEncrypt(t1.getBytes()) + "' and pwd='" + aes.toEncrypt(t2.getBytes()) + "'");
                    if(rs.first()) {
                        String stat = rs.getString(9);
                        if(stat.equalsIgnoreCase("active")) {
                            HttpSession session = request.getSession(true);
                            session.setAttribute("name", des.toDeycrypt(rs.getString(1)));
                            session.setAttribute("mail", t1);
                            session.setAttribute("pass", t2);
                            RequestDispatcher rd = request.getRequestDispatcher("User.jsp");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("chk", "chk");
                            request.setAttribute("mes", "U have been blocked!");
                            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("chk", "chk");
                        request.setAttribute("mes", "Invalid Mail Id or Password");
                        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                        rd.forward(request, response);
                    }
                }
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("chk", "chk");
            request.setAttribute("mes", "DB Error: " + e.getMessage());
            try {
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
            } catch (Exception ex) {
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
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
        processRequest(request, response);
    }

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
