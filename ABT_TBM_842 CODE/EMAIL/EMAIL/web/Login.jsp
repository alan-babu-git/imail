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
  	<link rel="stylesfheet" href="css/ie/ie6.css" type="text/css" media="all">
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
        <li><a href="index.jsp">Home</a></li>
          

        </ul>
      </nav>
    </div>
	</header>
  <!-- #gallery -->
  
  <!-- /#gallery -->
  <div class="main-box">
    <div class="container">
      <div class="inside">
       <form action="Login" method="post">
<%
String chk=(String)request.getAttribute("chk");
String mes="";
if(chk!=null)
{
    mes=(String)request.getAttribute("mes");
}         
%>
      <br /><br /><br /><br />
<table width="919" height="357" border="1">
  <tr>
  <td width="252"><img src="images/logo.PNG" height="171" width="220" />  </td>
  <td width="280"><img src="images/phone.jpg" height="300" width="350" /></td>
    <td width="365">
<h3>imail</h3>
       <table width="344" height="223" border="1" style="background-color:#E5E5E5" >
                  <tbody>
                      <tr>
                          <td width="25" >						  </td>
                          <td width=245><br /><strong>Email Id</strong><br/>
						<input type="text" name="t1" value="" style="margin: 0; 
	font: bold 1em Arial, Sans-serif; 
	border: 1px solid #CCC;
	background: #FFF; 
	padding: 5px 3px;
	color: #4284B0;	
        width: 220px;"/></td>
                          <td width="46">                          </td>
                      </tr>
                      <tr>
                          <td>
						  </td>
                          <td width=245><strong>Password</strong><br/>
					    <input type="password" name="t2" value="" style="margin: 0; 
	font: bold 1em Arial, Sans-serif; 
	border: 1px solid #CCC;
	background: #FFF; 
	padding: 5px 3px;
	color: #4284B0;	
        width: 220px;" /></td>
                          <td></td>
                      </tr>
                      <tr>
                        <td>
	  					  </td>
                          <td width=245><input type="submit" name="b1" value="Sign In" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge; " />	</td>
                          <td>
                              
                              
                          </td>
                      </tr>
                  </tbody>
              </table>
			   <h3><%=mes%></h3>
		    </td>
  </tr>
</table>
 
       
      
                
   
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
