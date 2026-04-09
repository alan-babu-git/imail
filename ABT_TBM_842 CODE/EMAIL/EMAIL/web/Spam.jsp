<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Privacy policy - Privacy policy Page | Design Company - Free Website Template from Templatemonster.com</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
  <script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
  <script type="text/javascript" src="js/cufon-yui.js"></script>
  <script type="text/javascript" src="js/Humanst521_BT_400.font.js"></script>
  <script type="text/javascript" src="js/Humanst521_Lt_BT_400.font.js"></script>
  <script type="text/javascript" src="js/cufon-replace.js"></script>
	<script type="text/javascript" src="js/roundabout.js"></script>
  <script type="text/javascript" src="js/roundabout_shapes.js"></script>
  <script type="text/javascript" src="js/gallery_init.js"></script>
  <!--[if lt IE 7]>
  	<link rel="stylesheet" href="css/ie/ie6.css" type="text/css" media="all">
  <![endif]-->
  <!--[if lt IE 9]>
  	<script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/IE9.js"></script>
  <![endif]-->
  <style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
-->
  </style>
</head>

<body>
  <!-- header -->
  <header>
    <div class="container">
    	<h4><a href="index.jsp">  </a></h4><h1><a href="index.jsp"> </a></h1>
      <nav>
        <ul>
        <li><a href="User.jsp">Home</a></li>
        <li><a href="Profile.jsp">Profile</a></li>
          <li><a href="Send.jsp">Compose</a></li>
<li><a href="Inbox.jsp">Inbox</a></li>
<li><a href="Outbox.jsp">Outbox</a></li>
<li><a href="Spam.jsp">Spam</a></li>
<li><a href="index.jsp">Signout</a></li>
        </ul>
      </nav>
    </div>
	</header>
  <!-- #gallery -->
  
  <!-- /#gallery -->
  <div class="main-box">
    <div class="container">
      <div class="inside">
        <form action="Spam.jsp" method="post">
<%
String name=(String)session.getAttribute("name");
String mail=(String)session.getAttribute("mail");
String pass=(String)session.getAttribute("pass");
String chk=(String)request.getAttribute("chk");

String mes="";
if(chk!=null)
{
    mes=(String)request.getAttribute("mes");
}  

  
%>
        <center>

       <br />
        
<br />
<h2><b>SPAM</b></h2>
        <table width="823" height="107" border="1" style="background-color:#E5E5E5">
  <tr>
    <td width="815">

        <table width="817" height="82" border="1" >
           <tbody>
                <tr>
				 <td width="368" bgcolor="#55AA00" class="aligncenter"><span class="style1">Delete</span></td>
                  <td width="204" height="27" bgcolor="#55AA00" class="aligncenter"><span class="style1">TO</span></td>
                    <td width="206" bgcolor="#55AA00" class="aligncenter"><span class="style1">SUBJECT</span></td>
                    <td width="368" bgcolor="#55AA00" class="aligncenter"><span class="style1">MESSAGE</span></td>
                   
                </tr>
                
           
<%String to="",sub="",mess="";
try
	{    

            String a11=null,a12="",a13="";
             	   HttpSession so = request.getSession(true);
 System.out.println("select * from mails where mto='"+name+"' and typ='spam' order by mdate desc,mtime desc");
		int flag=0;  

		String url="jdbc:mysql://localhost:3306/spam";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1=DriverManager.getConnection(url,"root","root");
		Statement st1=con1.createStatement();


 ResultSet rs=st1.executeQuery("select * from mails where mto='"+mail+"' and typ='spam' order by mdate desc");
 while(rs.next())
 {
     to=rs.getString(2);
     sub=rs.getString(3);
     mess=rs.getString(4);
     %>
<tr style="border:thin; border-bottom-color:#990000;">
 <td class="aligncenter" ><input type="radio" name="delete" Value="<%=rs.getString(1)%>" /></td>
                    <td  class="aligncenter"  ><%=to%></td>
                    <td class="aligncenter" ><%=sub%></td>
                    <td class="aligncenter" ><%=mess%></td>
                   
</tr>
<%
} }catch(Exception e){
            e.printStackTrace();
        }
%>  


</tbody>
</table>
</td>
  </tr><tr><td align="center"><input type="submit" name="Delete" Value="Delete" /><strong></strong></td></tr>
</table>
<%


        try {
                String url = "jdbc:mysql://localhost:3306/spam";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con1 = DriverManager.getConnection(url, "root", "root");
                Statement st1 = con1.createStatement();
                String a11 = null, a12 = "", a13 = "";
                HttpSession so = request.getSession(true);
                System.out.println(a11);
                int flag = 0;

                if (request.getParameter("Delete") != null) {
                    String qry1 = "delete from mails where id='" + request.getParameter("delete") + "'";
                    int v = st1.executeUpdate(qry1);
                    if (v == 1) {
                        RequestDispatcher rd = request.getRequestDispatcher("Spam.jsp");
                        rd.forward(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Spam.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("Spam.jsp");
                    rd.forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }


%>
        <h3><%=mes%></h3>
      
                
    </center>
        </form>
   
      </div>
    </div>
  </div>
  <!-- footer -->
  <footer>
    <div class="container">
    	<div class="wrapper">
        <div class="fleft">Copyright - Type in your name here</div>
        <div class="fright"><!--<a rel="nofollow" href="http://www.templatemonster.com/" target="_blank">Website template</a> designed by TemplateMonster.com&nbsp; &nbsp; |&nbsp; &nbsp; <a href="http://templates.com/product/3d-models/" target="_blank">3D Models</a> provided by Templates.com--></div>
      </div>
    </div>
  </footer>
  <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
