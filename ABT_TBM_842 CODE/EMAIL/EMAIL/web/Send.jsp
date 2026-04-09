<%@page import="java.util.Random"%>
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
        <form action="sends" method="post">
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
    
    
    
}     int randomInt = 0;
                Random randomGenerator = new Random();
                for (int idx = 1; idx <= 10; ++idx) {
                    randomInt = randomGenerator.nextInt(1000000);

                }       
%>
        <center>
            <input type="hidden" name="h1" value="<%=mail%>"/>
      <br />
        <h2>COMPOSE MAIL</h2>
		<table width="760" height="218" border="1" style="background-color:#E5E5E5">
  <tr>
    <td width="750" height="141">
        <table width="754" height="460" border="0">
            <tbody>
			<tr>
				<td width="16" height="26"></td>
                    <td width="125"><strong></strong></td>
                    <td width="7"></td>
                    <td width="588"></td>
                </tr>
                <tr>
				<td width="16" height="67"></td>
                    <td width="125"><strong>TO</strong></td>
                    <td width="7"></td>
                    <td width="588">
                      <div align="left">
                        <input type="text" name="t1" value="" style="width: 550px;height:40px;" />
                        </div></td>
                </tr>
                <tr>
				<td width="16" height="73"></td>
                    <td><strong>SUBJECT</strong></td>
                    <td></td>
                    <td>
                      <div align="left">
                        <input type="text" name="t2" value="" style="width: 550px;height:40px;" />
                        </div></td>
                </tr>
                <tr>
				<td width="16" height="140"></td>
                    <td><strong>MESSAGE</strong></td>
                    <td></td>
                    <td>
                      <div align="left">
                        <textarea name="t3" rows="7" cols="66"></textarea>
                        </div></td>
                </tr>
                 <tr>
				<td width="16" height="45"></td>
                    <td><strong>SUBJECT</strong></td>
                    <td></td>
                    <td>
                      <div align="left">
                        <input type="file" name="t4" value="" style="width: 550px;height:40px;" />
                        </div></td>
                </tr>
                  <tr>
				<td width="16" height="54"></td>
                    <td><strong>SECURITY CODE</strong></td>
                    <td></td>
                    <td>
                      <div align="left">
                        <input type="text" name="t5" value="<%=randomInt%>" style="width: 250px;height:40px;" readonly="true"/>
                        </div></td>
                </tr>
                <tr>
				<td width="16"></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input type="submit" name="b1" value="Send" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge; " />
                        <input type="reset" name="reset" value="Discard" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge; " />                    </td>
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
