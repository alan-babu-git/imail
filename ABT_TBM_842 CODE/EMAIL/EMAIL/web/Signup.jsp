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
      <script language="javascript" type="text/javascript" src="datetimepicker.js">

//Date Time Picker script- by TengYong Ng of http://www.rainforestnet.com
//Script featured on JavaScript Kit (http://www.javascriptkit.com)
//For this script, visit http://www.javascriptkit.com 

</script>
<script src="validation.js"></script>
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
       <form name="sign" action="Signup" method="post">
<%
String chk=(String)request.getAttribute("chk");
String mes="";
if(chk!=null)
{
    mes=(String)request.getAttribute("mes");
}         
%>
        <center>

        <h2 style="color:#60BF00;"><strong>SIGN UP</strong></h2>
		<table width="496" height="366" border="1" style="background-color:#E5E5E5" >
  <tr>
    <td><br />&nbsp;&nbsp;&nbsp;

       <table width="468" height="339" border="0">
                  <tbody>
                      <tr>
					  <td width=30></td>
                          <td width="131"><strong>USER NAME</strong></td>
                          <td width=15></td>
                          <td width="274">
                              <input type="text" name="t1" value="" style="width: 180px;"/>
                        </td>
                      </tr>
                      <tr>
					  <td width=30></td>
                          <td><strong>GENDER</strong></td>
                          <td width=15></td>
                          <td>
                              <input type="radio" name="t2" value="MALE" onClick="formValidation1();" onKeyUp="formValidation1();" />MALE
                              <input type="radio" name="t2" value="FEMALE" onClick="formValidation1();" onKeyUp="formValidation1();" />FEMALE
                          </td>
                      </tr>
                      <tr>
					  <td width=30></td>
                          <td><strong>DATE OF BIRTH</strong></td>
                          <td width=15></td>
                          <td>
                              <input id="demo1" type="text" size="22" name="demo1" value="" style="width: 160px;" readonly="readonly" />
                           <a href="javascript:NewCal('demo1','ddmmyyyy')"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" ></a>
                          </td>
                      </tr>
                      <tr>
					  <td width=30></td>
                          <td><strong>ADDRESS</strong></td>
                          <td width=15></td>
                          <td><textarea name="t3" onClick="formValidation2();" onKeyUp="formValidation2();" ></textarea></td>
                      </tr>
                      <tr>
					  <td width=30></td>
                          <td><strong>PIN CODE</strong></td>
                          <td width=15></td>
                          <td><input type="text" name="t4" value="" onClick="formValidation3();" onKeyUp="formValidation3();" style="width: 180px;"/></td>
                      </tr>
                      <tr>
					  <td width=30></td>
                          <td><strong>CONTACT NO</strong></td>
                          <td width=15></td>
                          <td><input type="text" name="t5" value="" onClick="formValidation4();" onKeyUp="formValidation4();"  style="width: 180px;"/></td>
                      </tr>
                      <tr>
					  <td width=30></td>
                          <td><strong>EMAIL ID</strong></td>
                          <td width=15></td>
                          <td><input type="text" name="t6" value="" onClick="formValidation5();" onKeyUp="formValidation5();" style="width: 180px;" /></td>
                      </tr>
                      <tr>
					  <td width=30></td>
                          <td><strong>PASSWORD</strong></td>
                          <td width=15></td>
                          <td><input type="password" name="t7" value="" style="width: 180px;" /></td>
                      </tr>
                      <tr>
					  <td width=30></td>
                          <td></td>
                          <td width=15></td>
                          <td>
                              <input type="submit" name="b1" value="Register" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge; " />
                              <input type="reset" name="reset" value="Back" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge; " />
                          </td>
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
