/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package spam;
import dataset.AESDecryption;
import dataset.AesEncryption;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Loginn
 */
public class sends extends HttpServlet {

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
         Connection con=null;
    Statement st=null,st1=null;
    ResultSet rs,rs2,rs1,rs3,rs4,rs5=null;

        try {    AesEncryption aes=new AesEncryption();AESDecryption des=new AESDecryption();
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spam","root","root");
st=con.createStatement();
String t1=request.getParameter("t1");
String t2=request.getParameter("t2");
String t3=request.getParameter("t3");
String t4="D:\\"+request.getParameter("t4");
String t5=request.getParameter("t5");
String h1=request.getParameter("h1");
int id=0;
if(request.getParameter("b1")!=null)
{
    if(t1.equals(""))
    {
        request.setAttribute("chk", "chk");
        request.setAttribute("mes", "Recipient Mail Id Required");
       RequestDispatcher rd=request.getRequestDispatcher("Send.jsp");
    rd.forward(request, response); 
    }
    else
    {
        File file = new File(t4);
                FileInputStream fis = new FileInputStream(file);
                String ext1 = FilenameUtils.getExtension(t4);
                if((ext1.contains("doc"))||(ext1.contains("pdf"))){
                            boolean flag5=false,flag6=false;
        String to[]=t1.split(",");
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("d-M-yyyy");
        SimpleDateFormat sdt=new SimpleDateFormat("hh:mm:ss a");
        String mdate=sdf.format(date);
        String time=sdt.format(date);
        String jj="", jj1="";
        int del=0,undel=0,i2=0,i3=0;  
        rs4=st.executeQuery("select COUNT(typ) from mails WHERE mto='"+h1+"'and typ='spam' ");
            if(rs4.next())
            {
               i2=Integer.parseInt(rs4.getString(1));
            }
            if(i2>=20){
                request.setAttribute("chk", "chk");
        request.setAttribute("mes", "Please delete Spam Mail Contain more than 20 mail ");
       RequestDispatcher rd=request.getRequestDispatcher("Send.jsp");
    rd.forward(request, response);
            }else{
                  rs2=st.executeQuery("select max(id) from mails ");
            if(rs2.next())
            {
                id=Integer.parseInt(rs2.getString(1))+1;
            }
               String as="";
                rs1=st.executeQuery("select * from spams");
        while(rs1.next())
        {
            as=rs1.getString(1)+"," +as;
            
        }
        System.out.println(as);
        if(t2.contains(as))
                  {
                      flag5=true;
                  }
                  if(t3.contains(as))
                  {
                      flag5=true;
                  }
                  StringBuffer as1 = new StringBuffer();
             rs2=st.executeQuery("select * from negwords");
        while(rs2.next())
        {
              // String spamw[]={"4u","offer","kill","bom","guarantee","free","profite","terror","risk","casino","mass","urgent","gun","knife"};
        
        
        //    as1.append(rs2.getString(1)+" ,");
//             System.out.println(as1);
                if((t2.contains(rs2.getString(1)))||(t3.contains(rs2.getString(1))))
                  {
                      flag6=true;
                      i2++;
                  }
        }
         System.out.println(as1);
    
                
                    System.out.println("flag6 : "+flag6);
        for(int i=0;i<to.length;i++)
        {
          
             if(flag5)
              {
                   rs2=st.executeQuery("select max(id) from mails ");
            if(rs2.next())
            {
                id=Integer.parseInt(rs2.getString(1))+1;
            }  
                long filesize = file.length();
		long filesizeInKB = filesize / 1024;
                
         		System.out.println("Size of File is: " + filesizeInKB + " KB");  
                 // String qry="insert into mails values('"+id+"','"+h1+"','"+to[i]+"','"+t2+"','"+t3+"','"+mdate+"','"+time+"','spam')";
            PreparedStatement pstmt = con.prepareStatement("insert into mails values (?, ?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, id);
                pstmt.setString(2, h1);
           
                pstmt.setString(3, to[i]);
                pstmt.setString(4, t2);
                pstmt.setString(5, t3);
                pstmt.setString(6, mdate);
                pstmt.setString(7, time);
                pstmt.setString(8, "spam");    
                pstmt.setBinaryStream(9, fis, file.length());
                pstmt.setString(10, file.getName());
                 pstmt.setString(11, ext1); pstmt.setString(12, t5);
                    pstmt.executeUpdate();
             del++;
              }else if(flag6)
              {
                   rs2=st.executeQuery("select max(id) from mails ");
            if(rs2.next())
            {
                id=Integer.parseInt(rs2.getString(1))+1;
            }
            System.out.println( " update signup set status='Inactive' where mail='"+aes.toEncrypt(h1.getBytes())+"'");
                    st.executeUpdate( "update signup set status = 'Inactive' where mail = '"+aes.toEncrypt(h1.getBytes())+"' ");
                 // String qry="insert into mails values('"+id+"','"+h1+"','"+to[i]+"','"+t2+"','"+t3+"','"+mdate+"','"+time+"','spams')";
           //st.executeUpdate("insert into mails values('"+id+"','"+h1+"','"+to[i]+"','"+t2+"','"+t3+"','"+mdate+"','"+time+"','spams')");
             PreparedStatement pstmt = con.prepareStatement("insert into mails values (?, ?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, id);
                pstmt.setString(2, h1);
           
                pstmt.setString(3, to[i]);
                pstmt.setString(4, t2);
                pstmt.setString(5, t3);
                pstmt.setString(6, mdate);
                pstmt.setString(7, time);
                pstmt.setString(8, "spam");    
                pstmt.setBinaryStream(9, fis, file.length());
                pstmt.setString(10, file.getName());
                 pstmt.setString(11, ext1); pstmt.setString(12, t5);
                    pstmt.executeUpdate(); del++;
              }
              else
              {
          
            
            rs=st.executeQuery("select mail from signup where mail='"+aes.toEncrypt(to[i].getBytes())+"'");
            if(rs.first())
            {
                String text =t3;
                String line="";
              text=text.replaceAll("[^a-zA-Z ]", " ");
              
              
              
                
              String fun[]={" to "," with "," of "," at "," in "," without "," between "," the "," a "," that "," my "," more "," much "," either "," neither "," and "," that "," when "," while "," although "," or "," is "," am "," are "," have "," got "," do "," no "," not "," nor "," as "," but "," yet "," still "};
              
              int len=fun.length;  
              line=text.replaceAll(fun[0]," ");
              
              for(int j=0;j<len;j++)
                {
                line=line.replaceAll(fun[j]," ");
                }      
              
            // String qry="insert into mails values('"+id+"','"+h1+"','"+to[i]+"','"+t2+"','"+line+"','"+mdate+"','"+time+"','successful')";
              PreparedStatement pstmt = con.prepareStatement("insert into mails values (?, ?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, id);
                pstmt.setString(2, h1);
           
                pstmt.setString(3, to[i]);
                pstmt.setString(4, t2);
                pstmt.setString(5, line);
                pstmt.setString(6, mdate);
                pstmt.setString(7, time);
                pstmt.setString(8, "successful");    
                pstmt.setBinaryStream(9, fis, file.length());
                pstmt.setString(10, file.getName());
                 pstmt.setString(11, ext1);pstmt.setString(12, t5);
                    pstmt.executeUpdate();
             
            // st.executeUpdate(qry);
             del++;
              
            }
            else
            {
                String df="Delivery Failed To : "+to[i];
               //String qry="insert into mails values('"+id+"','"+h1+"','"+h1+"','"+to[i]+"','"+df+"','Error In Sending Mail','"+mdate+"','"+time+"','undelivered')";
            PreparedStatement pstmt = con.prepareStatement("insert into mails values ( ?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, id);
                pstmt.setString(2, h1);
           
                pstmt.setString(3, h1);
                pstmt.setString(4, to[i]);
                pstmt.setString(5, df);
                pstmt.setString(6, mdate);
                pstmt.setString(7, time);
                pstmt.setString(8, "undelivered");    
                pstmt.setBinaryStream(9, fis, file.length());
                pstmt.setString(10, file.getName());
                 pstmt.setString(11, ext1);pstmt.setString(12, t5);
                    pstmt.executeUpdate();

//  st.executeUpdate(qry); 
             undel++;
            }
              }
        }
        
        Set set=new TreeSet();
        for(int i=0;i<to.length;i++)
        {
            set.add(to[i]);
        }
        int scnt=set.size();
        int tol=to.length;
        int dif=tol-scnt;
        int uper=(scnt*100)/tol;
        int udrate=(undel*100)/tol;
        String effect="",typ="";
        if(uper==100 && udrate==0)
        {
            effect="no spam";
            typ="non spammer";
        }
        else if(uper>=90 && uper<100 && udrate>0 && udrate<=10)
        {
            effect="less";
            typ="spammer";
        }
        else if(uper>=80 && uper<90 && udrate>10 && udrate<=20)
        {
            effect="medium";
            typ="spammer";
        }
        else
        {
            effect="high";
            typ="spammer";
        }
//        rs1=st.executeQuery("select * from monitor where mfrom='"+h1+"');
//        while(rs1.next()){
//            String s=rs1.getString("mfrom");
//        }
        String qry="insert into monitor values('"+h1+"','"+t1+"',"+uper+","+del+","+undel+",'"+mdate+"','"+time+"','"+effect+"','"+typ+"','"+udrate+"','active')";
        st.executeUpdate(qry); 
        request.setAttribute("chk", "chk");
        request.setAttribute("mes", "Mail Sent");
       RequestDispatcher rd=request.getRequestDispatcher("Send.jsp");
    rd.forward(request, response);
            }
                }else{
                    request.setAttribute("chk", "chk");
        request.setAttribute("mes", "Invalid format not able to upload");
       RequestDispatcher rd=request.getRequestDispatcher("Send.jsp");
    rd.forward(request, response);
                }
       // int len1=spamw.length;
      
   
    }
}
else{
    
}
        }catch(Exception e){
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
