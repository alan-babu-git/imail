package spam;

import dataset.AESDecryption;
import dataset.AesEncryption;
import java.io.InputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import org.apache.commons.io.FilenameUtils;

@MultipartConfig
public class sends extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            System.out.println("✅ Servlet reached");

            AesEncryption aes = new AesEncryption();
            AESDecryption des = new AESDecryption();

            con=DbConfig.getConnection();

            st = con.createStatement();

            String t1 = request.getParameter("t1"); // to
            String t2 = request.getParameter("t2"); // subject
            String t3 = request.getParameter("t3"); // message
            String t5 = request.getParameter("t5");
            String h1 = request.getParameter("h1");

            // ✅ FILE FIX
            Part filePart = request.getPart("t4");
            String fileName = filePart.getSubmittedFileName();
            InputStream fis = null;

            if (filePart != null && fileName != null && !fileName.equals("")) {
                fis = filePart.getInputStream();
            }

            String ext1 = "";
            if (fileName != null) {
                ext1 = FilenameUtils.getExtension(fileName);
            }

            if (t1 == null || t1.equals("")) {
                request.setAttribute("chk", "chk");
                request.setAttribute("mes", "Recipient Mail Id Required");
                RequestDispatcher rd = request.getRequestDispatcher("Send.jsp");
                rd.forward(request, response);
                return;
            }

            // ✅ FILE FORMAT CHECK
            if (fileName != null && !fileName.equals("")) {
                if (!(ext1.contains("doc") || ext1.contains("pdf"))) {
                    request.setAttribute("chk", "chk");
                    request.setAttribute("mes", "Only PDF/DOC allowed");
                    RequestDispatcher rd = request.getRequestDispatcher("Send.jsp");
                    rd.forward(request, response);
                    return;
                }
            }

            String to[] = t1.split(",");

            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("d-M-yyyy");
            SimpleDateFormat sdt = new SimpleDateFormat("hh:mm:ss a");

            String mdate = sdf.format(date);
            String time = sdt.format(date);

            int id = 0;

            rs = st.executeQuery("select max(id) from mails");
            if (rs.next()) {
                id = rs.getInt(1) + 1;
            }

            int success = 0;

            for (int i = 0; i < to.length; i++) {

                PreparedStatement pstmt = con.prepareStatement(
                        "insert into mails values (?, ?,?,?,?,?,?,?,?,?,?,?)");

                pstmt.setInt(1, id++);
                pstmt.setString(2, h1);
                pstmt.setString(3, to[i]);
                pstmt.setString(4, t2);
                pstmt.setString(5, t3);
                pstmt.setString(6, mdate);
                pstmt.setString(7, time);
                pstmt.setString(8, "successful");

                // ✅ FILE STORE SAFE
                if (fis != null) {
                    pstmt.setBinaryStream(9, fis);
                    pstmt.setString(10, fileName);
                } else {
                    pstmt.setNull(9, Types.BLOB);
                    pstmt.setString(10, "");
                }

                pstmt.setString(11, ext1);
                pstmt.setString(12, t5);

                pstmt.executeUpdate();

                success++;
            }

            request.setAttribute("chk", "chk");
            request.setAttribute("mes", "Mail Sent Successfully ✅ (" + success + ")");

            RequestDispatcher rd = request.getRequestDispatcher("Send.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("chk", "chk");
            request.setAttribute("mes", "Error: " + e.getMessage());

            RequestDispatcher rd = request.getRequestDispatcher("Send.jsp");
            rd.forward(request, response);

        } finally {
            out.close();
        }
    }

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
}