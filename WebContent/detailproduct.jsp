<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*" import="beans.Product" import="dao.ProductDao"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
td{
width : 50px;
text-align :center;
}
#button{

margin-top :30px;
background-color :#9999ff;
width :400px;
height :50px;
font-size : 25px;
font-weight :bold;
color :red;

}
body{
background-color :#F0F8FF;}
#button:hover{
background-color : #87CEFA;
color : green;
}
</style>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
System.out.println(id);
Connection con=(Connection)application.getAttribute("con");
Product p=ProductDao.getProductbyid(con ,id);
request.setAttribute("p",p);
%>
<div style="height :50px; width : auto; background-color :#F0F8FF; margin:100px auto;">
</div>

<div style="margin : 0px auto; width :1000px; height:600px;border:2px solid #F5F5DC;background-color:white; box-shadow : 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);">
<div style="height :500px; width:400px;margin:0px; float:left; margin-left:40px;">
<img src=images/product/${p.getImage()} height="500px" width="400px">

</div>
<div style="height :500px; width:500px; float:left; margin:0px;">
<table  height="500px" width="500px">
<tr>
<td><h4>PRODUCT ID    :</h4></td>
<td><p>${p.getId()}</p></td>
</tr>
<tr>
<td><h4>PRODUCT NMAE   :</h4></td>
<td><p>${p.getName()}</p></td>
</tr>
<tr>
<td><h4>PRODUCT PRICE   :</h4></td>
<td><p>${p.getPrice()}</p></td>
</tr>
<tr>
<td><h4>QUANTITY AVAILABLE   :</h4></td>
<td><p>${p.getQuantity()}</p></td>
</tr>
<tr>
<td><h4>DESCRIPTION    :</h4></td>
<td><p>${p.getDescription()}</p></td>
</tr>



</table>
</div>
<form action="addtocart.jsp?id=${p.getId()}" >
<center><div>
 <P STYLE="COLOR : RED; FONT-SIZE :20PX;;">QUANTITY</P>
<select name="quantity" WIDTH="500PX" HEIGHT="25PX">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">6</option>
<option value="5">7</option>
<option value="5">8</option>
<option value="5">9</option>
<option value="5">10</option>
</select>
</div>
</center>
<INPUT TYPE="hidden" name="id" value="${p.getId()}">
<CENTER><input type="submit"
 value="ADD TO CART" id="button"/></CENTER>


</form>
</div>
<div style="height :400px; width : auto; background-color :#F0F8FF;">
</div>






</body>
<%@include file="footer.jsp" %>
</html>