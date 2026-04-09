<%@page import="dataset.AesEncryption"%>
<%@page import="dataset.AESDecryption"%>
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
        <form action="User" method="post">
<%
String name=(String)session.getAttribute("name");
String mail=(String)session.getAttribute("mail");
String pass=(String)session.getAttribute("pass");

String nme=name.toUpperCase();
String mes="";
if(request.getAttribute("chk")!=null)
{
    mes=(String)request.getAttribute("mes");
}         
Connection con=null;
    Statement st=null;
    ResultSet rs=null;  
Class.forName("com.mysql.jdbc.Driver"); AesEncryption aes=new AesEncryption();AESDecryption des=new AESDecryption();
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spam","root","root");
st=con.createStatement();   
String t1="",t2="",t3="",t4="",t5="",t6="",t7="",t8="";
rs=st.executeQuery("select * from signup where mail='"+aes.toEncrypt(mail.getBytes())+"'");
while(rs.next())
{
    t1=des.toDeycrypt(rs.getString(1));
    t2=des.toDeycrypt(rs.getString(2));
    t3=des.toDeycrypt(rs.getString(3));
    t4=des.toDeycrypt(rs.getString(4));
    t5=des.toDeycrypt(rs.getString(5));
    t6=des.toDeycrypt(rs.getString(6));
    t7=des.toDeycrypt(rs.getString(7));
    t8=des.toDeycrypt(rs.getString(8));
}    
%>
        <center>
           <input type="hidden" name="h1" value="<%=mail%>" />

        <h2>WELCOME <%=nme%></h2>
        
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
      <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                
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
