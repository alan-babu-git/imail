<%@page import="dataset.AESDecryption"%>
<%@page import="dataset.AesEncryption"%>
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
String chk=(String)request.getAttribute("chk");
String nme=name.toUpperCase();
String mes="";
if(chk!=null)
{
    mes=(String)request.getAttribute("mes");
}     AesEncryption aes=new AesEncryption();AESDecryption des=new AESDecryption();    
Connection con=null;
    Statement st=null;
    ResultSet rs=null;  
Class.forName("com.mysql.jdbc.Driver");
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
        
        <br />
        <h2>PROFILE INFORMATION</h2>
		<table width="456" height="348" border="1" style="background-color:#E5E5E5">
  <tr>
    <td width="298" height="141">
        <table width="375" height="288" border="0">
            <tbody>
			<tr>
			<td width="24"></td>
                    <td width="129" height="24"></td>
                    <td width="18"></td>
                    <td width="186"></td>
                </tr>
                <tr>
				<td width="24"></td>
                    <td width="129"><strong>USER NAME</strong></td>
                    <td width="18"></td>
                    <td width="186"><input type="text" name="t1" value="<%=t1%>" /></td>
                </tr>
                <tr>
				<td width="24"></td>
                    <td><strong>GENDER</strong></td>
                    <td></td>
                    <td><input type="text" name="t2" value="<%=t2%>" /></td>
                </tr>
                <tr>
				<td width="24"></td>
                    <td><strong>DATE OF BIRTH</strong></td>
                    <td></td>
                    <td><input type="text" name="t3" value="<%=t3%>" /></td>
                </tr>
                <tr>
				<td width="24"></td>
                    <td><strong>ADDRESS</strong></td>
                    <td></td>
                    <td><input type="text" name="t4" value="<%=t4%>" /></td>
                </tr>
                <tr>
				<td width="24"></td>
                    <td><strong>PIN CODE</strong></td>
                    <td></td>
                    <td><input type="text" name="t5" value="<%=t5%>" /></td>
                </tr>
                <tr>
				<td width="24"></td>
                    <td><strong>CONTACT</strong></td>
                    <td></td>
                    <td><input type="text" name="t6" value="<%=t6%>" /></td>
                </tr>
                <tr>
				<td width="24"></td>
                    <td><strong>MAIL ID</strong></td>
                    <td></td>
                    <td><input type="text" name="t7" value="<%=t7%>" readonly=""/></td>
                </tr>
                <tr>
				<td width="24"></td>
                    <td><strong></strong></td>
                    <td></td>
                    <td><input type="submit" name="b1" value="Update Profile" style="height:35px; width:100px; background-color:#6DB44B; border-bottom-style:ridge;"/></td>
                </tr>
            </tbody>
        </table>
		 <br />
		<h3><%=mes%></h3>
		</td>
  </tr>
</table>
               
                <a href="Pass.jsp"><h3>CHANGE PASSWORD</h3></a>
        
      
                
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
