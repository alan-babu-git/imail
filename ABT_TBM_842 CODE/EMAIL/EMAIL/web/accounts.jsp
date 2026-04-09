<%@page import="java.sql.*"%>
<%@page import="dataset.AESDecryption"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>User Accounts</title>
  <meta charset="utf-8">

  <link rel="stylesheet" href="css/style.css" type="text/css">

  <style>
    body {
      font-family: Arial;
    }

    /* ? REMOVE DOTS */
    nav ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    nav ul li {
      display: inline;
      margin-right: 25px;
    }

    nav ul li a {
      text-decoration: none;
      color: green;
      font-weight: bold;
    }

    table {
      border-collapse: collapse;
    }

    td {
      padding: 8px;
      text-align: center;
    }

    .header {
      background-color: #55AA00;
      color: white;
      font-weight: bold;
    }

    .btn {
      height: 35px;
      width: 100px;
      background-color: #6DB44B;
      border: none;
      cursor: pointer;
      font-weight: bold;
    }
  </style>
</head>

<body>

<header>
  <div style="text-align:right; padding:10px;">
    <nav>
      <ul>
        <li><a href="Admin.jsp">Home</a></li>
        <li><a href="spammers.jsp">Control</a></li>
        <li><a href="index.jsp">Signout</a></li>
      </ul>
    </nav>
  </div>
</header>

<div style="text-align:center; margin-top:30px;">

<form action="account" method="post">

<%
String chk=(String)request.getAttribute("chk");
String mes="";
if(chk!=null)
{
    mes=(String)request.getAttribute("mes");
}

// DB connection
Connection con=null;
Statement st=null;
ResultSet rs=null;

Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spam","root","root");
st=con.createStatement();

// ? Decryption object
AESDecryption des = new AESDecryption();
%>

<h2>USER ACCOUNTS</h2>

<table border="1" align="center" style="background:#E5E5E5">

<tr class="header">
<td>MAIL ID</td>
<td>USER NAME</td>
<td>GENDER</td>
<td>DOB</td>
<td>ADDRESS</td>
<td>PINCODE</td>
<td>CONTACT</td>
<td>STATUS</td>
<td>SELECT</td>
</tr>

<%
rs = st.executeQuery("select * from signup");

while(rs.next())
{
    String t1 = rs.getString(1);
    String t2 = rs.getString(2);
    String t3 = rs.getString(3);
    String t4 = rs.getString(4);
    String t5 = rs.getString(5);
    String t6 = rs.getString(6);
    String t7 = rs.getString(7);
    String t8 = rs.getString(9);
%>

<tr>
<td><%= (t7!=null)?des.toDeycrypt(t7):"" %></td>
<td><%= (t1!=null)?des.toDeycrypt(t1):"" %></td>
<td><%= (t2!=null)?des.toDeycrypt(t2):"" %></td>
<td><%= (t3!=null)?des.toDeycrypt(t3):"" %></td>
<td><%= (t4!=null)?des.toDeycrypt(t4):"" %></td>
<td><%= (t5!=null)?des.toDeycrypt(t5):"" %></td>
<td><%= (t6!=null)?des.toDeycrypt(t6):"" %></td>
<td><%= t8 %></td>
<td><input type="radio" name="r1" value="<%=t7%>"></td>
</tr>

<%
}
%>

</table>

<br>

<input type="submit" name="b1" value="Activate" class="btn">

<h3><%=mes%></h3>

</form>

</div>

</body>
</html>