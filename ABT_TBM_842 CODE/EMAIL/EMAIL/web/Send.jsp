<%@page import="java.util.Random"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Compose Mail</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
</head>

<body>

<header>
    <div class="container">
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

<div class="main-box">
<div class="container">
<div class="inside">

<%
String name=(String)session.getAttribute("name");
String mail=(String)session.getAttribute("mail");
String chk=(String)request.getAttribute("chk");
String mes="";

if(chk!=null){
    mes=(String)request.getAttribute("mes");
}

Random random = new Random();
int randomInt = random.nextInt(1000000);
%>

<!-- ? FIX: enctype added -->
<form action="sends" method="post" enctype="multipart/form-data">

<center>

<input type="hidden" name="h1" value="<%=mail%>"/>

<h2>COMPOSE MAIL</h2>

<table width="760" border="1" style="background-color:#E5E5E5">

<tr>
<td>

<table width="754" border="0">

<tr>
<td><strong>TO</strong></td>
<td><input type="text" name="t1" style="width: 550px;height:40px;" /></td>
</tr>

<tr>
<td><strong>SUBJECT</strong></td>
<td><input type="text" name="t2" style="width: 550px;height:40px;" /></td>
</tr>

<tr>
<td><strong>MESSAGE</strong></td>
<td><textarea name="t3" rows="7" cols="66"></textarea></td>
</tr>

<tr>
<td><strong>ATTACHMENT</strong></td>
<td><input type="file" name="t4" style="width: 550px;height:40px;" /></td>
</tr>

<tr>
<td><strong>SECURITY CODE</strong></td>
<td><input type="text" name="t5" value="<%=randomInt%>" readonly /></td>
</tr>

<tr>
<td></td>
<td>
<!-- ? FIX: name="b1" important -->
<input type="submit" name="b1" value="Send" />
<input type="reset" value="Discard" />
</td>
</tr>

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

</body>
</html>