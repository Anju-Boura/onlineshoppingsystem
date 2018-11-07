<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<STYLE>
body{
margin :0px;

}

button{
height :40px;
width :80px;
background-color:orange;
color : green;
font-size:20px;
}
H1{
TEXT-align :center;
color : red;}
button{
height :40px;
width :80px;
background-color:orange;
color : green;
font-size:12px;
font-weight :bold;

}
button:hover{
background-color : blue;
color :red;
}
#buy{

margin-top :30px;
background-color :#9370DB;
width :200px;
height :50px;
font-size : 25px;
font-weight :bold;
color :red;
box-shadow : 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);

}

</STYLE>
</head>
<body>
<div style="height :70px; width : auto; background-color :#F0F8FF; margin-top:110px;">
<H1>YOUR CART</H1>
</div>
<CENTER>
<table class="table" style="width:800px; margin-top:40px;">
<thead  class="thead-light">
<tr>
<th>PRODUCT ID</th>
<th>NAME</th>
<th>PRICE</th>
<th>QUANTITY</th>
<th>IMAGE</th>
<th></th>
</tr>
</thead >
<tbody>


<c:set var="sum"  scope="session" value="0"/>
<c:forEach var="i" items="${sessionScope.cart}">
<c:set  var="sum" value="${sum+i.p.getPrice()*i.getQuantity()}" scope="session"/> 
<tr >
<td >${i.p.getId()}</td>
<td>${i.p.getName()}</td>
<td>${i.p.getPrice()}</td>
<td>${i.getQuantity()}</td>
<td><img src=images/product/${i.p.getImage()} height="50px" width="100px"></td>
<td><a href="removefromcart.jsp?id=${i.p.getId()}"  onclick="return confirm('ARE YOU SURE  ?..THAT YOU WANT TO REMOVE THIS');"><button type="button">REMOVE</button></a></td>  
</tr>



</c:forEach>
<tr>
<td colspan="6"  height="50px">
<center><h2 style="color:#cc33ff">TOTAL   :<c:out value="${sum}"/></h2></center>

</td>
</tr>
<tbody>
</table>
</CENTER>
<div style="height :100px; width : auto; background-color :#F0F8FF; margin-top :-10px; text-align:center;">

<a href="buy.jsp"><button  id="buy" type="button">BUY</button></a>

</div>
</body>
<%@include file="footer.jsp" %>
</html>