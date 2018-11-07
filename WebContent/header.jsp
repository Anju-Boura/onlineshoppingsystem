<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/online_shoppingsite/style.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
ul li ul li{
	color :#fff ;
	clear :left;
	width:40px;;
	
	
}
ul li ul li{
	dissplay : none;
	
}
ul li:hover ul li{
	display : block;
	background-color:#6495ED;
	border : 1px solid #fff;
	width : 100px;
	height :45px;
	padding-top : 10px;
	line-height :20px;
}

.topnav {
	
  margin-left:0px;
  background-color:black;
  overflow :hidden;
  
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: BLUE;
}

.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}



@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}





</style>
<script>

</script>
</head>
<body>
<nav style="position:fixed;top:0px;z-index:999; height:300px;width:100%;">
<div >
<div id="upper">


<div id="searchblock">
<form id="search-form_3" action="searchproduct.jsp">
<input type="text" class="search_3" placeholder="search here......." name="search"/>
<input type="submit" class="submit_3" value="Search" />
</form>
</div>
<div id="links">
<ul >



<%
String s=(String)session.getAttribute("activeuser");
if(s==null){
	%>
	
	<li><a href="registration.html">LOGIN</a></li>
<%
	
}
else{
%>
<li><a href="#"><%String name=(String)session.getAttribute("activeuser");
out.println(name.toUpperCase());%></a></li>
<li><a href="#">PROFILE</a>
   <ul>
   <li><a href="viewprofile.jsp">VIEW PROFILE</a></LI>
    <li><a href="Logout">LOGOUT</a></li>
    
    </ul>
</li>
<%
}%>

<li><a href="home.jsp">HOME</a></li>

</ul>
</div>
</div>

<div class="topnav" id="myTopnav">
  <a href="Displayproducts.jsp?number=1" class="active">MEN</a>
  <a href="Displayproducts.jsp?number=2">WOMEN</a>
  <a href="Displayproducts.jsp?number=3">ELECTRONICS & GADGETS</a>
  <a href="Displayproducts.jsp?number=4">KIDS</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
  
  <a href="showcart.jsp" id="cart" ><img  src="images/cart.png" height="20px" width="20px">CART</a>
  
</div>
</div>
</nav>


</body>
</html>