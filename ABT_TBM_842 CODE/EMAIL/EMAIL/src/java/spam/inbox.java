/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package spam;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author ADMIN
 */
public class inbox extends HttpServlet {

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
        PrintWriter out = response.getWriter();
         try {

            String url1;

            HttpSession so = request.getSession(true);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spam", "root", "root");
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            Statement st4 = con.createStatement();
            Statement st5 = con.createStatement();
            Statement st6 = con.createStatement();
            int size;
            int flag = 0;
            String a11 = request.getParameter("a1");
            String a12 = request.getParameter("a2");

            String b = request.getParameter("b");
            String b1 = request.getParameter("b1");
            String a1 = "", a2 = "", phone = "";
           
        
              if (request.getParameter("t2") != null) {
  String b2 = "";
                System.out.println("select * from mails where id='"+request.getParameter("t2")+"'");
               ResultSet rs1 = (ResultSet) st1.executeQuery("select * from mails where id='"+request.getParameter("t2")+"'");
            if (rs1.next())
            {
                b2 ="Subject : "+ rs1.getString(4)+"Subject : "+ rs1.getString(4)+"  Message :"+ rs1.getString(5);
                System.out.println(b2);
            }
              //  TextToSpeech as=new TextToSpeech(b2.toString());
//            }    TextSpeech as=new  TextSpeech();
//as.TextSpeech(b2);
//            try {
//			// Set property as Kevin Dictionary
//			System.setProperty(
//				"freetts.voices",
//				"com.sun.speech.freetts.en.us"
//					+ ".cmu_us_kal.KevinVoiceDirectory");
//
//			// Register Engine
//			Central.registerEngineCentral(
//				"com.sun.speech.freetts"
//				+ ".jsapi.FreeTTSEngineCentral");
//
//			// Create a Synthesizer
//			Synthesizer synthesizer
//				= Central.createSynthesizer(
//					new SynthesizerModeDesc(Locale.US));
//
//			// Allocate synthesizer
//			synthesizer.allocate();
//
//			// Resume Synthesizer
//			synthesizer.resume();
//
//			// Speaks the given text
//			// until the queue is empty.
//			synthesizer.speakPlainText(
//				b2, null);
//			synthesizer.waitEngineState(
//				Synthesizer.QUEUE_EMPTY);
//
//			// Deallocate the Synthesizer.
//			synthesizer.deallocate();
//		}
//
//		catch (Exception e) {
//			e.printStackTrace();
//		}
//             Speech sa11 = new Speech("Welcome to Sign language website");
//            Speech sa1 = new Speech(b2);
            request.setAttribute("ok", "1");
              request.setAttribute("msg", b2);
            
           RequestDispatcher rs = request.getRequestDispatcher("Inbox.jsp");
                    rs.forward(request, response);

            }else if(request.getParameter("t3")!=null)
{

    RequestDispatcher rd=request.getRequestDispatcher("Inbox.jsp");
    rd.forward(request, response);
}else if(request.getParameter("t4")!=null)
{
    
                   ResultSet rs11=st1.executeQuery("select * from mails where id='"+request.getParameter("a1")+"' and rcode='"+request.getParameter("a2")+"'");
			if(rs11.next())
			{
        if(rs11.getString(11).equalsIgnoreCase("doc")){
				
            
              
				byte[] byteArray = new byte[1048576];
				InputStream Asset = rs11.getBinaryStream(9);
				//request.setAttribute("Asset", Asset);
				response.reset();
				//response.setContentType("image/jpeg");
				response.setContentType("text/doc");
				while((size=Asset.read(byteArray))!=-1)
				{
					response.getOutputStream().write(byteArray, 0, size);	
				}
                       
                           
                            }else  if(rs11.getString(11).equalsIgnoreCase("pdf")){
                                   
				byte[] byteArray = new byte[1048576];
				InputStream Asset = rs11.getBinaryStream(9);
				//request.setAttribute("Asset", Asset);
				response.reset();
				//response.setContentType("image/jpeg");
				response.setContentType("application/pdf");
				while((size=Asset.read(byteArray))!=-1)
				{
					response.getOutputStream().write(byteArray, 0, size);	
			
                        }
                           
                            }   
//        RequestDispatcher rs21 = request.getRequestDispatcher("Inbox.jsp");
//                rs21.forward(request, response);
                        }
 
}else {
                RequestDispatcher rs21 = request.getRequestDispatcher("Inbox.jsp");
                rs21.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
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
