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
    	<h4><a href="index.jsp">  </a></h4><h1><a href="index.jsp">  </a></h1>
      <nav>
        <ul>
        <li><a href="Admin.jsp">Home</a></li>
          <li><a href="accounts.jsp">User</a></li>
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
        <form action="spammer" method="post">
<%
String chk=(String)request.getAttribute("chk");
String mes="";
if(chk!=null)
{
    mes=(String)request.getAttribute("mes");
} 
Connection con=null;
    Statement st=null;
    ResultSet rs=null;  
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spam","root","root");
st=con.createStatement();        
%>
        <center>

        <h2>CONTROL PANEL</h2>
        <br />
<h2>SUSPICIOUS ACCOUNTS</h2>
<table width="823" height="120" border="1" style="background-color:#E5E5E5">
  <tr>
    <td width="815" height="114">

        <table width="817" height="91" border="1" >
           <tbody>
                <tr>
                  <td width="204" height="27" bgcolor="#55AA00" class="aligncenter"><span class="style1">ACCOUNT</span></td>
                    <td width="206" bgcolor="#55AA00" class="aligncenter"><span class="style1">ACTIVITY DATE</span></td>
                    <td width="368" bgcolor="#55AA00" class="aligncenter"><span class="style1">ACTIVITY TIME</span></td>
					<td width="368" bgcolor="#55AA00" class="aligncenter"><span class="style1">SELECT FOR DETAILS</span></td>
                </tr>
            
<%String from="",sub="",mess="",merg="";
 String temp="none";
 rs=st.executeQuery("select * from monitor where kind='spammer' and stat='active' order by mdate desc,mtime desc");
 while(rs.next())
 {
     if(!temp.equals(rs.getString(1))){
          from=rs.getString(1);
          temp=rs.getString(1);
     }else{
     from="";
     }
     sub=rs.getString(6);
     mess=rs.getString(7);
     merg=from+"!"+sub+"!"+mess;
     %>
	 <tr style="border:thin; border-bottom-color:#990000;">
                    <td  class="aligncenter"  ><%=from%></td>
                    <td class="aligncenter" ><%=sub%></td>
                    <td class="aligncenter" ><%=mess%></td>
					<td class="aligncenter" ><input type="radio" name="r1" value="<%=merg%>"></td>
</tr>

<%
 }
%>    
</tbody>
</table>
</td>
  </tr>
</table>
<br />
<input type="submit" name="v" value="View Details" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge; " />
<br/> <br />
<%String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="";
String tot[];
if(request.getParameter("v")!=null)
{
  if(request.getParameter("r1")!=null)
{
    String spl[]=request.getParameter("r1").split("!");
    System.out.println(request.getParameter("r1"));
    System.out.println(spl[0]+" "+spl[1]+" "+spl[2]);
    rs=st.executeQuery("select * from monitor where mfrom='"+spl[0]+"' and mdate='"+spl[1]+"' and mtime='"+spl[2]+"'");
    if(rs.first())   
{
        s1=rs.getString(1);
         s2=rs.getString(2);
         tot=s2.split(",");
         String tlen=Integer.toString(tot.length);
          s3=rs.getString(3);
           s4=rs.getString(4);
            s5=rs.getString(5);
             s6=rs.getString(6);
              s7=rs.getString(7);
               s8=rs.getString(8);
                s9=rs.getString(9);
                 s10=rs.getString(10);
%>
<table width="508" height="354" border="1" style="background-color:#E5E5E5" >
  <tr>
    <td width="473" height="312"> <br />
<table width="489" height="315" border="0">
    <tbody>
        <tr>
		<td width="35"></td>
            <td width="195"><strong>ACCOUNT</strong></td>
            <td width="4"></td>
            <td width="237"><input type="text" name="t1" value="<%=s1%>" /></td>
        </tr>
        <tr>
		<td></td>
            <td><strong>TOTAL MAILS</strong></td>
            <td></td>
            <td><input type="text" name="t2" value="<%=tlen%>" /></td>
        </tr>
         <tr>
		 <td></td>
            <td><strong>DATE</strong></td>
            <td></td>
            <td><input type="text" name="t3" value="<%=s6%>" /></td>
        </tr>
         <tr>
		 <td></td>
            <td><strong>TIME</strong></td>
            <td></td>
            <td><input type="text" name="t4" value="<%=s7%>" /></td>
        </tr>
         <tr>
		 <td></td>
            <td><strong>DELIVERED MAILS</strong></td>
            <td></td>
            <td><input type="text" name="t5" value="<%=s4%>" /></td>
        </tr>
         <tr>
		 <td></td>
            <td><strong>UNDELIVERED MAILS</strong></td>
            <td></td>
            <td><input type="text" name="t6" value="<%=s5%>" /></td>
        </tr>
         <tr>
		 <td></td>
            <td><strong>UNIQUENESS PERCENTAGE</strong></td>
            <td></td>
            <td><input type="text" name="t7" value="<%=s3%>" /></td>
        </tr>
         <tr>
		 <td></td>
            <td><strong>UNDELIVERED PERCENTAGE</strong></td>
            <td></td>
            <td><input type="text" name="t8" value="<%=s10%>" /></td>
        </tr>
         <tr>
		 <td></td>
            <td><strong>SPAMMING TYPE</strong></td>
            <td></td>
            <td><input type="text" name="t9" value="<%=s8%>" /></td>
        </tr>
         <tr>
		 <td></td>
            <td><strong></strong></td>
            <td></td>
            <td>
                <input type="submit" name="b1" value="Block Account" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge; " />
                <input type="submit" name="b2" value="Do Nothing" style="height:35px; width:85px; background-color:#6DB44B; border-bottom-style:ridge; " />
            </td>
        </tr>
    </tbody>
</table>
</td>
  </tr>
</table>
<%
}
    else
{
      chk="chk";
      mes="Activity doesn't exists";
}  
    
}
else
{
      chk="chk";
      mes="Select a field to view";
}      
}
%>
<%
if(request.getParameter("b2")!=null)
{
     chk="chk";
      mes="No Action Taken";
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
