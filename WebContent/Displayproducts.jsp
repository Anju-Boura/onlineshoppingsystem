<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.*" import="beans.Product" import="dao.ProductDao"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  <%@include file="header.jsp" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#F5FFFA">
<div>
<div style="height :50px; width : auto; background-color :#F0F8FF; margin-top :100px;">
</div>
<%
int number=Integer.parseInt(request.getParameter("number"));
System.out.println(number);
Connection con=(Connection)application.getAttribute("con");
List<Product> list=ProductDao.getAllProducts(con ,number);
request.setAttribute("list",list);  
%>
<div style="margin:auto; width :1170px; overflow:auto;">
<c:forEach items="${list}" var="p">
<a href="detailproduct.jsp?id=${p.getId()}">
<div id="card" style="height :400px; width :320px; float:left; margin-right:60px; margin-top :60px; border:2px solid #ADD8E6; box-shadow : 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);">
  <img src=images/product/${p.getImage()}     alt="Avatar" height="300px" width="290px" style=" padding-left:15px; ">
  <div id="container">
    <center><h3><b>${p.getName()}</b></h4>
    <p style="color :#FF0000; font-size :20px; font-weight:900;">Rs. ${p.getPrice()}</p> </center> 
  </div>
</div>
</c:forEach>

</a>
</div>


<div style="height:200px;">
</div>





</body>
<%@include file="footer.jsp" %>>






</html>