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
          <form action="Pass" method="post">
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
}         
    
%>
        <center>
             <input type="hidden" name="h1" value="<%=mail%>" />
        <h2>WELCOME <%=nme%></h2>
        
        <br />
        <h2>CHANGE PASSWORD</h2>
		<table width="405" height="159" border="1" style="background-color:#E5E5E5">
  <tr>
    <td width="395" height="141">
        <table width="367" height="164" border="0">
            <tbody>
			<tr>
				<td width="27" height="20"></td>
                    <td width="149"></td>
                    <td width="13"></td>
                    <td width="160"></td>
                </tr>
                <tr>
				<td width="27"></td>
                    <td width="149"><strong>CURRENT PASSWORD</strong></td>
                    <td width="13"></td>
                    <td width="160"><input type="password" name="t1" value="" /></td>
                </tr>
                <tr>
				<td></td>
                    <td><strong>NEW PASSWORD</strong></td>
                    <td></td>
                    <td><input type="password" name="t2" value="" /></td>
                </tr>
                
                <tr>
				<td></td>
                    <td><strong></strong></td>
                    <td></td>
                    <td><input type="submit" name="b1" value="Update" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge;" /></td>
                </tr>
            </tbody>
        </table>
             
        <h3><%=mes%></h3>
      </td>
  </tr>
</table>
                
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
