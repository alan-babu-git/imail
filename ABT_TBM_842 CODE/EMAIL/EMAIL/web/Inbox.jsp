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
       <form action="inbox" method="post">
              <%
   String ok="";
      String ok1="";
   String msg="",msg1="";
      String a1="";
	  String a2="";
	  String a3="";        
   	  String a4=""; 
	  		  String a5="";  
			   String a6=""; 
			   ok=(String)request.getAttribute("ok");
			   ok1=(String)request.getAttribute("ok1");
     String un="";
   if(ok!=null)
   {
  a1=(String)request.getAttribute("a1");
  a2=(String)request.getAttribute("a2");
    a3=(String)request.getAttribute("a3");
	 a4=(String)request.getAttribute("a4");
	 msg=(String)request.getAttribute("msg");
   }
    if(ok1!=null)
   {
  msg1=(String)request.getAttribute("msg1");
	 a5=(String)request.getAttribute("aa");
	  a6=(String)request.getAttribute("aa1");
   }
    %>
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
Connection con=null;
    Statement st=null;
    ResultSet rs=null,rs4=null;  
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spam","root","root");
st=con.createStatement();  
%>
        <center>

       <br />
        <h2><b>INBOX</b></h2>
		
<table width="865" height="147" border="1" style="background-color:#E5E5E5">
  <tr>
    <td width="855" height="141">

        <table width="873" height="91" border="1" >
           <tbody>
                <tr>
                  <td width="88" height="27" bgcolor="#55AA00" class="aligncenter"><span class="style1">FROM</span></td>
                    <td width="103" bgcolor="#55AA00" class="aligncenter"><span class="style1">SUBJECT</span></td>
                    <td width="358" bgcolor="#55AA00" class="aligncenter"><span class="style1">MESSAGE</span></td>
                       <td width="119" bgcolor="#55AA00" class="aligncenter"><span class="style1">FILE</span></td>
					 <td width="171" bgcolor="#55AA00" class="aligncenter"><span class="style1">VOICE</span></td>
                </tr>
        
            
<%
int i2=0;
  rs4=st.executeQuery("select COUNT(typ) from mails WHERE mto='"+mail+"'and typ='spam' ");
            if(rs4.next())
            {
               i2=Integer.parseInt(rs4.getString(1));
            }
            if(i2>=20){ out.println("<H3><B>Please delete Spam Mail Contain more than 20 mail</B></h3> ");
            
            }else{
String from="",sub="",mess="";

 rs=st.executeQuery("select * from mails where (mto='"+mail+"' or (mfrom='"+mail+"' and typ='undelivered' ))and (typ!='spam') order by mdate desc,mtime desc limit 10");
 while(rs.next())
 {
     from=rs.getString(2);
     sub=rs.getString(4);
     mess=rs.getString(5);
     %>
<tr style="border:thin; border-bottom-color:#990000;">
    
                    <td  class="aligncenter"  ><%=from%></td>
                    <td class="aligncenter" ><%=sub%></td>
                    <td class="aligncenter" ><%=mess%></td><TD><BUTTON name="t3"  value="<%=rs.getString(1)%>"  >FILE</BUTTON> </TD><input name="s3" type="hidden"  Value="<%=msg%>" id="text-to-speech" >
						<td width="171"><div align="center"><label><BUTTON name="t2" onClick="textToAudio()" value="<%=rs.getString(1)%>" id="text-to-speech" >VOICE PROCESS</BUTTON></label>
          <label></label>
      </div></td>
</tr>
<%
 }}
%>    
</tbody>
</table><%if(request.getParameter("t3")!=null){%>
<table width="296" border="1" bordercolor="#009933">
  <tr><input name="a1" type="hidden" value="<%=request.getParameter("t3")%>">
    <td width="91"><strong>Access Code </strong></td>
    <td width="15">&nbsp;</td>
    <td width="168"><input name="a2" type="text" value=""></td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><input name="t4" type="submit" value=" DOWNLOAD"></td>
  </tr>
 
</table>
<%}%>
</td>
  </tr>
</table>  <script>
			/* JS comes here */
            function textToAudio() {
                let msg = document.getElementById("text-to-speech").value;
                
                let speech = new SpeechSynthesisUtterance();
                speech.lang = "en-US";
                
                speech.text = msg;
                speech.volume = 1;
                speech.rate = 1;
                speech.pitch = 1;
                
                window.speechSynthesis.speak(speech);
            }
		</script>
<br />
 
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
